From: <vmtesting@hot.ee>
Subject: NAT and test ip's for link
Date: Mon, 17 Feb 2003 15:39:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c2d68a$0fc736a0$01000001@mfa.ee>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C2D69A.D3424B00"
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

This is a multi-part message in MIME format.

------=_NextPart_000_000D_01C2D69A.D3424B00
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi,

I have firewall box with  Redhat 8.0 (kernel 2.4.18-24.8.0) and iptables =
v1.2.6a
installed and 8 public ip addresses ,let's say 195.12.1.0/29.

My firewall box has 3 NIC's.


eth1(195.12.1.1)----FW-----eth2 (192.168.1.2)-----Cisco ---INTERNET
                              |
                              |
                    eth0(10.3.1.1)


Behind eth0 I have planned internal network of 10.3.1.0/24
Behind eth1 will be connected some public computers with no access to =
internal LAN.
Eth2 has a link with Cisco C1601 having test class ip's for link
(192.168.1.0/24 , 192.168.1.2 at fw side and 192.168.1.1 at cisco's =
side)

The reason why I have test ip's for link is that I haven't got enough =
public ip's to
complete my plan.I have 2 servers in internal LAN. Both MUST have =
separate ip's.

When I divide 195.12.1.0/29 into 2 different networks =
195.12.1.0/30(eth2)
and 195.12.1.4/30 I have no ip's left for internal servers.
But in that case  I have no trouble translating internal LAN behind eth0 =
to eth2.

My problem is that I don't know how to translate internal LAN to eth1 =
when I have
test ip's for link at eth2.Being more specific I have no idea how =
accomplish it with
Linux. For Cisco IOS following should work:

interface Ethernet1
 ip address 195.12.1.1 255.255.255.248
 no ip directed-broadcast
 ip nat outside
!
interface Serial0
 ip address 192.168.1.1 255.255.255.0
 no ip directed-broadcast
 ip nat outside
!
ip nat inside source list 1 interface Ethernet1 overload
ip classless
!
access-list 1 permit 10.3.1.0 0.0.0.255

Has anyone implemented similar solution and know's how to translate LAN
to public ip at eth1 (195.12.1.1) while eth2 with test class ip's
is connected to Internet ?

Thanks,
vmtesting

FW box routing table:

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
195.12.1.0      0.0.0.0         255.255.255.248 U     0      0        0 =
eth1
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 =
eth2
10.3.0.0        0.0.0.0         255.255.255.0   U     0      0        0 =
eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 =
lo
0.0.0.0         192.168.1.1     0.0.0.0         UG    0      0        0 =
eth2

IPtables truncated script for NAT:

#!/bin/sh

# This is the location of the iptables command
IPTABLES=3D"/sbin/iptables"


case "$1" in
   stop)
      echo "Shutting down firewall..."
      $IPTABLES -F
      $IPTABLES -F -t mangle
      $IPTABLES -F -t nat
      $IPTABLES -X
      $IPTABLES -X -t mangle
      $IPTABLES -X -t nat
     =20
      $IPTABLES -P INPUT ACCEPT
      $IPTABLES -P OUTPUT ACCEPT
      $IPTABLES -P FORWARD ACCEPT
      echo "...done"
      ;;
   status)
      echo $"Table: filter"
      iptables --list
      echo $"Table: nat"
      iptables -t nat --list
      echo $"Table: mangle"
      iptables -t mangle --list
      ;;
   restart|reload)
      $0 stop
      $0 start
      ;;
   start)
    echo "Starting Firewall..."
    echo ""


##--------------------------Begin =
Firewall---------------------------------##


#----Default-Interfaces-----#

=20
LINKIF=3D"eth2"


EXTIF=3D"eth1"


INTIF=3D"eth0"

INTLAN=3D"10.3.1.0/255.255.255.0"
INTIP=3D"10.3.1.1"
INTMASK=3D"255.255.255.0"
EXTIP=3D"195.12.1.1"

$IPTABLES -F
$IPTABLES -F -t nat
$IPTABLES -X
$IPTABLES -X -t mangle
$IPTABLES -X -t nat

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

###################
##  POSTROUTING  ##
###################

  #Masquerade from Internal Net to External Net
 =20
  $IPTABLES -t nat -A POSTROUTING -o $EXTIF -s $INTLAN  -j SNAT --to =
$EXTIP
=20
 =20
#------End Ruleset------#

echo "...done"
echo ""


echo "{>o-< IPTABLES firewall activated :-))"


##--------------------------------End =
Firewall---------------------------------##



   ;;
   *)
      echo "Usage: firewall (start|stop|restart|status) EXTIF INTIF"
      exit 1
esac

exit 0


------=_NextPart_000_000D_01C2D69A.D3424B00
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff><FONT face=3DArial size=3D2>
<DIV>hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have firewall box with&nbsp; Redhat 8.0 (kernel 2.4.18-24.8.0) =
and=20
iptables v1.2.6a<BR>installed and 8 public ip addresses ,let's say=20
195.12.1.0/29.</DIV>
<DIV>&nbsp;</DIV>
<DIV>My firewall box has 3 NIC's.</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>eth1(195.12.1.1)----FW-----eth2 (192.168.1.2)-----Cisco=20
---INTERNET<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp; |<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; |<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; eth0(10.3.1.1)</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>Behind eth0 I have planned internal network of =
10.3.1.0/24<BR>Behind=20
eth1 will be connected some public computers with no access to internal=20
LAN.<BR>Eth2 has a link with Cisco C1601 having test class ip's for=20
link<BR>(192.168.1.0/24 , 192.168.1.2 at fw side and 192.168.1.1 at =
cisco's=20
side)</DIV>
<DIV>&nbsp;</DIV>
<DIV>The reason why I have test ip's for link is that I haven't got =
enough=20
public ip's to<BR>complete my plan.I have 2 servers in internal LAN. =
Both MUST=20
have separate ip's.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I divide 195.12.1.0/29 into 2 different networks=20
195.12.1.0/30(eth2)<BR>and 195.12.1.4/30 I have no ip's left for =
internal=20
servers.<BR>But in that case&nbsp; I have no trouble translating =
internal LAN=20
behind eth0 to eth2.</DIV>
<DIV>&nbsp;</DIV>
<DIV>My problem is that I don't know how to translate internal LAN to =
eth1 when=20
I have<BR>test ip's for link at eth2.Being more specific I have no idea =
how=20
accomplish it with<BR>Linux. For Cisco IOS following should work:</DIV>
<DIV>&nbsp;</DIV>
<DIV>interface Ethernet1<BR>&nbsp;ip address 195.12.1.1=20
255.255.255.248<BR>&nbsp;no ip directed-broadcast<BR>&nbsp;ip nat=20
outside<BR>!<BR>interface Serial0<BR>&nbsp;ip address 192.168.1.1=20
255.255.255.0<BR>&nbsp;no ip directed-broadcast<BR>&nbsp;ip nat=20
outside<BR>!<BR>ip nat inside source list 1 interface Ethernet1 =
overload<BR>ip=20
classless<BR>!<BR>access-list 1 permit 10.3.1.0 0.0.0.255</DIV>
<DIV>&nbsp;</DIV>
<DIV>Has anyone implemented similar solution and know's how to translate =

LAN<BR>to public ip at eth1 (195.12.1.1) while eth2 with test class =
ip's<BR>is=20
connected to Internet ?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,<BR>vmtesting</DIV>
<DIV>&nbsp;</DIV>
<DIV>FW box routing table:</DIV>
<DIV>&nbsp;</DIV>
<DIV>Kernel IP routing table<BR>Destination&nbsp;&nbsp;&nbsp;&nbsp;=20
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric=20
Ref&nbsp;&nbsp;&nbsp; Use =
Iface<BR>195.12.1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.248=20
U&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth1<BR>192.168.1.0&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth2<BR>10.3.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth0<BR>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
lo<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
192.168.1.1&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
UG&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth2</DIV>
<DIV>&nbsp;</DIV>
<DIV>IPtables truncated script for NAT:</DIV>
<DIV>&nbsp;</DIV>
<DIV>#!/bin/sh</DIV>
<DIV>&nbsp;</DIV>
<DIV># This is the location of the iptables=20
command<BR>IPTABLES=3D"/sbin/iptables"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>case "$1" in<BR>&nbsp;&nbsp; =
stop)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
echo "Shutting down firewall..."<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
$IPTABLES=20
-F<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -F -t=20
mangle<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -F -t=20
nat<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES=20
-X<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -X -t=20
mangle<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -X -t=20
nat<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

$IPTABLES -P INPUT ACCEPT<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -P =
OUTPUT=20
ACCEPT<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $IPTABLES -P FORWARD=20
ACCEPT<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo=20
"...done"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<BR>&nbsp;&nbsp;=20
status)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo $"Table:=20
filter"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables=20
--list<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo $"Table:=20
nat"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -t nat=20
--list<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo $"Table:=20
mangle"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -t mangle=20
--list<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<BR>&nbsp;&nbsp;=20
restart|reload)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $0=20
stop<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $0=20
start<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<BR>&nbsp;&nbsp;=20
start)<BR>&nbsp;&nbsp;&nbsp; echo "Starting =
Firewall..."<BR>&nbsp;&nbsp;&nbsp;=20
echo ""</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>##--------------------------Begin=20
Firewall---------------------------------##</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#----Default-Interfaces-----#</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;<BR>LINKIF=3D"eth2"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>EXTIF=3D"eth1"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>INTIF=3D"eth0"</DIV>
<DIV>&nbsp;</DIV>
<DIV>INTLAN=3D"10.3.1.0/255.255.255.0"<BR>INTIP=3D"10.3.1.1"<BR>INTMASK=3D=
"255.255.255.0"<BR>EXTIP=3D"195.12.1.1"</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -F<BR>$IPTABLES -F -t nat<BR>$IPTABLES -X<BR>$IPTABLES -X =
-t=20
mangle<BR>$IPTABLES -X -t nat</DIV>
<DIV>&nbsp;</DIV>
<DIV>$IPTABLES -P INPUT ACCEPT<BR>$IPTABLES -P OUTPUT =
ACCEPT<BR>$IPTABLES -P=20
FORWARD ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>###################<BR>##&nbsp; POSTROUTING&nbsp;=20
##<BR>###################</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp; #Masquerade from Internal Net to External Net<BR>&nbsp; =
<BR>&nbsp;=20
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s $INTLAN&nbsp; -j SNAT --to=20
$EXTIP<BR>&nbsp;<BR>&nbsp; <BR>#------End Ruleset------#</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "...done"<BR>echo ""</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>echo "{&gt;o-&lt; IPTABLES firewall activated :-))"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>##--------------------------------End=20
Firewall---------------------------------##</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp; ;;<BR>&nbsp;&nbsp; =
*)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo=20
"Usage: firewall (start|stop|restart|status) EXTIF=20
INTIF"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit 1<BR>esac</DIV>
<DIV>&nbsp;</DIV>
<DIV>exit 0</DIV>
<DIV>&nbsp;</DIV>
<DIV></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_000D_01C2D69A.D3424B00--


