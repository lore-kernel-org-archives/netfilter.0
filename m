From: "Ryan Beisner" <ryanb@thedataarc.com>
Subject: WAP11:  1-to-1 NAT (DMZ)
Date: Wed, 18 Sep 2002 17:59:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c25f67$1a21fb20$64dc0a0a@dataarc>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0034_01C25F3D.31320280"
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

------=_NextPart_000_0034_01C25F3D.31320280
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In Watchguard's Firebox system, there is a term called 1-to-1 NAT, a new =
one to me.  This is used in reference to a packet filtering router =
protecting a DMZ from the WWW.  Its principle is the same applied to =
achieve my "virtual host."

        iptables -A PREROUTING -t nat -d 10.20.0.4 -j DNAT --to =
192.168.168.2
        iptables -A POSTROUTING -t nat -d 192.168.168.2 -j SNAT --to =
10.20.0.4

Now I want to enable certain ports (for instance, 22 and 80) and deny =
everything else. =20
When is the appropriate time to add protocol filters, before or after =
these two lines?  And what would they look like?

192.168.168.2 is a Linksys WAP11 behind the firewall
10.20.0.4 is a Virtual IP on the external interface (which is already =
firewalled down the line).





Thanks!
-Ryan Beisner

------=_NextPart_000_0034_01C25F3D.31320280
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>In Watchguard's Firebox system, there =
is a term=20
called 1-to-1 NAT, a new one to me.&nbsp; This is used in reference to a =
packet=20
filtering router protecting a DMZ from the WWW.&nbsp; Its principle is =
the same=20
applied to achieve my "virtual host."</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables=20
-A PREROUTING -t nat -d 10.20.0.4 -j DNAT --to=20
192.168.168.2<BR>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; iptables -A =
POSTROUTING=20
-t nat -d 192.168.168.2 -j SNAT --to 10.20.0.4</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Now I want to enable certain ports (for =
instance,=20
22 and 80) and deny everything else.&nbsp; </FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When is the appropriate time to add =
protocol=20
filters, before or after these two lines?&nbsp; And what would they look =

like?</FONT></DIV></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>192.168.168.2 is a Linksys =
WAP11&nbsp;behind the=20
firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>10.20.0.4 is a Virtual IP on the =
external interface=20
(which is already firewalled down the line).</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-Ryan =
Beisner</FONT></DIV></BODY></HTML>

------=_NextPart_000_0034_01C25F3D.31320280--



