From: "Antti Korpela" <antti.korpela@pp6.inet.fi>
Subject: iptables questions
Date: Sat, 15 Nov 2003 12:51:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003601c3ab66$7396c360$2178df50@lanzor2k.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0033_01C3AB77.3702E3A0"
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

------=_NextPart_000_0033_01C3AB77.3702E3A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have here some questions and i hope you have some time to answer

1. What difference and which is better between: iptables -t nat -j =
MASQUERADE or SNAT --to IP if im using it for internet gateway =
NAT-machine in big LAN-parties, over 300 IP:s.
2. I have get this error often "too much work on eth0, dropping =
packet..." what this mean? do i have to put this on kernel:
echo "65000" > /proc/sys/net/ipv4/ip_conntrack_max ? is there any other =
solutions for this ?
3. Do you have some other tips for MASQ ? :)

Thanks for your time and support!
------=_NextPart_000_0033_01C3AB77.3702E3A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have here some questions and i hope =
you have some=20
time to answer</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1. What difference and which is better =
between:=20
iptables -t nat -j MASQUERADE&nbsp;or SNAT --to IP if im using it for =
internet=20
gateway NAT-machine in big LAN-parties, over 300 IP:s.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>2. I have get this error often "too =
much work on=20
eth0, dropping packet..." what this mean? do i have to put this on=20
kernel:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D2>echo "65000" &gt;=20
/proc/sys/net/ipv4/ip_conntrack_max ? is there any other solutions for =
this=20
?</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D2>3. Do you have some =
other tips for=20
MASQ ? :)</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT size=3D2>Thanks for your time and =

support!</DIV></FONT></FONT></BODY></HTML>

------=_NextPart_000_0033_01C3AB77.3702E3A0--


