# Ensure that the correct environment variables are sourced for all aliases

sed -i "s/source ~\/scripts\/4_env.sh/source ~\/scripts\/$V\_env.sh/" ~/.bashrc
sed -i "s/source ~\/scripts\/5_env.sh/source ~\/scripts\/$V\_env.sh/" ~/.bashrc
sed -i "s/source ~\/scripts\/6_env.sh/source ~\/scripts\/$V\_env.sh/" ~/.bashrc

# Generic aliases

alias la="ls -lart"
alias rgrep="grep -riIn"


# GPDB aliases

alias pg="ps aux | grep postgres | grep silent --color=no"
alias pg4="pg | grep '\-p 4' --color=no"
alias pg5="pg | grep '\-p 5' --color=no"
alias pg6="pg | grep '\-p 6' --color=no"
alias p0_psql="echo 'Connected to primary segment on port $PGP_P_0 with content id 0, dbid 2'; PGOPTIONS='-c gp_session_role=utility' psql -p $PGP_P_0"
alias p1_psql="echo 'Connected to primary segment on port $PGP_P_1 with content id 1, dbid 3'; PGOPTIONS='-c gp_session_role=utility' psql -p $PGP_P_1"
alias m0_psql="echo 'Connected to mirror segment on port $PGP_M_0 with content id 0, dbid 4'; PGOPTIONS='-c gp_session_role=utility' psql -p $PGP_M_0"
alias m1_psql="echo 'Connected to mirror segment on port $PGP_M_1 with content id 1, dbid 5'; PGOPTIONS='-c gp_session_role=utility' psql -p $PGP_M_1"
alias gpsc="psql -d postgres -c 'SELECT * FROM gp_segment_configuration ORDER BY dbid;'"

# Sourcing GPDB versions and switching directories after sourcing

code_A_to_B='for DIR in $GPDB4 $GPDB5 $GPDB6; do SUBSTR=`expr match "$PWD" "$DIR"`; if [ $SUBSTR != 0 ]; then cd $GPDB${PWD:$SUBSTR}; fi; done'
data_A_to_B='for DIR in 4 5 6; do SUBSTR=`expr match "$PWD" "$HOME/data/$DIR"`; if [ $SUBSTR != 0 ]; then cd $HOME/data/$V${PWD:$SUBSTR} 2> /dev/null || cd $MASTER_DATA_DIRECTORY; fi; done'

alias 4x=". ~/scripts/4_env.sh; $code_A_to_B; $data_A_to_B"
alias 5x=". ~/scripts/5_env.sh; $code_A_to_B; $data_A_to_B"
alias 6x=". ~/scripts/6_env.sh; $code_A_to_B; $data_A_to_B"
