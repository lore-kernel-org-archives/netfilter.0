From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 11:03:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E895673@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Sagara Wijetunga <sagaralists@yahoo.com>, netfilter@lists.netfilter.org

I see..

Some questions for you:

You are running the IP connection tracker for FTP in the KERNEL or
MODULE?
You are running the FTP daemon on port 21?
You are *NOT* running an (SSL) FTP daemon, correct? (The current
conntrack module for FTP does _NOT_ support this).


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Sagara
Wijetunga
Sent: Monday, June 21, 2004 10:56 AM
To: netfilter@lists.netfilter.org
Subject: RE: Allow active and passive FTP connections

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
highlighted with "<<=3D=3D Sagara". =20

This is what I have tried:

#!/bin/sh

fw_start() {=20
#######################################
# STEP 1 - SET VARIABLES=20
#######################################
# YOUR LOCAL LOOPBACK DEVICE
LB=3D"lo"
# YOUR PRIVATE INTERFACE=20
#LAN=3D"eth0"	<<=3D=3D Sagara
# YOUR PRIVATE LAN IP
#LIP=3D"192.168.0.253"	<<=3D=3D Sagara
# YOUR LOCAL AREA NETWORK
#LSAT=3D"192.168.0.0/24"	<<=3D=3D Sagara
# YOUR INTERNET INTERFACE
#INET=3D"eth1"	<<=3D=3D Sagara
INET=3D"eth0"
# THE PATH TO IPTABLES
#IPTABLES=3D"/usr/sbin/iptables"	<<=3D=3D Sagara
IPTABLES=3D"/sbin/iptables"
#######################################
# STEP 2 - TURN ON IP FORWARDING
#######################################
#echo "1" > /proc/sys/net/ipv4/ip_forward <<=3D=3D Sagara
#######################################
# STEP 3 - FLUSH EXISTING RULES
#######################################
$IPTABLES --flush INPUT=20
$IPTABLES --flush OUTPUT
$IPTABLES --flush FORWARD
#######################################
# STEP 4 - SET DEFAULT POLICIES
#######################################
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
#######################################
# STEP 5 - CREATE DEFAULT BLOCK CHAIN=20
#######################################
$IPTABLES -N BLOCK=20
$IPTABLES -A BLOCK -j LOG --log-level 3 --log-prefix
"BLOCK: "
$IPTABLES -A BLOCK -j DROP
#######################################
# STEP 6 - SETUP MASQUERADING
#######################################
#$IPTABLES -t nat -A POSTROUTING -o $INET -j
MASQUERADE	<<=3D=3D Sagara
#######################################
# STEP 7 - ALLOW LOCAL ENTITIES=20
#######################################
# ALLOW LOOPBACK
$IPTABLES -A INPUT -i $LB -j ACCEPT=20
# ALLOW LOCAL AREA NETWORK
#$IPTABLES -A INPUT -i $LAN -s $LSAT -j ACCEPT	<<=3D=3D
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
}=20

fw_stop() {
#IPTABLES=3D"/usr/sbin/iptables"	<<=3D=3D Sagara
IPTABLES=3D"/sbin/iptables"
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
=20
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

Jun 21 22:56:07 svr1 kernel: BLOCK: IN=3Deth0 OUT=3D
MAC=3D00:e0:29:34:b3:58:00:e0:29:34:bb:36:08:00
SRC=3D[client IP addr] DST=3D[server IP addr] LEN=3D60
TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D61616 DF PROTO=3DTCP
SPT=3D32936 DPT=3D64638 WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

Pls let me know have I made a mistake.=20

Kind regards
Sagara



	=09
__________________________________
Do you Yahoo!?
Yahoo! Mail - You care about security. So do we.
http://promotions.yahoo.com/new_mail




