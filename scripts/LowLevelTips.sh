#!/bin/bash
#public protected private abstract default static final transient volatile synchronized native strictfp

#################################
#. bash
#################################
#http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html
# bash debugging
while :; do clear; $your_command; sleep 2; done
	# customized watch
grep .toolbox ~/.zshrc || echo 'export PATH=$HOME/.toolbox/bin:$PATH' >> ~/.zshrc && source ~/.zshrc
	# find if .toolbox already exist in zsh, if not, add to export to end of file then source it

for f in *.jar; do echo $f && jar tf $f |wc -l; done
	# for all jar in curr dir, do echo name and count # of class packaged in jar file
for f in *; do echo $f && cd $f && bws clean ; cd .. ;done
	# for all sub-dir in curr dif, do brazil workspace clean; do not fail if not a brazil workspace
find `pwd`
	# show all subdirectory with full path
	# use find . if want to hide / to pwd info
kill -9 $processId
	#Kill the process
echo -e "\nnet.ipv4.conf.all.forwarding = 1\n" | sudo tee -a /etc/sysctl.conf
	# display & append content to file "/etc/sysctl.conf"
	# -e to enable interpretation of backslash escapes
	#tee -a will append
mktemp 
tmpfile=$(mktemp /tmp/abc-script.XXXXXX)
| tee $tmpfile
| $(date +%Y%m%d-%H%M%S).txt
	# create tmp file within /tmp directory
	# -d will create tmp directory, good for download file from s3 or install plugins
echo $(date && mktemp /tmp/abc-script.XXXXXX)
	# current timestamp and random generated file in tmp with given prefix

cut -d '=' -f 2 $tmpf | sort -u
	# use '=' as delimeter, pick the 2nd field only (whatever after =)
	# sort ASC with unique 
top 
	# continuous monitoring resources
	# check for load avg, cpus %us, %sys, # of running tasks
	# shift+m(M) to sort DESC by mem%, shift+p(P) sort by cpu usage
	# type u $user will filter by user
ctrl-U
ctrl-K
	# U deletes everything from cursor to bol
	# K deletes everything from cursor to eol


jq '.' file.json
	# json processor: https://stedolan.github.io/jq/manual/
	# input < [{"name":"JSON", "good":true}, {"name":"XML", "good":false}]
	# cat input.json| jq '.[]| .name, .good'
	# > "JSON"
	# >	true
	# >	"XML"
	# >	false
	#for a in `cat alias`; do kcurl -s https://phonetool.amazon.com/users/$a.json|jq '. | {name: .name, lvl: .job_level}'; done

ctrl+r
	# reverse search command history, better use fzf
	# command #useful to add tags useful
	# ctrl+r #useful to search for tags

date -u
	# give time in utc, date +%s give time since epoch
diff --suppress-common-lines -y <(unzip -l $f1) <(unzip -l $f2)
	# diff between 2 zipped file (helpful when using lambda)

rsync -av --exclude='path1/to/exclude' --exclude='path2/to/exclude' kenliao.me:/home/zhhongy/.vimrc ~/.vimrc
	#	
basename include/stdio.h .h
	# > stdio
	# strip down any leading directory or suffix
shuf -i 24-36 -n 3
	# > 34 25 24
	# generate random permutation, -i for range and -n for head-count
export METARURL=https://www.aviationweather.gov/metar/data\?ids\=%27KPAE%27\&format\=raw\&hours\=0\&taf\=off\&layout\=off\&date\=
curl -s $METARURL | grep KPAE | awk -F'<[^>]+>' '{print $2}'
	# get KPAE airport metar
#################################
#. network
#################################
netstat -tulpn | grep :8000
	#Before building the service, make sure nothing is running on port 8000, execute
ssh-keygen -lf ~/.ssh/id_rsa.pub 
	# show finger print of public key -l to list and -f to input file 
nc -zv `hostname` 22 2>&1 | grep succeeded
	#netcat to scan port 22 on hostname/dns_name, will lsucceed if port is bound 
	# -z to scan for listening daemon w/o send data, -v for verbose
ssh -o "ExitOnForwardFailure yes" -i #{ssh_key_file} -R 0.0.0.0:8180:localhost:8180
													 -R 50000:localhost:8000 tunnel -f -N #tacs
	# -R (remote/bind_address):rport:local:lport reverse tunneling 
	# if specify bind_address, need to enable GatewayPorts=yes in the config for SSHD (/etc/ssh/sshd_config 
	# -f to running in backgroud, -N for just forwarding (do not execute remote command)
ip addr show
	# show network interfaces 
~.
	# if ssh hung
scp [options] username1@source_host:directory1/filename1 username2@destination_host:directory2/filename2
sftp 
#################################
#. process
#################################
ps -p 1337 -o comm=
	# -p file by pid, -o comm= specify the output format to command name
	# export PID=1;ps -p $PID -o pid,vsz=MEMORY -o user,group=GROUP -o comm,args=ARGS

ps -ewwwLo state,cmd | grep -P 'bin/java( .* | )com.amazon.sellerflex.scanstow.starter.SFScanStowWorkflowMain( |$)' | wc -l
ps -ewwwLo state,cmd | grep -P 'bin/java( .* | )com.amazon.sellerflex.scanstow.starter.SFScanStowWorkflowMain( |$)' | head -n 1
	# sample output: /apollo/env/SFScanStowWorkflow/jdk1.8/bin/java -Dsun.net.inetaddr.ttl=1 -Djava.net.preferIPv4Stack=true -Djava.io.tmpdir=/apollo/env/SFScanStowWorkflow/var/tmp -XX:+HeapDumpOnOutOfMemoryError -Djava.system.class.loader=com.amazon.cloud9.launcher.BootstrapClassLoader -Dcom.amazon.cloud9.launcher.classpathRoot=/local/apollo/_env/SFScanStowWorkflow-swit1na.16911213.329035917.1613743895 -Dcom.amazon.cloud9.launcher.script=/apollo/env/SFScanStowWorkflow/bin/SFScanStowWorkflowMain -cp /local/apollo/_env/SFScanStowWorkflow-swit1na.16911213.329035917.1613743895/lib/Cloud9JavaWrapperGenerator/cloud9-launcher-SFScanStowWorkflow-1.0.24.2.jar com.amazon.sellerflex.scanstow.starter.SFScanStowWorkflowMain --root=/apollo/env/SFScanStowWorkflow --domain=prod --realm=USAmazon
	# ps -e show all process, -ww unlimited width, -L show thread, -o specify output format
	# grep -P grep in perl regex, round brackets() for grouping, | for alternative, $ for end of string, .* match any chars
	# wc -l, count number of new lines, -w for words, -m for chars
	# head -n $, show first $ number of lines
pgrep -l -f ssh
	# -l print process name; -f match against full argument listsq
sudo service sshd restart

lsof -i tcp:$PORT_NUM
	#find PID of given application that bind to tcp port $PORT_NUM

#################################
#. grep
#################################
tail -f file | grep --line-buffered my_pattern
	# grep a continuous stream
zgrep -B 13 "Fault=1" /onlinelogs/MadisonFrontend/PDX/*/Prod/2017/12/07/00/service_log.* | grep "AwsAccountId=" | sort | uniq -c
zgrep -v "Ping request" *.gz || grep -v mchange || grep -v hibernate || less
zgrep -A 4 "AwsAccountId=728137396354" /onlinelogs/MadisonContainerManagerBackend/DUB/S1/*/Prod/2017/11/10/*/service* | grep -n "Operation=CMUpdateService" 
	# zgrep will grep for the zipped log file within timber
	# -B 13, will print 13 lines of leading context (before), A for after context
	# grep for the AwsAccountId which cause the fault, or invert grep to exclude ping request/hibernate msg
	# sort ASC and uniq -c will only print out the unique pattern and display count at bol
	# for more: https://w.amazon.com/index.php/EC2/Project%20Madison/ControlPlane/Runbook
zcat -f /onlinelogs/nba/gurupa/query_log/2004/12/06/*/query* | agrep -d "EOE" PATTERN
	#zcat/agrep about 10 times faster for static string
cat *service.log* | qlgrep 'Forward/Response/HttpCode=200' | egrep '^Forward/Comm/.+/IP/Address' | cut -d= -f2 | sort | uniq -c
	# understand the querylog and can be grep without -A -B options, default delimter=EOE
	# https://w.amazon.com/index.php/EnvImprovementNinjas/qlgrep
	#qlgrep Fault=1 */Prod/service_log/some_location/*  | qlgrep -ts=$START_TIME -te=$END_TIME | grep AwsUserArn | sort | uniq -c | sort -n -r

export PATH=$PATH:/apollo/env/envImprovement/bin
#################################
#. Vim
#################################
ls | vim -
	# redirect output to vim 
:match Search /pattern/
:match Search /<CTRL-R>/   # highlight the current search pattern

echo "123 abc" | sed 's/[0-9]*/& &/'
	# & as replacement string, "123" in this case, so output > 123 123 abc

sed 's/->.*//' "PreactivateAdmin -> /opt/brazil-pkg-cache/packages/AmazonCACerts/AmazonCACerts-1.0.200873.0/"
	# will remove anything matched after ->, include -> itself (replace with empty)
	# .* match anything in sed
	# -i will change in place
echo "TransitionStatus{code=COMMITTED, state=COMMITTED, acceptorId=7, sn=111948448, busTime=1542240826208000} time=10ms" | sed  's/.*busTime=\([0-9]*\).*/\1/g'
	# .* to match anything 0 or more time
	# [0-9]* match number 0 or more time
	# need to escape both brackets \( and \)
	# \1 in replacement pattern to print what's in the bracket
	# sed does not support \d. Use [0-9] or [[:digit:]]
	# + must be backslashed to get the special meaning: \+

	# http://www.grymoire.com/Unix/Sed.html#uh-0
cat /tmp/zhhongy_debug.log|sed 's/.*gz://' |vim -
	# remove filename from grep result
#"op 
	# disregard #,for paste with prev in reg
:ls 
	# see list of current buffers/opened files
:b myfile
	# switch to buffer file or file#
:vs
	# to split  vim window vertically
	# ctrl-W c to close current window
:f
	# show curr filename
ctrl+n
	# auto complete
ma 
	# mark postion a, 'a or `a to jump back to mark a
:{range}sort u
	# built-in sort
:%s/pattern//gn
	# built-in count of occurence
ZZ 
	# save the current file (if modified) and exit
	# ZQ to quit without saving
:qa 
	# to close all files
	# :wqa to save and close all file


## If you are trap in the scrolling history mode, you can escape by running vi and exit directly
#################################
#. screen
#################################
#Set TERM to xterm-256color in your .bashrc, and put term screen-256color in your .screenrc.
ctrlA + esc
	# allow move cursor around
ctrlA + [
	# copy mode with vim like scrolling
reset
	# if misaligned
vim -M $filename
	#open vim in readonly/modifyable set off
	# :view /path/to/file
ctrlA + a + d
	# ctrlA + a pass the escape sequence to sub-screen, so above combination will detach nested screens

#################################
#. git
#################################
# HEAD point to branch, if detached-head, point to commit
# which constitute commit ? delta, msg, parent, datetime(create,push), author(commit,push)
# git gc every 2 weeks

#git fetch 
#git pull = fetch + merge


[alias]
st = status
          last = log -1 HEAD
          addu = add -u
          dag = log --graph --format='format:%C(yellow)%h%C(reset) %C(blue)\"%an\" <%ae>%C(reset) %C(magenta)%ar%C(reset)%C(auto)%d%C(reset)%n%s' --date-order
          l = log --graph --abbrev-commit --decorate --date=relative --format=format:'''%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)-                     %an%C(reset)%C(bold yellow)%d%C(reset)'''
    # append to ~/.gitconfig for git specific alias

git reset --soft HEAD^
	#undo committed change, so the commited will back to staging
git branch temp
git reset --hard HEAD^^
git checkout temp
	# hard will remove change entirely. Can create temp branch to take delat than reset hard

git checkout 08618129e66127921fbfcbc205a06153c92622fe path/to/file.txt
	# checkout single file from commit 08618
git revert $COMMIT
	# revert already pushed commit
git merge --strategy=ours master    
	# keep the content of this branch, but record a merge
git rebase -i HEAD~5
	#. reverse ordered, from oldest to latest
	# reword, change commit message only
	# square, keep delta, merge to parents
	# fixup (better square), auto discard commit message
	# edit, keep it but take me to shell, do whatever you want
git fetch && git reset --hard origin/master
	# discard all local change, force take remote master
git fetch 
git branch old-master
git reset --hard origin/master
git merge -s ours old-master
	# fetch all remote branches
	# create new branch 'old-master' based on current HEAD 
	# hard reset to force take origin/master
	# merge 'old-master' into current branch, keeping "our" (origin/master) content if conflict

git cherry-pick $COMMIT
	# find delta and reapply to current HEAD
git log --graph --pretty=oneline --abbrev-commit --decorate
	# show git local repo tree graph
git dag --decorate --all
	# show git log with branch and DAG graph
git pull --rebase
	# git pull origin branch and rebase local commit on top of it
	#https://stackoverflow.com/questions/2452226/master-branch-and-origin-master-have-diverged-how-to-undiverge-branches/2452610#2452610
	# build coral model -> coral java client will auto re-build b/c model is build-tool dependency of javaCLient
git pull --rebase origin mainline
	# explicit pull even if local branch is not tracking origin mainline
git rebase master feature
	# replay feature branch on top of existing master branch 
	# which is equavalent to git checkout feature && git rebase master
	# now the feature branch will have the latest rebased change, in order to push from mainline, can do git checkout mainline&& git merge feature 

git merge feature
	# generate new commit has 2 parent (p1: mainline) (p2: feature)

git branch --set-upstream-to=<remote>/<branch> uncomment
	# If you wish to set tracking information for local "uncomment" branch you can do so with:

git branch --set-upstream-to=origin/mainline m3batchy
	# set local branch upstream to orgin/mainline

git push -u origin feature_branch_name.
git push <remote> <local branch name>:<remote branch to push into>
	# push new remote branch
git diff COMMIT~ COMMIT 
	#will show you the difference between that COMMIT's ancestor and the COMMIT
git remote add $remote_name ssh://git.amazon.com/pkg/MadisonLptCommon/snapshot/zhhongy/2018-12-04T01-50-59
git pull -r $remote_name head
	# adding others cr as repo and pull from it

##################################################################
# AmazonSpecific #
##################################################################
#VPC (Virtual Private Cloud): A mechanism for logically separating and isolating AWS resources at the network layer. 
#Availability Zone: An isolated location within a region comprising one or more data centers. 
#Region: A geographic area (such as us-west, cn-north) comprising one or more availability zones.
mwinit;ssh-add;
	# access prod host via bastions host
	#https://midway.amazon.com/nextgen/ssh#ssh-instructions-section

curl http://169.254.169.254/latest/meta-data/
	#check ec2 


#################################
#. brazil (not in prod)
#################################
brazil -v test-integration

mv ~/brazil-pkg-cache ~/brazil-pkg-cache-old &&
rm -rf ~/brazil-pkg-cache-old &
brazil-package-cache clean --days 7
	# brazil 2.0 clean up
brazil-build dependency-analysis
	#find out blast radius for a Datapath package to see all the packages and REST bindings that call code in that package
	# brazil-build -p show builable target
brazil workspace --sync --metaData
	#This will only sync your currently selected version set. You need to do this command on a regular basis so your local client can get up to date with any changes made to your version set since the last sync.

brazil vs --merge -p SFPOStorageService-1.0 --destination SellerFlexPOStorageService/mainline
	#src vs is live in this case, merge package SFPOStorageService-1.0 to dest vs SellerFlexPOStorageService/mainline
bvs printdependencies -vs MadisonContainerManagerBackend/development -p Log4j-1_2-api-2.8 --consumers --sort alpha
	# print consumer of packages inside versionset
	#AWSCentrifugeEnigmaClient-1.0
brazil-runtime-exec $script
	#cloud9 java wrapper generator
	# add Cloud9JavaWrapperGenerator to Config
	# add     <ht:import file="generate-wrapper.xml"/>
	#		  <generate-wrapper
    #            classname="com.amazon.YourMainClass"
    #            target="${output.dir}/bin/your-script-file">
    # to build.xml
    #https://w.amazon.com/index.php/Cloud9JavaWrapperGenerator

brazil-path package-build-root
	# show where the package build artifact/class/jar  
	#https://w.amazon.com/index.php/BrazilBuildSystem/Tools/BrazilPath#Basic_Variables
bws dryrun --git-head --platforms RHEL5_64 -p $pkg 
	#workspace dryrun

bb clean && bb single-integ-test-na -DtestClass=my.package.MyClass -DtestMethods=myMethod > /tmp/createInteg.log
bb clean && bb single-unit-test -DtestClass=com.amazon.sellerflex.scanstow.workflow.external.SFScanStowShipmentServiceFacadeTest
bb clean && bb single-unit-test -DtestClass=com.amazon.my.package.MyTest -DtestMethods=myMethod1,myMethod2
	#run single test
	#happierTrails build targets: https://w.amazon.com/index.php/BrazilBuildSystem/HappierTrails/Targets
	#CreateShipment
	 #bb single-integ-test-na -DtestClass=com.amazon.sellerflex.scanstow.workflow.integration.CreateShipmentWorkflowIntegrationTest -DtestMethods=testCreateShipmentWorkflow_NoOpenShipment_createShipment,testCreateShipmentWorkflow_openShipmentItemCounterExceeded_createShipment,testCreateShipmentWorkflow_openShipmentValid_doNotcreateShipment > /tmp/createInteg.log
	#UpdatePurchaseOrder
	 #bb single-integ-test-na -DtestClass=com.amazon.sellerflex.scanstow.workflow.integration.UpdatePurchaseOrderWorkflowIntegrationTest -DtestMethods=testUpdatePurchaseOrderWorkflow_allValidItems_createPO,testUpdatePurchaseOrderWorkflow_emptyShipmentItemListInput_CheckPendingWorkFromDataStore,testUpdatePurchaseOrderWorkflow_invalidShipmentItemListInput_CheckPendingWorkFromDataStore,testUpdatePurchaseOrderWorkflow_validAndInvalidItems_createPO > /tmp/updateInteg.log
bws merge --findMissingDependencies
	# will try to find missing dependencies, and submit dry-run request 
	# do bws merge --clean to get back to clean state

#################################
#. apollo
#################################
grep OCF /apollo/env/$ENV_ALIAS/Apollo/Manifest
	# find op configs
sudo /apollo/sbin/apolloLocalHostControl --status Active
	#active apollo host
sudo /apollo/bin/runCommand -a Activate -e <yourEnvironmentAlias> 
	# activate apollo environment


find / -xdev -type f -size +100M
	# find large file under / only, do not go further down
du -ahx / | sort -rh | head -20
	# find all files and directory, top 20

find . -mindepth 1 -mtime +5 -depth -print
	# sanity check file with last modified timestamp before 5*24 hour ago, 
find . -mindepth 1 -mtime +5 -delete

brazil-package-cache clean --days 2
# brazil 2.0

cd / && /apollo/env/SDETools/bin/pkg-cache-cleanup --days 3
	# clean up the dev desktop
/apollo/bin/getmyfabric
	# find out network fabric

du -sh * 2> /dev/null| sort -rh
sudo find / -type f -printf '%12s %p\n' 2>/dev/null|awk '{if($1>999999999)print $0;}'


/apollo/bin/cleanupOldEnvSymlinks --all && rm -rf /apollo/_env/to_be_removed
	#clean old env symlinks, can be run on daily basis 
/apollo/env/envImprovement/bin/expand-hostclass M7-TIMBERFS-<REGION_NAME> 
	# expand-hostclass to specific host

sshenv -e TimberFS/PDX/Madison -r 
	# ssh wrapper -e apollo env , -r pick random hosts, -a to pick first one
	# -n to list all https://w.amazon.com/index.php/EnvImprovementNinjas/sshenv

ps aux | grep -Eo '/apollo/env/\w+' | cut -d / -f4 | sort | uniq -c | sort -nr
	# show active running apollo env
for f in SDETools envImprovement OdinTools MadisonQLRedisNode; do
  if [[ -d /apollo/env/$f ]]; then
      export PATH=$PATH:/apollo/env/$f/bin
  fi
done
	# add apollo/$env/bin to be part of path
	# export PATH=$PATH::/apollo/env/envImprovement/bin

apolloHostControlCLI --status Active $hostname

export hostclass=M7-SCHEDULER-PDX-S2-PROD-4
for hostname in `expand-hostclass $hostclass|sed -n '1!p'`;do echo $hostname&&apolloHostControlCLI --status Active $hostname;done
	#sed -n '1!p' will not print 1st line of output from expand-hostclass
hostclasses=("BOM-S1-PROD-53" "CDG-S1-PROD-53" "ICN-S1-PROD-53" "LHR-S1-PROD-54" "YUL-S1-PROD-51")
	# space separated
for hostclass in $hostclasses; do for host in `expand-hostclass M7-SCHEDULER-$hostclass|sed -n '1!p'`;do echo $host;apolloHostControlCLI --status Active $host;done;done

#################################
#. LPT
#################################
brazil-build synthesize-pipeline
  	# just synthesize/generate pipeline 
brazil-build --tasks
	# Listing all available rake tasks
brazil-build revert-pipeline
	# rollack to your pipeline's state before synthesis by running:
	# Backed up your existing resources to /local/home/zhhongy/Workspace/MadisonLptCommon/build/MadisonDynamicConfigPusherLpt/MadisonDynamicConfigPusherLpt-1.0/RHEL5_64/DEV.STD.PTHREAD/build/backup-1531515170.json
export LPT_ENABLE_PARTITIONING=false
	# to disable the Interactive Synthesize mode. (synthesize everything in 1 go)
bb no-shadow synthesize-vips -- --targeted --dimension=iad-s8-12-prod --stage=wave15
	# targeted per dimension&stage
brazil-build no-shadow synthesize -- --describe --partitions
	# list partition
#################################
#. Chrome
#################################
# Streamkeys: map online music player to media key
# Video Speed Controller: html5 playback speed adjuster
# Vimium: vim-like key binding in browser	

#################################
#. Amazon
#################################
https://tim-files.amazon.com/amazon.qtt.tod/runs/a7d49d5e-dc21-470d-ae3c-6d71823805fd/log.txt
https://tim-files.amazon.com/amazon.qtt.tod/runs/40a7acb6-f7e3-49fc-bc05-20c4b7df8fba/brazil-integ-tests/index.html
	# regional tod worker post-execution artifacts

#################################
#. Madison
#################################
/apollo/env/AlfBusLocal/bin/bus -l ping
	# make sure AlfBus local is running
pgrep -l -f MadisonQLRedisNode | grep QLApplier
	# make sure QLApplier is running
	# if not do a activate env (MadisonQLRedisNode)
/apollo/env/MadisonQLRedisNode/bin/redis-cli hget __QL_LOG_INFO__ instance-id
	# verify redis is point to local AlfBus
	# update concrete then abstract schemas: https://tiny.amazon.com/x6i5kg2d/wamazindeEC2ProjInfrMadiLoca
/apollo/env/MadisonQLRedisNode/bin/redis-cli hgetall __QL_LOG_INFO__
	# get all meta data
	# seq-no -> 2270702
	# schema-seq-no ->4
multitail -E Exception -l 'ssh $HOST1 "tail -f /apollo/env/ENV_NAME/var/output/logs/SomeApplicationLogs*"' \
					   -l 'ssh $HOST2 "tail -f /apollo/env/ENV_NAME/var/output/logs/SomeApplicationLogs *"'
	#https://w.amazon.com/index.php/EnvImprovementNinjas/MultiTail	
grep -A 7 -B 5 "Operation=UpdateService" service* | grep -B 10 'UserAgent=AWS CloudFormation' |grep RequestId	
	# find request Id if user agent is cf and operation is updateService
qlgrep   Operation=ServiceDiscoveryHostBridgeService.Minutely.MakeAssertions service_log.* | grep -i Error=
	# bb canary and grep following tests inside service log to figure out if succeeded/failure or Error

./m7db_reader -e "select count(*) from tasks"

#used to found a database on the bus.
#This will found (establish, setup) a new QL database using the AlfBus chain. 
#The $dbSnapshotOutputFilePath will create a snapshot file containing the write schema and any data, which upon "founding" is nothing.
qlfound --open-shard --schema-file $SchemaFilePath --output $dbSnapshotOutputFilePath --endpoint stumpy://`hostname`:9600/`hostname`-00
	# ps aux | grep AlfBus | grep 'Dalfbus.proxy-server-port' will find bus server port
	# bus -l config | grep bus-id will give bus id
qlsnap -v --base /tmp/so-found.json --output /tmp/snap-now.qlsnap
	# take a snapshot of the base from base to output
# Schema Updates
### bootstrap Redis replica
/apollo/env/MadisonQLRedisNode/bin/qlredis --init --force --concrete-schema-file /home/zhhongy/Workspace/MadisonQLRedisNode/src/MadisonQLRedisMigrations/configuration/qldb-configuration/redis-schema.redis --snapshot-file /tmp/so-found.json
### redis concrete schema
cd ~/Workspace/MadisonQLRedisNode/src/MadisonQLRedisMigrations/configuration/qldb-configuration
git pull -r
qlredis -n "define --file /home/zhhongy/Workspace/MadisonQLRedisNode/src/MadisonQLRedisMigrations/configuration/qldb-configuration/redis-schema.redis"
	> confirm
### Alfbus abstract schema
cd ~/Workspace/MadisonQLRedisNode/src/MadisonQLMigrations/configuration/qldb-configuration
git pull -r
qlredis -n "schema --force -e /home/zhhongy/Workspace/MadisonQLRedisNode/src/MadisonQLMigrations/configuration/qldb-configuration/qldb-abstract-schema.json"

### restart the mysql applier
sudo /apollo/bin/runCommand -e MadisonAnalyticsDBApplierService -a Activate

kcurl --silent 'https://code.amazon.com/packages/QLDBeerService/blobs/mainline/--/schema/beer_service_schema.json?raw=1' > /tmp/beer_service_schema.json
# download src from code.amz directly

regions | awk '{print $2}' |sed '1d'  |sort
	# show all airport name (awk help prints 2nd colume and sed remove 1st line of code)
regions | awk '{print $1}' |sed '1d'  |sort
	# show all external name	

#################################
#. PMET MonitoringPortal
#################################
FunctionExpression1=SORT(desc, max, S1,1,5)
FunctionLabel1={metricLabel} [avg: {avg}, max: {max}]
FunctionYAxisPreference1=left



zgrep -B3 -A7 "Operation=UpdateService" /onlinelogs/MadisonFrontend/DUB/*/Prod/2017/11/10/14/service* | grep -B 10 "AwsAccountId=728137396354" | grep -n "RequestId" | tee $tmpf
export LC_ALL=C

echo "$awsaccountid+$operation+$file"
zgrep -F -B15 AwsAccountId=$awsaccountid $file | grep -B5 Operation=$operation | grep RequestId | cut -d= -f2 | tee /tmp/$USER.log 


#################################
#. Docker
#################################
docker network ls
	# show docker network stack
docker network inspect bridge
	# show docker bridge network mode with containers running in that mode
	# |grep Gateway show IP address of gateway between host and bridge network
	# |grep IPv4Address show IP address of its containers
docker attach alphine1
	# move from background to forground
	# ctrl p + ctrl q to detach
docker run -dit --name alpine1 alpine ash 
	# image Alpine Linux (2Mb) with starting command "ash"
	# -d --detach running in background and print containerId
	# -i Keep STDIN open even if not attached
	# -t allocate pseudo-TTY
docker container stop alphine1 alphine2
docker container rm alphine1 alphine2

#################################
#. OSX
#################################
brazil-build | say 'Build Complete'
	# say word after build complete
screencapture -x $(date +%Y%m%d-%H%M%S).png
	# screencapture


#################################
#. aws cli
#################################
aws ssm get-parameter --name /aws/service/ecs/optimized-ami/amazon-linux/recommended --query 'Parameter.Value' | \
  jq 'fromjson.image_id'
	#"ami-40ddb938"
	# get ecs recommended ami
export MATERIAL_SET_NAME=com.amazon.ec2.madison.telemetry.prod.ca-central-1.kinesis
curl -s "http://localhost:2009/query?Operation=retrieve&ContentType=JSON&material.materialName=${MATERIAL_SET_NAME}&material.materialType=Credential"

(sleep $(shuf -i 24-36 -n 1)h; aws ec2 terminate-instances --instance-ids $(curl -s http://169.254.169.254/latest/meta-data/instance-id) --region $ECS_REGION) &
	# spawn a backend process to terminate itself (ec2 instance) in between 24 and 36 hrs
curl http://169.254.169.254/latest/meta-data/instance-type
	# return current instance-type
#################################
#. intellij shortcut
#################################
ctrl + shift + Enter
	#Complete statement
shift + shift
	#search everything
ctrl + shift + A
	#search actions
ctrl + alt + B
	# go to implementations
ctrol + alt + V/F/C/P/M
	# extract expression into Variable/Field/Constanct/Parameter/Method
	# N do the opposite of extract, make the expression inline
BasicConfigurator.configure();
	# enable log4j in unit tests
	# org.apache.log4j
https://w.amazon.com/index.php/Scala/Using#IntelliJ_IDEA_.2F_Scala_integration
	# Scala

#################################
#. Ruby generate unique name within account
#################################
def cloud_formation_stack_base_name options
  [
    pipeline_name, 
    options.dimension.dimension_name,options.logical_stage.name, 
    options.sub_environment
  ].select(&:present?).join('-').gsub('_', '-')
end
