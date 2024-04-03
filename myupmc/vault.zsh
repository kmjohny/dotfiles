export VAULT_ADDR=https://foo.vault.myupmc.io

SSH_KEY_PATH=$HOME/.ssh/id_ed25519.pub
SSH_ROLE=bastion-access

# vaultLogin Helper Function
# Log into Vault using your _adm Azure account
function vault_login() {
  vault login -method=oidc skip_browser=true
}

# signKey Helper Function
# Sign your public SSH key to get a user certificate signed by Vault in return
# Usage:
#   signKey -- signs your key specified in the above SSH_KEY_PATH variable
#   signKey ~/.ssh/id_upmce.pub -- signs the key passed in as an argument
function vault_signkey() {
  pubKeyPath="${1:-$SSH_KEY_PATH}"

  if cat $pubKeyPath | grep -q "OPENSSH PRIVATE KEY"; then
    echo "Error: File @ $pubKeyPath is a private key! Please try again with your public key."
    return 1
  fi

  pubKeyFile=$(basename $pubKeyPath)
  pubKeyDir=$(dirname $pubKeyPath)
  pubKeyName="${pubKeyFile%.*}"
  signedCertPath="$pubKeyDir/$pubKeyName-cert.pub"

  echo "Signing key at $pubKeyPath ..."

  vault write -field=signed_key \
        ssh-user-ca/sign/${SSH_ROLE}\
        public_key=@$pubKeyPath > $signedCertPath

  echo "Signed cert at $signedCertPath"
  ssh-keygen -Lf $signedCertPath | sed -n '/Valid/,/Critical/{/Critical/d;p;}'
}

# checkCert Helper Function
# Check the validity of an existing SSH user certificate
# Usage:
#   checkCert -- validates a certificate for the key specified in the above SSH_KEY_PATH variable
#   checkCert ~/.ssh/id_upmce.pub --  validates a certificate for the key passed in as an argument
function valut_checkcert() {
  pubKeyPath="${1:-$SSH_KEY_PATH}"

  pubKeyFile=$(basename $pubKeyPath)
  pubKeyDir=$(dirname $pubKeyPath)
  pubKeyName="${pubKeyFile%.*}"
  signedCertPath="$pubKeyDir/$pubKeyName-cert.pub"

  echo "Checking cert at $signedCertPath"

  exp_date=$(ssh-keygen -Lf $signedCertPath |grep Valid |cut -d " " -f 13)
  exp_date_epoch=$(date -jf "%Y-%m-%dT%H:%M:%S" $exp_date +%s)

  cur_date=$(date -j +%Y-%m-%dT%H:%M:%S)
  cur_date_epoch=$(date -j +%s)

  printf "Current Date: $cur_date \tExpiration Date: $exp_date\n"

  expired=1
  [[ $cur_date_epoch < $exp_date_epoch ]]
  expired=$?

  if (( expired == 0 )); then
    echo "Certificate valid until $(date -jf  "%Y-%m-%dT%H:%M:%S" $exp_date +"%a %b %d %r %Z" )"
  else
    echo "Certificate has expired"
  fi
}