From: "Simpson, Doug" <DSimpson@friedmancorp.com>
Subject: (no subject)
Date: Mon, 23 Dec 2002 16:56:20 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CAFAAEC91CC8D511952000062938C6F12ECE3A@ozlan.fcdomain.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Here is my rc.firewall that I generated using FW Builder.
I want to add these lines - 
iptables -t nat -A POSTROUTING -p tcp --dport 110 -o eth0 -s $INTERNAL_IP -j
SNAT --to $external_ip
iptables -t nat -A POSTROUTING -p tcp --dport 23 -o eth0 -s $INTERNAL_IP -j
SNAT --to $EXTERNAL_IP
Where can I put these in the script and do I need to follow the same pattern
as the script?
Thank you
Doug
##############################################
#!/bin/sh 
#
#  This is automatically generated file. DO NOT MODIFY !
#
#  Firewall Builder  fwb_ipt v1.0.7- 
#
#  Generated Fri Nov 22 17:45:36 2002 CST by root
#
#
#
#
check() {
  if test ! -x "$1"; then
    echo "$1 not found or is not executable"
    exit 1
  fi
}

log() {
  if test -x "$LOGGER"; then
    logger -p info "$1"
  fi
}

MODPROBE="/sbin/modprobe"
IPTABLES="/sbin/iptables"
IP="/sbin/ip"
LOGGER="/usr/bin/logger"

check $MODPROBE
check $IPTABLES
check $IP

cd /etc || exit 1

log "Activating firewall script generated Fri Nov 22 17:45:36 2002 CST by
root"


INTERFACES="eth0 eth1 lo "
for i in $INTERFACES ; do
  $IP link show "$i" > /dev/null 2>&1 || {
    echo Interface $i does not exist
    exit 1
  }
done


MODULE_DIR="/lib/modules/`uname -r`/kernel/net/ipv4/netfilter/" 
MODULES=`(cd $MODULE_DIR; ls *_conntrack_*  *_nat_* | sed 's/\.o.*$//')`
for module in $(echo $MODULES); do 
  if [ -e "${MODULE_DIR}/${module}.o" -o -e "${MODULE_DIR}/${module}.o.gz"
]; then 
    $MODPROBE -k ${module} ||  exit 1 
  fi 
done


FWD=`cat /proc/sys/net/ipv4/ip_forward`
echo "0" > /proc/sys/net/ipv4/ip_forward

echo 0 > /proc/sys/net/ipv4/icmp_echo_ignore_all

echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout

echo 1800 > /proc/sys/net/ipv4/tcp_keepalive_intvl

$IP -4 neigh flush dev eth0
$IP -4 addr flush dev eth0 label "eth0:FWB*"
$IP -4 neigh flush dev eth1
$IP -4 addr flush dev eth1 label "eth1:FWB*"


$IPTABLES -P OUTPUT  DROP
$IPTABLES -P INPUT   DROP
$IPTABLES -P FORWARD DROP



cat /proc/net/ip_tables_names | while read table; do
  $IPTABLES -t $table -L -n | while read c chain rest; do
      if test "X$c" = "XChain" ; then
        $IPTABLES -t $table -F $chain
      fi
  done
  $IPTABLES -t $table -X
done


$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# 
# Rule 0(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_0
$IPTABLES -A INPUT -i eth0 -p udp --source-port 500 -m state --state NEW -j
eth0_In_RULE_0 
$IPTABLES -A FORWARD -i eth0 -p udp --source-port 500 -m state --state NEW
-j eth0_In_RULE_0 
$IPTABLES -A eth0_In_RULE_0  -j LOG  --log-level info --log-prefix "RULE 0
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_0 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_0
$IPTABLES -A OUTPUT -o eth0 -p udp --source-port 500 -m state --state NEW -j
eth0_Out_RULE_0 
$IPTABLES -A FORWARD -o eth0 -p udp --source-port 500 -m state --state NEW
-j eth0_Out_RULE_0 
$IPTABLES -A eth0_Out_RULE_0  -j LOG  --log-level info --log-prefix "RULE 0
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_0 -j ACCEPT 
# 
# Rule 1(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_1
$IPTABLES -A INPUT -i eth0 -p udp --destination-port 500 -m state --state
NEW -j eth0_In_RULE_1 
$IPTABLES -A FORWARD -i eth0 -p udp --destination-port 500 -m state --state
NEW -j eth0_In_RULE_1 
$IPTABLES -A eth0_In_RULE_1  -j LOG  --log-level info --log-prefix "RULE 1
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_1 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_1
$IPTABLES -A OUTPUT -o eth0 -p udp --destination-port 500 -m state --state
NEW -j eth0_Out_RULE_1 
$IPTABLES -A FORWARD -o eth0 -p udp --destination-port 500 -m state --state
NEW -j eth0_Out_RULE_1 
$IPTABLES -A eth0_Out_RULE_1  -j LOG  --log-level info --log-prefix "RULE 1
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_1 -j ACCEPT 
# 
# Rule 2(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_2
$IPTABLES -A INPUT -i eth0 -p 50 -m state --state NEW -j eth0_In_RULE_2 
$IPTABLES -A FORWARD -i eth0 -p 50 -m state --state NEW -j eth0_In_RULE_2 
$IPTABLES -A eth0_In_RULE_2  -j LOG  --log-level info --log-prefix "RULE 2
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_2 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_2
$IPTABLES -A OUTPUT -o eth0 -p 50 -m state --state NEW -j eth0_Out_RULE_2 
$IPTABLES -A FORWARD -o eth0 -p 50 -m state --state NEW -j eth0_Out_RULE_2 
$IPTABLES -A eth0_Out_RULE_2  -j LOG  --log-level info --log-prefix "RULE 2
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_2 -j ACCEPT 
# 
# Rule 3(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_3
$IPTABLES -A INPUT -i eth0 -p 51 -m state --state NEW -j eth0_In_RULE_3 
$IPTABLES -A FORWARD -i eth0 -p 51 -m state --state NEW -j eth0_In_RULE_3 
$IPTABLES -A eth0_In_RULE_3  -j LOG  --log-level info --log-prefix "RULE 3
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_3 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_3
$IPTABLES -A OUTPUT -o eth0 -p 51 -m state --state NEW -j eth0_Out_RULE_3 
$IPTABLES -A FORWARD -o eth0 -p 51 -m state --state NEW -j eth0_Out_RULE_3 
$IPTABLES -A eth0_Out_RULE_3  -j LOG  --log-level info --log-prefix "RULE 3
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_3 -j ACCEPT 
# 
# Rule 4(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_4
$IPTABLES -A INPUT -i eth0 -p tcp --source-port 110 -m state --state NEW -j
eth0_In_RULE_4 
$IPTABLES -A FORWARD -i eth0 -p tcp --source-port 110 -m state --state NEW
-j eth0_In_RULE_4 
$IPTABLES -A eth0_In_RULE_4  -j LOG  --log-level info --log-prefix "RULE 4
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_4 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_4
$IPTABLES -A OUTPUT -o eth0 -p tcp --source-port 110 -m state --state NEW -j
eth0_Out_RULE_4 
$IPTABLES -A FORWARD -o eth0 -p tcp --source-port 110 -m state --state NEW
-j eth0_Out_RULE_4 
$IPTABLES -A eth0_Out_RULE_4  -j LOG  --log-level info --log-prefix "RULE 4
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_4 -j ACCEPT 
# 
# Rule 5(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_5
$IPTABLES -A INPUT -i eth0 -p tcp --destination-port 110 -m state --state
NEW -j eth0_In_RULE_5 
$IPTABLES -A FORWARD -i eth0 -p tcp --destination-port 110 -m state --state
NEW -j eth0_In_RULE_5 
$IPTABLES -A eth0_In_RULE_5  -j LOG  --log-level info --log-prefix "RULE 5
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_5 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_5
$IPTABLES -A OUTPUT -o eth0 -p tcp --destination-port 110 -m state --state
NEW -j eth0_Out_RULE_5 
$IPTABLES -A FORWARD -o eth0 -p tcp --destination-port 110 -m state --state
NEW -j eth0_Out_RULE_5 
$IPTABLES -A eth0_Out_RULE_5  -j LOG  --log-level info --log-prefix "RULE 5
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_5 -j ACCEPT 
# 
# Rule 6(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_6
$IPTABLES -A INPUT -i eth0 -p tcp --destination-port 80 -m state --state NEW
-j eth0_In_RULE_6 
$IPTABLES -A FORWARD -i eth0 -p tcp --destination-port 80 -m state --state
NEW -j eth0_In_RULE_6 
$IPTABLES -A eth0_In_RULE_6  -j LOG  --log-level info --log-prefix "RULE 6
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_6 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_6
$IPTABLES -A OUTPUT -o eth0 -p tcp --destination-port 80 -m state --state
NEW -j eth0_Out_RULE_6 
$IPTABLES -A FORWARD -o eth0 -p tcp --destination-port 80 -m state --state
NEW -j eth0_Out_RULE_6 
$IPTABLES -A eth0_Out_RULE_6  -j LOG  --log-level info --log-prefix "RULE 6
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_6 -j ACCEPT 
# 
# Rule 7(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_7
$IPTABLES -A INPUT -i eth0 -p tcp --source-port 25 --destination-port 25 -m
state --state NEW -j eth0_In_RULE_7 
$IPTABLES -A FORWARD -i eth0 -p tcp --source-port 25 --destination-port 25
-m state --state NEW -j eth0_In_RULE_7 
$IPTABLES -A eth0_In_RULE_7  -j LOG  --log-level info --log-prefix "RULE 7
-- ACCEPT " 
$IPTABLES -A eth0_In_RULE_7 -j ACCEPT 
$IPTABLES -N eth0_Out_RULE_7
$IPTABLES -A OUTPUT -o eth0 -p tcp --source-port 25 --destination-port 25 -m
state --state NEW -j eth0_Out_RULE_7 
$IPTABLES -A FORWARD -o eth0 -p tcp --source-port 25 --destination-port 25
-m state --state NEW -j eth0_Out_RULE_7 
$IPTABLES -A eth0_Out_RULE_7  -j LOG  --log-level info --log-prefix "RULE 7
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_7 -j ACCEPT 
# 
# Rule 8(eth0)
# 
# 
# 
$IPTABLES -N eth0_Out_RULE_8
$IPTABLES -A OUTPUT -o eth0  -s 192.168.1.1 -m state --state NEW -j
eth0_Out_RULE_8 
$IPTABLES -A eth0_Out_RULE_8  -j LOG  --log-level info --log-prefix "RULE 8
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_8 -j ACCEPT 
# 
# Rule 9(eth0)
# 
# 
# 
$IPTABLES -N eth0_Out_RULE_9
$IPTABLES -A FORWARD -o eth0  -s 192.168.1.0/24 -m state --state NEW -j
eth0_Out_RULE_9 
$IPTABLES -A eth0_Out_RULE_9  -j LOG  --log-level info --log-prefix "RULE 9
-- ACCEPT " 
$IPTABLES -A eth0_Out_RULE_9 -j ACCEPT 
# 
# Rule 10(eth0)
# 
# 
# 
$IPTABLES -N eth0_In_RULE_10
$IPTABLES -A INPUT -i eth0 -j eth0_In_RULE_10 
$IPTABLES -A FORWARD -i eth0 -j eth0_In_RULE_10 
$IPTABLES -A eth0_In_RULE_10  -j LOG  --log-level info --log-prefix "RULE 10
-- DROP " 
$IPTABLES -A eth0_In_RULE_10 -j DROP 
# 
# Rule 0(eth1)
# 
# 
# 
$IPTABLES -N eth1_In_RULE_0
$IPTABLES -A INPUT -i eth1 -m state --state NEW -j eth1_In_RULE_0 
$IPTABLES -A FORWARD -i eth1 -m state --state NEW -j eth1_In_RULE_0 
$IPTABLES -A eth1_In_RULE_0  -j LOG  --log-level info --log-prefix "RULE 0
-- ACCEPT " 
$IPTABLES -A eth1_In_RULE_0 -j ACCEPT 
$IPTABLES -N eth1_Out_RULE_0
$IPTABLES -A OUTPUT -o eth1 -m state --state NEW -j eth1_Out_RULE_0 
$IPTABLES -A FORWARD -o eth1 -m state --state NEW -j eth1_Out_RULE_0 
$IPTABLES -A eth1_Out_RULE_0  -j LOG  --log-level info --log-prefix "RULE 0
-- ACCEPT " 
$IPTABLES -A eth1_Out_RULE_0 -j ACCEPT 
# 
# Rule 1(eth1)
# 
# 
# 
$IPTABLES -N eth1_In_RULE_1
$IPTABLES -A INPUT -i eth1 -p tcp --destination-port 23 -j eth1_In_RULE_1 
$IPTABLES -A FORWARD -i eth1 -p tcp --destination-port 23 -j eth1_In_RULE_1 
$IPTABLES -A eth1_In_RULE_1  -j LOG  --log-level info --log-prefix "RULE 1
-- DROP " 
$IPTABLES -A eth1_In_RULE_1 -j DROP 
# 
# Rule 0(lo)
# 
# allow everything on loopback
# 
$IPTABLES -A INPUT -i lo -j ACCEPT 
$IPTABLES -A FORWARD -i lo -j ACCEPT 
$IPTABLES -A OUTPUT -o lo -j ACCEPT 
$IPTABLES -A FORWARD -o lo -j ACCEPT 
# 
# Rule 0(global)
# 
# 'catch all' rule
# 
$IPTABLES -N RULE_0
$IPTABLES -A OUTPUT -j RULE_0 
$IPTABLES -A INPUT -j RULE_0 
$IPTABLES -A FORWARD -j RULE_0 
$IPTABLES -A RULE_0 -j LOG  --log-level info --log-prefix "RULE 0 -- ACCEPT
" 
$IPTABLES -A RULE_0 -j ACCEPT 
#
#
echo 1 > /proc/sys/net/ipv4/ip_forward




