From: "Power" <ckboy@megasardines.com>
Subject: Firewall with 2 Dial in Modems + Port forwarding
Date: Mon, 1 Sep 2003 09:08:05 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005801c37025$805327a0$0100a8c0@cKServer>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0055_01C37068.8E0CF770"
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
To: NetFilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0055_01C37068.8E0CF770
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

this is my sample script

FWVER=3D0.63

echo -e "\n\nLoading simple rc.firewall version $FWVER..\n"


IPTABLES=3D/sbin/iptables


EXTIF=3D"eth1"
INTIF1=3D"eth0"
INTIF2=3D"ppp0"
INTIF3=3D"ppp1"

echo "   External Interface:  $EXTIF"
echo "   Internal Interface:  $INTIF1"
echo "   Internal Interface:  $INTIF2"
echo "   Internal Interface:  $INTIF3"
echo -en "   loading modules: "

echo "  - Verifying that all kernel modules are ok"
/sbin/depmod -a
echo -en "ip_tables, "
/sbin/insmod ip_tables
echo -en "ip_conntrack, "
/sbin/insmod ip_conntrack
echo -en "ip_conntrack_ftp, "
/sbin/insmod ip_conntrack_ftp
echo -en "ip_conntrack_irc, "
/sbin/insmod ip_conntrack_irc
echo -en "iptable_nat, "
/sbin/insmod iptable_nat
echo -en "ip_nat_ftp, "
/sbin/insmod ip_nat_ftp
echo ".  Done loading modules."

echo "   enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "   enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "   clearing any existing rules and setting default policy.."
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

echo "   FWD: Allow all connections OUT and only existing and related =
ones IN"

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF1 -m state --state =
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF1 -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF2 -m state --state =
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF2 -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF3 -m state --state =
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF3 -o $EXTIF -j ACCEPT

$IPTABLES -A FORWARD -j LOG


$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

echo -e "\nrc.firewall-2.4 v$FWVER done.\n"
[root@delllinux rc.d]# !ip
iptables -L FORWARD
Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state =
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state =
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state =
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
LOG        all  --  anywhere             anywhere           LOG level =
warning

[root@delllinux rc.d]# iptables -t nat -A PREROUTING --dst 192.168.2.90 =
-p tcp --dport 4899 -j DNAT --to-destination 192.168.1.2


My problem is for the iptables command above to work I have to issue the =
command "iptables -P FORWARD ACCEPT"  Can anyone tell me how to allow =
just certain forwarding so I can set the default to DENY? And is this =
firewall script secure enough?
------=_NextPart_000_0055_01C37068.8E0CF770
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>this is my sample script</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>FWVER=3D0.63</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>echo -e "\n\nLoading simple rc.firewall =
version=20
$FWVER..\n"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial =
size=3D2>
<DIV><BR>IPTABLES=3D/sbin/iptables</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>EXTIF=3D"eth1"<BR>INTIF1=3D"eth0"<BR>INTIF2=3D"ppp0"<BR>INTIF3=3D=
"ppp1"</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp;&nbsp; External Interface:&nbsp; $EXTIF"<BR>echo =
"&nbsp;&nbsp;=20
Internal Interface:&nbsp; $INTIF1"<BR>echo "&nbsp;&nbsp; Internal=20
Interface:&nbsp; $INTIF2"<BR>echo "&nbsp;&nbsp; Internal =
Interface:&nbsp;=20
$INTIF3"</DIV>
<DIV>echo -en "&nbsp;&nbsp; loading modules: "</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; - Verifying that all kernel modules are =
ok"<BR>/sbin/depmod=20
-a</DIV>
<DIV>echo -en "ip_tables, "<BR>/sbin/insmod ip_tables<BR>echo -en =
"ip_conntrack,=20
"<BR>/sbin/insmod ip_conntrack<BR>echo -en "ip_conntrack_ftp, =
"<BR>/sbin/insmod=20
ip_conntrack_ftp<BR>echo -en "ip_conntrack_irc, "<BR>/sbin/insmod=20
ip_conntrack_irc<BR>echo -en "iptable_nat, "<BR>/sbin/insmod =
iptable_nat<BR>echo=20
-en "ip_nat_ftp, "<BR>/sbin/insmod ip_nat_ftp</DIV>
<DIV>echo ".&nbsp; Done loading modules."</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp;&nbsp; enabling forwarding.."<BR>echo "1" &gt;=20
/proc/sys/net/ipv4/ip_forward<BR>echo "&nbsp;&nbsp; enabling=20
DynamicAddr.."<BR>echo "1" &gt; /proc/sys/net/ipv4/ip_dynaddr</DIV>
<DIV><BR>echo "&nbsp;&nbsp; clearing any existing rules and setting =
default=20
policy.."<BR>$IPTABLES -P INPUT ACCEPT<BR>$IPTABLES -F =
INPUT<BR>$IPTABLES -P=20
OUTPUT ACCEPT<BR>$IPTABLES -F OUTPUT<BR>$IPTABLES -P FORWARD =
DROP<BR>$IPTABLES=20
-F FORWARD<BR>$IPTABLES -t nat -F</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp;&nbsp; FWD: Allow all connections OUT and only existing =
and=20
related ones IN"</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -A FORWARD -i $EXTIF -o $INTIF1 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A FORWARD -i $INTIF1 -o =
$EXTIF -j=20
ACCEPT<BR>$IPTABLES -A FORWARD -i $EXTIF -o $INTIF2 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A FORWARD -i $INTIF2 -o =
$EXTIF -j=20
ACCEPT</DIV>
<DIV>$IPTABLES -A FORWARD -i $EXTIF -o $INTIF3 -m state --state=20
ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A FORWARD -i $INTIF3 -o =
$EXTIF -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -A FORWARD -j LOG</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo -e "\nrc.firewall-2.4 v$FWVER done.\n"<BR>[root@delllinux =
rc.d]#=20
!ip<BR>iptables -L FORWARD<BR>Chain FORWARD (policy=20
DROP)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state=20
RELATED,ESTABLISHED<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =

anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state=20
RELATED,ESTABLISHED<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =

anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state=20
RELATED,ESTABLISHED<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =

anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere<BR>LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOG =
level=20
warning</DIV>
<DIV><BR>[root@delllinux rc.d]# iptables -t nat -A PREROUTING --dst =
192.168.2.90=20
-p tcp --dport 4899 -j DNAT --to-destination 192.168.1.2</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>My problem is for the iptables command above to work I have to =
issue the=20
command "iptables -P FORWARD ACCEPT"&nbsp; Can anyone tell me how to =
allow just=20
certain forwarding so I can set the default to DENY? And is this =
firewall script=20
secure enough?</DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_0055_01C37068.8E0CF770--


