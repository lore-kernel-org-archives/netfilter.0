From: "AFShin Abdollahi S." <FreeBSD@exsir.net>
Subject: Round-Robin NAT
Date: Tue, 16 Mar 2004 00:44:37 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002901c40ad2$8da29970$2303010a@flora>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0026_01C40AEF.DBB88120"
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

------=_NextPart_000_0026_01C40AEF.DBB88120
Content-Type: text/plain;
	charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

Dear Friends,
Does IPTABLES supports Round-robin NAT in POSTROUTING ?
I Really need this, the Usage of:
iptables -t nat -A POSTROUTING -j SNAT --to a.b.c.x-a.b.c.y=20
Seems to do Random NAT not Round-robin !
ONLY the pf from OpenBSD can do this As far as I know.
I Hope IPTABLES supports this.
Please help me,
Any comments is really appreciated,
Thanks
AFShin A.

www.EXSIR.net



------=_NextPart_000_0026_01C40AEF.DBB88120
Content-Type: text/html;
	charset="windows-1256"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1256">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Dear Friends,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Does IPTABLES supports Round-robin NAT =
in=20
POSTROUTING ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I Really need this, the Usage =
of:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -j SNAT =
--to=20
a.b.c.x-a.b.c.y </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Seems to do Random NAT not Round-robin=20
!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ONLY the pf from OpenBSD can do this As =
far as I=20
know.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I Hope IPTABLES supports =
this.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Please help me,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Any comments is really =
appreciated,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>AFShin A.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>www.EXSIR.net</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0026_01C40AEF.DBB88120--


