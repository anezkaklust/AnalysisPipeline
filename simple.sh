#!/bin/sh
#

# simple job wrapper
# Automatically generated by:
#          /opt/jobsub_lite/bin/jobsub_submit --group minerva --lines +SingularityImage="/cvmfs/singularity.opensciencegrid.org/fermilab/fnal-wn-sl7:latest" --resource-provides=usage_model=DEDICATED,OPPORTUNISTIC --role=Analysis --expected-lifetime 96h --memory 1500MB -f /pnfs/minerva/persistent/users/anezkak/1D_modelComparison//myareatar_tag_default_1701286675.tar.gz file:///minerva/app/users/anezkak/MAT_GitHub/eventLoop_NONE_wrapper_tag_default_1701286675.sh

umask 002


#
# clear out variables that sometimes bleed into containers
# causing problems.  See for example INC000001136681...
# 
#
for env_var in CPATH LC_CTYPE LIBRARY_PATH
do
   eval unset $env_var
done


if grep -q release.6 /etc/system-release
then
    : tokens do not work on SL6...
    unset BEARER_TOKEN_FILE
else



export BEARER_TOKEN_FILE=$PWD/.condor_creds/minerva_28c873f76c.use
#export BEARER_TOKEN_FILE=$PWD/.condor_creds/minerva.use



fi

set_jobsub_debug(){
    export PS4='$LINENO:'
    set -xv
}
[[ "$JOBSUB_DEBUG" ]] && set_jobsub_debug


cleanup_condor_dirs(){
if [[ -d "$_CONDOR_JOB_IWD" ]]; then
   find $_CONDOR_JOB_IWD -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} \;
fi
}

is_set() {
  [ "$1" != "" ]
  RSLT=$?
  return $RSLT
}

get_log_sizes() {
    total=$JOBSUB_MAX_JOBLOG_SIZE
    head=$JOBSUB_MAX_JOBLOG_HEAD_SIZE
    tail=$JOBSUB_MAX_JOBLOG_TAIL_SIZE

    if (( is_set $head) && ( is_set $tail )); then
         total=$(($head + $tail))
    elif ( is_set $total ); then
            if ((  is_set $head ) && (($total > $head))); then
                tail=$(($total - $head))
                total=$((head + tail))
            elif ((  is_set $tail ) && (($total > $tail))); then
                head=$(($total - $tail))
                total=$((head + tail))
            else
                head=$(( $total / 5 ))
                tail=$(( 4 * $total / 5))
            fi
    else
        total=5000000
        head=1000000
        tail=4000000
    fi
    export JOBSUB_MAX_JOBLOG_SIZE=$total
    export JOBSUB_MAX_JOBLOG_HEAD_SIZE=$head
    export JOBSUB_MAX_JOBLOG_TAIL_SIZE=$tail

}

jobsub_truncate() {
    get_log_sizes
    JOBSUB_LOG_SIZE=`wc -c $1 | awk '{print $1}'`
    if ( ! is_set $JSB_TMP );then
            export JSB_TMP=/tmp/$$
        mkdir -p $JSB_TMP
    fi
    JSB_OUT=$1.truncated
    if [ $JOBSUB_LOG_SIZE -gt $JOBSUB_MAX_JOBLOG_SIZE ]; then
        head -c $JOBSUB_MAX_JOBLOG_HEAD_SIZE $1 > $JSB_OUT
        echo "
jobsub:---- truncated after $JOBSUB_MAX_JOBLOG_HEAD_SIZE bytes--
" >>$JSB_OUT
        echo "
jobsub:---- resumed for last $JOBSUB_MAX_JOBLOG_TAIL_SIZE bytes--
" >>$JSB_OUT
        tail -c $JOBSUB_MAX_JOBLOG_TAIL_SIZE $1 >> $JSB_OUT
    else
        cp $1 $JSB_OUT
    fi
    cat $JSB_OUT
}


redirect_output_start(){
    exec 7>&1
    exec >${JSB_TMP}/JOBSUB_LOG_FILE
    exec 8>&2
    exec 2>${JSB_TMP}/JOBSUB_ERR_FILE
}

redirect_output_finish(){
    exec 1>&7 7>&-
    exec 2>&8 8>&-
    jobsub_truncate ${JSB_TMP}/JOBSUB_ERR_FILE 1>&2
    jobsub_truncate ${JSB_TMP}/JOBSUB_LOG_FILE
    
    
    IFDH_CP_MAXRETRIES=1 ${JSB_TMP}/ifdh.sh cp ${JSB_TMP}/JOBSUB_ERR_FILE.truncated https://fndcadoor.fnal.gov:2880/fermigrid/jobsub/jobs/2023_11_29/06234875-337c-4044-8922-57295d7a40d1/eventLoop_NONE_wrapper_tag_default_1701286675.sh2023_11_29_13382106234875-337c-4044-8922-57295d7a40d1cluster.$CLUSTER.$PROCESS.err
    IFDH_CP_MAXRETRIES=1 ${JSB_TMP}/ifdh.sh cp ${JSB_TMP}/JOBSUB_LOG_FILE.truncated https://fndcadoor.fnal.gov:2880/fermigrid/jobsub/jobs/2023_11_29/06234875-337c-4044-8922-57295d7a40d1/eventLoop_NONE_wrapper_tag_default_1701286675.sh2023_11_29_13382106234875-337c-4044-8922-57295d7a40d1cluster.$CLUSTER.$PROCESS.out
    
}


normal_exit(){
    redirect_output_finish

    # maybe don't cleanup so we can transfer files back...
    #cleanup_condor_dirs
}

signal_exit(){
    echo "$@ "
    echo "$@ " 1>&2
    exit 255
}


trap normal_exit EXIT
trap "signal_exit received signal TERM"  TERM
trap "signal_exit received signal KILL" KILL
trap "signal_exit received signal ABRT" ABRT
trap "signal_exit received signal QUIT" QUIT
trap "signal_exit received signal ALRM" ALRM
trap "signal_exit received signal INT" INT
trap "signal_exit received signal BUS" BUS
trap "signal_exit received signal PIPE" PIPE



setup_ifdh_env(){
#
# create ifdh.sh which runs
# ifdh in a seperate environment to
# keep it from interfering with users ifdh set up
#
cat << '_HEREDOC_' > ${JSB_TMP}/ifdh.sh
#!/bin/sh
#
which ifdh > /dev/null 2>&1
has_ifdh=$?
if [ "$has_ifdh" -ne "0" ] ; then
    unset PRODUCTS
    for setup_file in /cvmfs/fermilab.opensciencegrid.org/products/common/etc/setups /grid/fermiapp/products/common/etc/setups.sh /fnal/ups/etc/setups.sh ; do
      if [ -e "$setup_file" ] && [ "$has_ifdh" -ne "0" ]; then
         source $setup_file
         ups exist ifdhc $IFDH_VERSION
         has_ifdh=$?
         if [ "$has_ifdh" = "0" ] ; then
             setup ifdhc $IFDH_VERSION
             break
         else
            unset PRODUCTS
         fi
     fi
   done
fi
which ifdh > /dev/null 2>&1
if [ "$?" -ne "0" ] ; then
    echo "Can not find ifdh version $IFDH_VERSION ,exiting!"
    echo "Can not find ifdh version $IFDH_VERSION ,exiting! ">&2
    exit 1
else
    ifdh "$@"
    exit $?
fi
_HEREDOC_
chmod +x ${JSB_TMP}/ifdh.sh
}


#############################################################
# main ()                                                     #
###############################################################
touch .empty_file
# Hold and clear arg list
args="$@"
set - ""
[[ "$JOBSUB_DEBUG" ]] && set_jobsub_debug

export JSB_TMP=$_CONDOR_SCRATCH_DIR/jsb_tmp
mkdir -p $JSB_TMP
export _CONDOR_SCRATCH_DIR=$_CONDOR_SCRATCH_DIR/no_xfer
export TMP=$_CONDOR_SCRATCH_DIR
export TEMP=$_CONDOR_SCRATCH_DIR
export TMPDIR=$_CONDOR_SCRATCH_DIR
mkdir -p $_CONDOR_SCRATCH_DIR
export CONDOR_DIR_INPUT=${_CONDOR_SCRATCH_DIR}/${PROCESS}/TRANSFERRED_INPUT_FILES
mkdir -p $CONDOR_DIR_INPUT
redirect_output_start

setup_ifdh_env
export PATH="${PATH}:."

# -f files for input

  
    ${JSB_TMP}/ifdh.sh cp -D /pnfs/minerva/persistent/users/anezkak/1D_modelComparison//myareatar_tag_default_1701286675.tar.gz ${CONDOR_DIR_INPUT}
    chmod u+x ${CONDOR_DIR_INPUT}/myareatar_tag_default_1701286675.tar.gz
  


# --tar_file_name for input


# -d directories for output


# ==========

  # Minerva preamble
  


# ==========


export JOBSUB_EXE_SCRIPT=$(ls eventLoop_NONE_wrapper_tag_default_1701286675.sh 2>/dev/null)
if [ "$JOBSUB_EXE_SCRIPT" = "" ]; then
     export JOBSUB_EXE_SCRIPT=$(find . -name eventLoop_NONE_wrapper_tag_default_1701286675.sh -print | head -1)
fi
chmod +x $JOBSUB_EXE_SCRIPT
${JSB_TMP}/ifdh.sh log "mengel:$JOBSUBJOBID BEGIN EXECUTION $JOBSUB_EXE_SCRIPT    "

export NODE_NAME=`hostname`
export BOGOMIPS=`grep bogomips /proc/cpuinfo | tail -1 | cut -d ' ' -f2`
export VENDOR_ID=`grep vendor_id /proc/cpuinfo | tail -1 | cut -d ' ' -f2`
export poms_data='{"campaign_id":"'$CAMPAIGN_ID'","task_definition_id":"'$TASK_DEFINITION_ID'","task_id":"'$POMS_TASK_ID'","job_id":"'$POMS_JOB_ID'","batch_id":"'$JOBSUBJOBID'","host_site":"'$HOST_SITE'","bogomips":"'$BOGOMIPS'","node_name":"'$NODE_NAME'","vendor_id":"'$VENDOR_ID'"}'

${JSB_TMP}/ifdh.sh log poms_data=$poms_data
echo `date` $JOBSUBJOBID BEGIN EXECUTION $JOBSUB_EXE_SCRIPT  >&2
echo `date` $JOBSUBJOBID BEGIN EXECUTION $JOBSUB_EXE_SCRIPT 

 $JOBSUB_EXE_SCRIPT  
JOB_RET_STATUS=$?

# copy out job log file


# copy out -d directories


# log cvmfs info, in case of problems
# on job failure: everything after second-to-last "switched to catalog revision x"
# on job success: last 'catalog revision n' line
cvmfs_info() {
    echo "cvmfs info:" >&2
    # pick filter based on job status, whether we have multiple "switched to catalog revision" lines
    if [ $JOB_RET_STATUS = 0 ]
    then
        filter="grep to.catalog.revision | tail -1"
    else
        dummyline="__dummy__to_catalog_revision"
        second_latest_rev_re=$( echo "$dummyline"; attr -g logbuffer /cvmfs/dune.opensciencegrid.org/ |
                               grep to.catalog.revision |
                               tail -2 | head -1 |
                               sed -e 's/[][\/\\]/\\&/g'  # backslash escape square brackets and slashes
                           )

        if [ "$second_latest_rev_re" = "$dummyline" ]
        then
            # there were zero or one "switched to catalog revision x" lines, send them all
            filter=cat
        else
            # delete everything up to that second latest one
            filter="sed -e '1,/$second_latest_rev_re/d'"
        fi
    fi

    # now log filtered messages to ifdh, and into stderr

    attr -g logbuffer /cvmfs/minerva.opensciencegrid.org/ |
        grep -v '^$' |
        eval "$filter" |
        while read line
        do
            ${JSB_TMP}/ifdh.sh log "$JOBSUBJOBID cvmfs: $line"
            echo $line >&2
        done
}

cvmfs_info

echo `date` $JOBSUB_EXE_SCRIPT COMPLETED with exit status $JOB_RET_STATUS
echo `date` $JOBSUB_EXE_SCRIPT COMPLETED with exit status $JOB_RET_STATUS 1>&2
${JSB_TMP}/ifdh.sh log "$JOBSUBJOBID anezkak:eventLoop_NONE_wrapper_tag_default_1701286675.sh COMPLETED with return code $JOB_RET_STATUS"

exit $JOB_RET_STATUS