From: "Ivan Zagvozkine" <izagvozkin@yahoo.com.au>
Subject: Iptables
Date: Sat, 31 Jan 2004 19:39:55 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c3e7d5$cd7d3110$1602090a@n00311w0iiz>
Reply-To: "Ivan Zagvozkine" <izagvozkin@yahoo.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001C_01C3E832.00A136C0"
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

------=_NextPart_000_001C_01C3E832.00A136C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

I do not know much about iptables, and have question for you to ask.

I have a network setup:

Red Hat 9.0 ( two interfaces eth0 connected to Internet and eth1 =
connected to LAN, but LAN has public Addreses)

eth0 - internet - public address
eth1- LAN - public addresses

I would like to allow all outbount trafic, and not allow inbound, the =
client behind firewall needs to use VPN and internet browsing, so that =
why we need to have public addresses.

Could any one tell me what the simple firewall script do I need to apply =
on Red Hat 9.0 to achieve it.


Regards



Ivan Zagvozkine
izagvozkin@yahoo.com.au
------=_NextPart_000_001C_01C3E832.00A136C0
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
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I do not know much about iptables, and =
have=20
question for you to ask.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a network setup:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Red Hat 9.0 ( two interfaces eth0 =
connected to=20
Internet and eth1 connected to LAN, but LAN has&nbsp;public=20
Addreses)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>eth0 - internet - public =
address</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1-&nbsp;LAN - public =
addresses</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I would like to allow all outbount =
trafic, and not=20
allow inbound, the client behind firewall needs to use VPN and internet=20
browsing, so that why we need to have public addresses.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Could any one tell me what the simple =
firewall=20
script do I need to apply on Red Hat 9.0 to achieve it.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Ivan Zagvozkine<BR><A=20
href=3D"mailto:izagvozkin@yahoo.com.au">izagvozkin@yahoo.com.au</A></FONT=
></DIV></BODY></HTML>

------=_NextPart_000_001C_01C3E832.00A136C0--


