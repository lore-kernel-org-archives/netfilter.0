From: "Arnold Rebullida" <arnoldbr@optusnet.com.au>
Subject: port forwarding for PPTP Server
Date: Sun, 18 May 2003 01:35:16 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c31c89$ebc465c0$0500a8c0@station>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C31CDD.BC11F730"
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

------=_NextPart_000_0005_01C31CDD.BC11F730
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

HI,

I have trying to setup MS PPTP server (192.168.10.11)  behind a linux =
firewall. I used the following scripts
eth0 is connected to the internet, eth1 is connected to PPTP server.


echo 1 > /proc/sys/net/ipv4/ip_forward
Iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT --to =
192.168.10.11
iptables -t nat -A PREROUTING -i eth0 -p 47 -j DNAT --to 192.168.10.11

it doesn't seem to work. is there anything I missed? My kernel is =
2.4.18-14.

please help

thanks

arnold
------=_NextPart_000_0005_01C31CDD.BC11F730
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>HI,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have trying to setup MS PPTP server=20
(192.168.10.11)&nbsp; behind a linux firewall. I used the following=20
scripts</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0 is connected to the internet, eth1 =
is=20
connected to PPTP server.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>echo 1 &gt;=20
/proc/sys/net/ipv4/ip_forward</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Iptables -t nat -A PREROUTING -i eth0 =
-p tcp=20
--dport 1723 -j DNAT --to 192.168.10.11</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -i eth0 =
-p 47 -j DNAT=20
--to 192.168.10.11</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>it doesn't seem to work. is there =
anything I=20
missed? My kernel is 2.4.18-14.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>please help</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>arnold</FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C31CDD.BC11F730--


