From: Tony Clayton <tony-netfilter@enfusion-group.com>
Subject: [SCRIPT] iptables-trace: log every decision, leaving rules in-tact
Date: Wed, 26 Mar 2003 19:54:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048726471.3e824bc71ce3f@webmail.enfusion-group.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I wrote a bash script a few months ago which I've called
"iptables-trace".  It takes start/stop arguments like a simple initscript.  

Hopefully others on this list will find it useful for debugging.  I've
attached the script to the bottom of this message.

Synopsis:

# add a log rule for each existing iptables rule
/etc/rc.d/init.d/iptables-trace start

# remove all log rules we've added in the past, leaving other rules 
# untouched
/etc/rc.d/init.d/iptables-trace stop

When started, the script reads all the rules that are currently loaded
into iptables, and inserts a new LOG target above each rule.  Every rule
in all three tables (mangle,nat,filter) are logged.  When stopped, the
script removes all the log messages it has added, and leaves the
original rules untouched.  It can be used on any machine that uses
iptables, and requires absolutely no knowledge of the current ruleset.

The format for logging messages is as follows:

An iptables entry which essentially does:
  iptables -t filter -A INPUT -p icmp -j icmpIn
would be logged as:
  iptables -t filter -A INPUT -p icmp -j LOG --log-level debug
--log-prefix "*f:INPUT:9:icmpIn:"

The leading asterisk '*' tags the rule so it can be automatically
deleted when we run "iptables-trace stop".  The 'f' denotes the filter
table, 'INPUT' specifies that the rule was in the INPUT chain, '9' is
the index number of the logging rule in that chain (for reference), and
'icmpIn' is the target.  

So, as an example, here is what is logged to syslog when I ping my
machine that is running iptables-trace:

Feb 24 12:11:15 vmware-tony2 kernel: *f:INPUT:9:icmpIn:IN=eth0 OUT=
MAC=00:50:56:43:ef:36:00:d0:b7:8f:47:af:08:00 SRC=10.33.15.71
DST=10.33.15.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=13068 SEQ=256                                         
                            
Feb 24 12:11:15 vmware-tony2 kernel: *f:icmpIn:1:ACCEPT:IN=eth0 OUT=
MAC=00:50:56:43:ef:36:00:d0:b7:8f:47:af:08:00 SRC=10.33.15.71
DST=10.33.15.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=13068 SEQ=256                                         
                            Feb 24 12:11:15 vmware-tony2 kernel:
*f:OUTPUT:7:icmpOut:IN= OUT=eth0
SRC=10.33.15.123 DST=10.33.15.71 LEN=84 TOS=0x00 PREC=0x00 TTL=64
ID=3568 PROTO=ICMP TYPE=0 CODE=0 ID=13068 SEQ=256                      
               
Feb 24 12:11:15 vmware-tony2 kernel: *f:icmpOut:3:ACCEPT:IN= OUT=eth0
SRC=10.33.15.123 DST=10.33.15.71 LEN=84 TOS=0x00 PREC=0x00 TTL=64
ID=3568 PROTO=ICMP TYPE=0 CODE=0 ID=13068 SEQ=256

-------------------------------

#!/bin/bash
# $Id: iptables-trace,v 1.6 2003/03/27 00:51:38 apc Exp $
# Author: Tony Clayton <tony-netfilter@enfusion-group.com>

# You may use and edit this code freely.  If you make changes to
# it that are generally useful, please email them to me and/or
# post them on the netfilter mailing list.

LOGPREFIX='${table:0:1}:${chain:0:14}:$rulenum:${target:0:14}'

log_entry() {
  local action=$1
  local table=$3 chain=$5
  shift 5
  if [ "$last_chain" != "$chain" ]; then 
    rulenum=1
  fi
  case $action in
  (skip) ;;
  (add)
    local rulespec
    while [ "$1" != "-j" ]; do
      rulespec="$rulespec $1"
      shift;
    done
    shift;
    target=$*
    eval prefix="${LOGPREFIX}"
    iptables -t $table -I $chain $rulenum $rulespec -j LOG \
	   --log-level debug --log-prefix "*${prefix:0:27}:"
    let rulenum=$rulenum+1
    ;;
  (delete)
    iptables -t $table -D $chain $rulenum
    let rulenum=$rulenum-1
    ;;
  esac
  last_chain=$chain
}

start() {
  for table in $(cat /proc/net/ip_tables_names); do
    rulenum=1
    iptables-save -t $table | grep '^-' | \
      while read cmd; do 
	log_entry add -t $table $cmd
        let rulenum=$rulenum+1
      done
  done
}

stop() {
  for table in $(cat /proc/net/ip_tables_names); do
    iptables-save -t $table | grep '^-' | \
      while read cmd; do 
	echo $cmd | grep -q -e '--log-prefix "*'
	if [ $? -eq 0 ]; then
          log_entry delete -t $table $cmd
        else
	  log_entry skip -t $table $cmd
	fi
        let rulenum=$rulenum+1
      done
  done
}

case "$1" in 
  start) start
	;;
  stop) stop
	;;
  *) echo $"Usage: $0 {start|stop}"
     exit 1
esac

exit 0


