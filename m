From: "Chandana Bandara" <curlybraces@dialogsl.net>
Subject: iptables / DHCP
Date: Thu, 13 Nov 2003 18:35:23 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c3a9e2$9ba23db0$0d1ea8c0@win2000adv>
Reply-To: "Chandana Bandara" <curlybraces@dialogsl.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0019_01C3AA14.E631FF50"
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

------=_NextPart_000_0019_01C3AA14.E631FF50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi  dear friends

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

initially i put those entries in a file . after that i execute that file =
. it runs well .=20
This firewall try to configure in a DHCP server.=20
but when i checked with the dhcp clients this fire wall didn't activate. =
that's mean client getting the ip from the server . ( at this point i =
try to test the firewall entries )

thanx
=20



------=_NextPart_000_0019_01C3AA14.E631FF50
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
<DIV><FONT face=3DArial size=3D2>hi&nbsp; dear friends</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables&nbsp;-P INPUT =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -P&nbsp;FORWARD =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -P OUTPUT DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>initially i put those entries in a file =
. after=20
that i execute that file . it runs well . </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>This firewall try to configure in a =
DHCP server.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>but when i checked&nbsp;with the dhcp =
clients this=20
fire wall didn't activate. that's mean client getting the ip from the =
server . (=20
at this point i try to test the firewall entries )</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanx</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0019_01C3AA14.E631FF50--


