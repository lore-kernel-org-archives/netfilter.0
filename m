From: <vmtesting@hot.ee>
Subject: problem with ICMP forwarding
Date: Tue, 25 Feb 2003 11:59:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005001c2dcb4$8d678170$01000001@mfa.ee>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004D_01C2DCC5.50E295D0"
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

------=_NextPart_000_004D_01C2DCC5.50E295D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi,

I have redhat 8.0 with iptabes iptables-1.2.6a-2
Problem is  with icmp forwarding between internal host behind linux =
router and=20
Internet.

internal host ------ eth1 --Linux router --eth0-- Internet
=20
Router's routing table:

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use =
Iface
195.12.1.4    10.3.1.2       255.255.255.255 UGH   0      0        0 =
eth1
195.12.1.0     0.0.0.0         255.255.255.240  U       0      0        =
0 eth0
10.3.1.0       0.0.0.0         255.255.255.0     U       0      0        =
0 eth1
127.0.0.0       0.0.0.0         255.0.0.0            U       0      0    =
    0 lo
0.0.0.0         195.12.1.1  0.0.0.0                   UG    0      0     =
   0 eth0

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s $SRV_INT_IP -j SNAT --to =
$SRV_EXT_IP

extif=3D"eth0"
intif=3D"eth1"
srv_int_ip=3D"10.3.1.2"
srv_ext_ip=3D"195.12.1.4"

I changed all default polices to ACCEPT=20
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

#Enable forwarding in kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

Everything works just fine till I try to ping 195.12.1.4 from public =
network.

tcpdump listening at internal interface eth1:
12:48:45.990720 195.80.106.33 > 195.12.1.4: icmp: echo request
12:48:47.157450 195.80.106.33 > 195.12.1.4: icmp: echo request
12:48:48.159049 195.80.106.33 > 195.12.1.4: icmp: echo request
12:48:49.160159 195.80.106.33 > 195.12.1.4: icmp: echo request

when I remove static route=20
195.12.1.4    10.3.1.2       255.255.255.255 UGH   0      0        0 =
eth1
from the routing table I get destination host unreachable message from =
routers external interface while=20
pinging 195.12.1.4 from Internet.

any tcp, udp connection from 10.3.1.2 are ok and translated to =
195.12.1.4.

I just can't figure out why icmp request won't reach 10.3.1.2. My guess =
is that something different must be done with=20
routing table but I'm not sure what.


Any help greatly appreciated.

Thanks,
vmtesting

------=_NextPart_000_004D_01C2DCC5.50E295D0
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
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have redhat 8.0 with iptabes=20
iptables-1.2.6a-2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Problem is &nbsp;with icmp forwarding =
between=20
internal host behind linux router and </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Internet.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>internal host ------ eth1 --Linux=20
router&nbsp;--eth0-- Internet</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Router's routing =
table:</FONT></DIV><FONT=20
face=3DArial size=3D2>
<DIV><BR>Kernel IP routing table<BR>Destination&nbsp;&nbsp;&nbsp;&nbsp;=20
Gateway&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Genmask&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flags Metric=20
Ref&nbsp;&nbsp;&nbsp; Use Iface<BR>195.12.1.4&nbsp;&nbsp;=20
&nbsp;10.3.1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.255.255.255=20
UGH&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 =
eth1<BR>195.12.1.0&nbsp;&nbsp;=20
&nbsp; 0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.240&nbsp; U&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth0<BR>10.3.1.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.0&nbsp;&nbsp;&nbsp;&nbsp; U&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
eth1<BR>127.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
U&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
lo<BR>0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
195.12.1.1&nbsp;=20
0.0.0.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
UG&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth0<BR></DIV>
<DIV>$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s $SRV_INT_IP -j SNAT =
--to=20
$SRV_EXT_IP</DIV>
<DIV>&nbsp;</DIV>
<DIV>extif=3D"eth0"</DIV>
<DIV>intif=3D"eth1"</DIV>
<DIV>srv_int_ip=3D"10.3.1.2"</DIV>
<DIV>srv_ext_ip=3D"195.12.1.4"</DIV>
<DIV>&nbsp;</DIV>
<DIV>I changed all default polices to ACCEPT </DIV>
<DIV>$IPTABLES -P INPUT ACCEPT<BR>$IPTABLES -P OUTPUT =
ACCEPT<BR>$IPTABLES -P=20
FORWARD ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Enable forwarding in kernel<BR>echo 1 &gt;=20
/proc/sys/net/ipv4/ip_forward<BR></DIV>
<DIV>Everything works just fine till I try to ping 195.12.1.4 from =
public=20
network.</DIV>
<DIV>&nbsp;</DIV>
<DIV>tcpdump listening at internal interface eth1:</DIV>
<DIV>12:48:45.990720 195.80.106.33 &gt; 195.12.1.4: icmp: echo=20
request<BR>12:48:47.157450 195.80.106.33 &gt; 195.12.1.4: icmp: echo=20
request<BR>12:48:48.159049 195.80.106.33 &gt; 195.12.1.4: icmp: echo=20
request<BR>12:48:49.160159 195.80.106.33&nbsp;&gt; 195.12.1.4: icmp: =
echo=20
request<BR></DIV>
<DIV>when I remove static route </DIV>
<DIV>195.12.1.4&nbsp;&nbsp; =
&nbsp;10.3.1.2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
255.255.255.255 UGH&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 eth1</DIV>
<DIV>from the routing table I get destination host unreachable message =
from=20
routers external interface while </DIV>
<DIV>pinging 195.12.1.4 from Internet.</DIV>
<DIV>&nbsp;</DIV>
<DIV>any tcp, udp connection from 10.3.1.2 are ok and translated to=20
195.12.1.4.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I just can't figure out why icmp request won't reach 10.3.1.2. My =
guess is=20
that something different must be done with </DIV>
<DIV>routing table but I'm not sure what.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Any help greatly appreciated.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>vmtesting</DIV>
<DIV>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_004D_01C2DCC5.50E295D0--


