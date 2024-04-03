#### MyUpmc functions ####
# Utility Function to open ssh tunnel through bastion host in each env for RDS access
# USAGE: rds_connect <ENV>
function rds_connect() {
    case $1 in
      dev)
        url=myupmc-dev-postgresql.cckblsctqdyd.us-east-1.rds.amazonaws.com
        host=bastion-dev
        ;;
      tst)
        url=myupmc-tst-postgresql.cjfxgpyh10rd.us-east-1.rds.amazonaws.com
        host=bastion-tst
        ;;
      stg)
        url=myupmc-stg-postgresql.csa1ikebxzqr.us-east-1.rds.amazonaws.com
        host=bastion-stg
        ;;
      prd)
        url=myupmc-prd-postgresql.cgqywmatb3ul.us-east-1.rds.amazonaws.com
        host=bastion-prd
        ;;
      *)
        echo "Invalid environment. Try Again."
        return;
        ;;
    esac

    echo "Environment: $1, Host: '${host}', RDS Endpoint: '${url}'."
    ssh -A -N -L 5432:${url}:5432 myupmc-dev@${host}

}