From: "Tim" <twrodriguez@earthlink.net>
Subject: DNAT & Host Headers
Date: Mon, 30 Jun 2003 21:33:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c33f70$d1e33000$0101a8c0@techinitiatives.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01C33F4F.4A83BE20"
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_001F_01C33F4F.4A83BE20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

First here is the rules within their respective chains:=20

iptables -t nat -A PREROUTING -p tcp --dport 80 -d $INTERNET -j DNAT =
--to $NEMESIS

iptables -A FORWARD -p tcp --dport 80 -d $NEMESIS -j ACCEPT

I'm running this particular web-site with a host header, when I type in =
the www.mydomain.com address on the browser and the packets hit the =
prerouting chain then the forward chain how will the communication still =
know that it is meant for www.mydomain.com

Will this work or do I need to modify the rules in order for my web =
server to recognize that the information is intended for =
www.mydomain.com. As it is there are several web-sites within my =
web-server utilizing the same ip address, including the default =
web-site.

Any insight will be gratefully appreciated.

Thanks in advance
Tim--Mia/Fla.

------=_NextPart_000_001F_01C33F4F.4A83BE20
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
<DIV>
<DIV><FONT face=3DArial size=3D2>First here is the rules within their =
respective=20
chains: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -p tcp =
--dport 80 -d=20
$INTERNET -j DNAT --to $NEMESIS</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -p tcp --dport 80 =
-d $NEMESIS=20
-j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm running this particular web-site =
with a host=20
header, when I type in the www.mydomain.com address on the browser and =
the=20
packets hit the prerouting chain then the forward chain how will the=20
communication still know that it is meant for =
www.mydomain.com</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Will this work or do I need to modify =
the rules in=20
order for my web server to recognize that the information is intended =
for=20
www.mydomain.com. As it is there are several&nbsp;web-sites within my =
web-server=20
utilizing the same ip address, including the default =
web-site.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any insight will be gratefully=20
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tim--Mia/Fla.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV></BODY></HTML>

------=_NextPart_000_001F_01C33F4F.4A83BE20--


