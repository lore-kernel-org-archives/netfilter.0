From: "Marc Riddle" <mriddle@socal.rr.com>
Subject: PPTP through masquerading gateway
Date: Mon, 8 Jul 2002 11:16:40 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001a01c226ab$9b5e3220$d4524b42@winxp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01C22670.EECCFF80"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0017_01C22670.EECCFF80
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have read everything I can find on the subject and can't seem to find =
a working solution anywhere. I have an NT 4.0 server running a PPTP =
server inside a private network that is connected to the internet via a =
linux 2.4 box running ip masquerading using iptables. the masquerading =
works fine for clients to get out, but I'm trying to enable external =
connections in to the PPTP server. currently I have the following rules =
set up, as far as I can tell they should work, but I am unable to =
establish a connection. The PPTP server is running on 10.1.1.15, and I =
am able to connect to it from inside the router so I know that it is =
running fine. I've been banging my head against a desk for about a week =
now and nothing I've tried seems to work. Any advice would be greatly =
appreciated. Thanks in advance. Oh yeah, currently the rules below are =
the only rules set up for testing, so no incoming packets are being =
filtered that I know of.

Thanks again,

Marc Riddle
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT --to =
10.1.1.15
iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to 10.1.1.15



------=_NextPart_000_0017_01C22670.EECCFF80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2><FONT face=3DArial>I have read everything I can find =
on the=20
subject and can't seem to find a working solution anywhere. I have an NT =
4.0=20
server running a PPTP server inside a private network that is connected =
to the=20
internet via a linux 2.4 box running ip masquerading using iptables. the =

masquerading works fine for clients to get out, but I'm trying to enable =

external connections in to the PPTP server. currently I have the =
following rules=20
set up, as far as I can tell they should work, but I am unable to =
establish a=20
connection. The PPTP server is running on 10.1.1.15, and I am able to =
connect to=20
it from inside the router so I know that it is running fine. I've been =
banging=20
my head against a desk for about a week now and nothing I've tried seems =
to=20
work. Any advice would be greatly appreciated. Thanks in advance. Oh =
yeah,=20
currently the rules below are the only rules set up for testing, so no =
incoming=20
packets&nbsp;are being filtered that I know of.</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks again,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Marc Riddle</FONT></DIV>
<DIV><PRE>iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 1723 -j DNAT --to =
10.1.1.15
iptables -t nat -A PREROUTING -i ppp0 -p 47 -j DNAT --to 10.1.1.15
</PRE></DIV></BODY></HTML>

------=_NextPart_000_0017_01C22670.EECCFF80--



