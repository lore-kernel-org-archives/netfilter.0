From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 07:56:16 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621145616.43143.qmail@web14716.mail.yahoo.com>
References: <2E314DE03538984BA5634F12115B3A4E89552A@email1.mitretek.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E89552A@email1.mitretek.org>
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
To: netfilter@lists.netfilter.org

--- "Piszcz, Justin Michael"
<justin.piszcz@mitretek.org> wrote:
> This is one of the first iptables firewalls I made
> (2-3 years ago) and
> it does exactly that.
> Let me know if it works for you, thanks.
>
Thanks for your sample firewall.

My server is not connected to a LAN. Therefore, I have
disabled your LAN related rules. All modifications are
highlighted with "<<== Sagara".  

This is what I have tried:

#!/bin/sh

fw_start() { 
#######################################
# STEP 1 - SET VARIABLES 
#######################################
# YOUR LOCAL LOOPBACK DEVICE
LB="lo"
# YOUR PRIVATE INTERFACE 
#LAN="eth0"	<<== Sagara
# YOUR PRIVATE LAN IP
#LIP="192.168.0.253"	<<== Sagara
# YOUR LOCAL AREA NETWORK
#LSAT="192.168.0.0/24"	<<== Sagara
# YOUR INTERNET INTERFACE
#INET="eth1"	<<== Sagara
INET="eth0"
# THE PATH TO IPTABLES
#IPTABLES="/usr/sbin/iptables"	<<== Sagara
IPTABLES="/sbin/iptables"
#######################################
# STEP 2 - TURN ON IP FORWARDING
#######################################
#echo "1" > /proc/sys/net/ipv4/ip_forward <<== Sagara
#######################################
# STEP 3 - FLUSH EXISTING RULES
#######################################
$IPTABLES --flush INPUT 
$IPTABLES --flush OUTPUT
$IPTABLES --flush FORWARD
#######################################
# STEP 4 - SET DEFAULT POLICIES
#######################################
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
#######################################
# STEP 5 - CREATE DEFAULT BLOCK CHAIN 
#######################################
$IPTABLES -N BLOCK 
$IPTABLES -A BLOCK -j LOG --log-level 3 --log-prefix
"BLOCK: "
$IPTABLES -A BLOCK -j DROP
#######################################
# STEP 6 - SETUP MASQUERADING
#######################################
#$IPTABLES -t nat -A POSTROUTING -o $INET -j
MASQUERADE	<<== Sagara
#######################################
# STEP 7 - ALLOW LOCAL ENTITIES 
#######################################
# ALLOW LOOPBACK
$IPTABLES -A INPUT -i $LB -j ACCEPT 
# ALLOW LOCAL AREA NETWORK
#$IPTABLES -A INPUT -i $LAN -s $LSAT -j ACCEPT	<<==
Sagara
#######################################
# STEP 8 - ALLOW SPECIFC TRAFFIC
#######################################
# EXAMPLE OF WHERE AND HOW TO ALLOW INBOUND TRAFFIC.
$IPTABLES -A INPUT -i $INET -p tcp --dport 21 -j
ACCEPT
$IPTABLES -A INPUT -i $INET -p tcp --dport 22 -j
ACCEPT
#######################################
# STEP 9 - ALLOW IN WHAT WE SEND OUT
#######################################
$IPTABLES -A INPUT -m state --state
ESTABLISHED,RELATED -j ACCEPT
#######################################
# STEP 10 - DENY EVERYTHING NOT ALLOWED
#######################################
$IPTABLES -A INPUT -j BLOCK
#######################################
} 

fw_stop() {
#IPTABLES="/usr/sbin/iptables"	<<== Sagara
IPTABLES="/sbin/iptables"
$IPTABLES --flush INPUT
$IPTABLES --flush OUTPUT
$IPTABLES --flush FORWARD
$IPTABLES --flush BLOCK
$IPTABLES --delete-chain BLOCK
}

fw_restart() {
  fw_stop
  fw_start
}
 
case "$1" in
'start')
  fw_start
  ;;
'stop')
  fw_stop
  ;;
'restart')
  fw_restart
  ;;
*)
  echo "usage $0 start|stop|restart"
esac

This is the result of passive FTP connect try:

Jun 21 22:56:07 svr1 kernel: BLOCK: IN=eth0 OUT=
MAC=00:e0:29:34:b3:58:00:e0:29:34:bb:36:08:00
SRC=[client IP addr] DST=[server IP addr] LEN=60
TOS=0x00 PREC=0x00 TTL=64 ID=61616 DF PROTO=TCP
SPT=32936 DPT=64638 WINDOW=5840 RES=0x00 SYN URGP=0

Pls let me know have I made a mistake. 

Kind regards
Sagara



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - You care about security. So do we.
http://promotions.yahoo.com/new_mail

