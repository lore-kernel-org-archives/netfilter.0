From: "subramanya" <angeeras@satyam.net.in>
Subject: help regarding DNAT
Date: Tue, 3 Jun 2003 09:55:23 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002f01c32988$27c02220$7673d6d2@sify.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002C_01C329B6.4085C0C0"
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

------=_NextPart_000_002C_01C329B6.4085C0C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

i am a student doing my final year engineering project work.

i am faced with a problem:i want to DNAT all the packets and ia m using =
the following command:

iptables -t nat -I PREROUTING -p ALL -j DNAT -s xx.xx.xx.xx -d =
yy.yy.yy.yy --to-destination zz.zz.zz.zz

this works fine on a router. but this doesnot work on a machine that =
acts as a bridge. the packets that are entering the PREROUTING chain are =
lost in that chain.

what could the problem be? plz help




------=_NextPart_000_002C_01C329B6.4085C0C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>i am a student doing my =
final year=20
engineering project work.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>i am faced with a =
problem:i want to=20
DNAT all the packets and ia m using the following command:</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>iptables -t nat -I =
PREROUTING -p ALL=20
-j DNAT -s xx.xx.xx.xx -d yy.yy.yy.yy --to-destination =
zz.zz.zz.zz</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>this works fine on a =
router. but this=20
doesnot work on a machine that acts as a bridge. the packets that are =
entering=20
the PREROUTING chain are lost in that chain.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>what could the problem =
be? plz=20
help</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 =
size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_002C_01C329B6.4085C0C0--


