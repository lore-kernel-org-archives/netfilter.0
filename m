From: "Ambor" <ambor@alternity.net>
Subject: SSH dnat
Date: Sun, 1 Dec 2002 15:52:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c29949$359d2a70$02a8a8c0@hades>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C29951.96D66970"
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

------=_NextPart_000_0005_01C29951.96D66970
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm trying to dnat SSH throught the firewall to an internal machine.
 I use following Rule

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2323 -j DNAT =
--to-destination internal_IP:2323

eth0 is connected to internet

The problem is that the connection is allrght it just seems that I don't =
get an answer from the ssh server.
(I'm getting a connection timeout, ot a connection refused)

To be sure I don't filter anything, so all trafic is accepted

Can someone help me?

thx

Ronny
------=_NextPart_000_0005_01C29951.96D66970
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello everyone,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm trying to dnat SSH throught the =
firewall to an=20
internal machine.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;I use following Rule</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -i eth0 =
-p tcp=20
--dport 2323&nbsp;-j DNAT --to-destination internal_IP:2323</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>eth0 is connected to =
internet</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The problem is that the connection is =
allrght it=20
just seems that I don't get an answer from the ssh server.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>(I'm getting a connection timeout, ot a =
connection=20
refused)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>To be sure I don't filter anything, so =
all trafic=20
is accepted</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can someone help me?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thx</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Ronny</FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C29951.96D66970--



