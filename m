From: "Han, Yan" <hany@u.library.arizona.edu>
Subject: UDP for HTTP forwarding??? Prerouting, postrouting, output
Date: Thu, 6 Nov 2003 10:54:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BEA73FB6B8F62545A5B2818724D0DF2902E70868@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C3A48F.14811BB0"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C3A48F.14811BB0
Content-Type: text/plain


I am confused with the IPTables. Please see attachment for the script. 
Some input will be greatly appreciated for one of these questions. (I know
these are long questions!)
 
Basically, we want to forward packets from [$Fido] to [$AtlasDev], the
script works, but my questions remain:
1. Why do we need UDP for forwarding the HTTP packets?  (I tried to disable
Udp lines, but then the script will not work!)

2. What the purpose of PREROUTING, POSTROUTING and OUTPUT?  (We need all of
them in the script to make the HTTP work, but ssh only needs PREROUTING and
POSTROUTING. We guess that HTTP need to send packets back to the client,
while SSH builds up a channel so no need for OUTPUT. Is this guessing
correct? )





------_=_NextPart_000_01C3A48F.14811BB0
Content-Type: text/plain;
	name="atlas_firewall6.sh.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="atlas_firewall6.sh.txt"

#!/bin/sh=0A=
=0A=
# created on Oct 9, 2003 for testing the firewall using IPTables=0A=
=0A=
# Define variables=0A=
Fido=3D"150.135.44.245"  =0A=
AtlasDev=3D"150.135.45.96"=0A=
SpatialDev=3D"150.135.45.97"=0A=
GeoDev=3D"150.135.45.31"=0A=
AtlasFtp=3D"150.135.45.98"=0A=
HTTP_Port=3D"80"=0A=
SSH_Port=3D"22"=0A=
FTP_Port=3D"20:21"=0A=
=0A=
=0A=
IP_Accept_All=3D"150.135.47.43"=0A=
INT=3D"150.135.45.0/16"=0A=
=0A=
echo "***Fido =3D" $Fido=0A=
echo "***AtlasDev =3D" $AtlasDev=0A=
echo "***SpatialDev =3D" $SpatialDev=0A=
echo "***GeoDev =3D" $GeoDev=0A=
echo "***AtlasFtp =3D" $AtlasFtp=0A=
echo "***HTTP_Port =3D" $HTTP_Port=0A=
echo "***FTP_Port =3D" $FTP_Port=0A=
=0A=
=0A=
# Flush all chains=0A=
iptables -F=0A=
iptables -t nat -F=0A=
=0A=
#set the dafault policies; close everything=0A=
iptables -P INPUT DROP   # DROP is ok, but for SMB, ..=0A=
iptables -P OUTPUT DROP =0A=
iptables -P FORWARD ACCEPT  # modify this=0A=
=0A=
=0A=
################################################=0A=
# Allow all outgoing Internet access=0A=
################################################=0A=
iptables -A OUTPUT  -s 150.135.44.245  -d 0/0 -j ACCEPT=0A=
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
=0A=
#Allow all outgoing FORWARD ...error=0A=
## iptables -A FORWARD  -d $Fido -j ACCEPT=0A=
=0A=
#######################################################=0A=
# Allow all traffic from IP_Accept_All  (e.g Samba,...)=0A=
#######################################################=0A=
if [ "$IP_Accept_All" !=3D "" ]; then=0A=
    iptables -A INPUT -s $IP_Accept_All -j ACCEPT=0A=
fi=0A=
=0A=
############## Deny and Log everything else=0A=
#iptables -N logdeny=0A=
#iptables -A logdeny -j LOG --log-prefix "iptables: "=0A=
#iptables -A logdeny -j DROP=0A=
=0A=
#???????????????????????????????????????=0A=
#Allow all outgoing FORWARD ...error !!!!!=0A=
#iptables -A FORWARD  -d $AtlasDev -j ACCEPT=0A=
#iptables -A FORWARD  -d $Fido -j ACCEPT=0A=
###########################################3=0A=
=0A=
=0A=
=0A=
=0A=
##########################################################=0A=
# HTTP:  Forward to Atlas Dev (150.135.45.96 or 10.10.45.96)    #=0A=
##########################################################=0A=
if [ "$Fido" !=3D "" ]; then=0A=
    echo 1 >/proc/sys/net/ipv4/ip_forward=0A=
    echo 1 >/proc/sys/net/ipv4/conf/all/rp_filter=0A=
fi=0A=
=0A=
# UDP is needed, don't know why=0A=
=0A=
if [ "$AtlasDev" !=3D "" ]; then=0A=
    iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p tcp --dport =
$HTTP_Port -j DNAT --to $AtlasDev=0A=
    iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p udp --dport =
$HTTP_Port -j DNAT --to $AtlasDev=0A=
=0A=
    iptables -t nat -A POSTROUTING -p udp --dst $AtlasDev --dport =
$HTTP_Port -j SNAT --to-source $Fido=0A=
    iptables -t nat -A POSTROUTING -p tcp --dst $AtlasDev --dport =
$HTTP_Port -j SNAT --to-source $Fido=0A=
=0A=
    iptables -t nat -A OUTPUT --dst $Fido -p tcp --dport $HTTP_Port -j =
DNAT --to-destination $AtlasDev=0A=
    iptables -t nat -A OUTPUT --dst $Fido -p udp --dport $HTTP_Port -j =
DNAT --to-destination $AtlasDev=0A=
=0A=
fi=0A=
=0A=
=0A=
##########################################################=0A=
# Allow SSH=0A=
##########################################################=0A=
=0A=
if [ "$AtlasDev" !=3D "" ]; then=0A=
    iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p tcp --dport =
$SSH_Port -j DNAT --to $AtlasDev=0A=
    iptables -t nat -A PREROUTING -i eth0 --dst $Fido -p udp --dport =
$SSH_Port -j DNAT --to $AtlasDev=0A=
=0A=
    iptables -t nat -A POSTROUTING -p udp --dst $AtlasDev --dport =
$SSH_Port -j SNAT --to-source $Fido=0A=
    iptables -t nat -A POSTROUTING -p tcp --dst $AtlasDev --dport =
$SSH_Port -j SNAT --to-source $Fido=0A=
=0A=
############ no need to have OUTPUT for ssh =
##############################=0A=
#    iptables -t nat -A OUTPUT --dst $Fido -p tcp --dport $SSH_Port -j =
DNAT --to-destination $AtlasDev=0A=
#    iptables -t nat -A OUTPUT --dst $Fido -p udp --dport $SSH_Port -j =
DNAT --to-destination $AtlasDev=0A=
=0A=
fi=0A=
=0A=
######### previous scripts=0A=
#iptables -A INPUT -i eth0 -p tcp --tcp-flags SYN,ACK,FIN,RST SYN --dst =
$Fido --dport 80 -j ACCEPT=0A=
=0A=
=0A=
echo "Done! Atlas Firewall packet filter policy applied!"=0A=
echo ""=0A=
=0A=
=0A=

------_=_NextPart_000_01C3A48F.14811BB0--

