From: "Roy" <eayman@seed.net.tw>
Subject: Localtime problem
Date: Wed, 11 Sep 2002 20:22:00 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004e01c2598d$e40ca550$0a0aa8c0@roy>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01C259D0.E272A8F0"
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

------=_NextPart_000_0047_01C259D0.E272A8F0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Dear all,             =20
               Did anyone try this function well ?
               I put ulogd_LOCALTIME.c into ulogd-x/extensions =
directory,and replace Rule.make.in in ulogd-xxx/
               It has complied ulogd_LOCALTIME.so and installed.
               add the line=20
                          plugin /usr/local/lib/ulogd/ulogd_LOCALTIME.so
               in ulogd.conf
               Mysql info.
               local_time field value is 1031676302
               It's seems not work,Is my procedure correct ? Thanks for =
your comments.

Regards / Roy

------=_NextPart_000_0047_01C259D0.E272A8F0
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2><FONT face=3DArial color=3D#0000ff>Dear=20
all,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;</FONT></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
Did anyone try this function well ?</FONT></DIV>
<DIV><FONT size=3D2><FONT face=3DArial=20
color=3D#0000ff>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
I put ulogd_LOCALTIME.c into ulogd-x/extensions directory,and replace=20
Rule.make.in in ulogd-xxx/</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
&nbsp;It has complied ulogd_LOCALTIME.so and installed.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; add the line </FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;p=
lugin=20
/usr/local/lib/ulogd/ulogd_LOCALTIME.so</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
&nbsp;in ulogd.conf</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
Mysql info.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;local_time=20
field value is 1031676302</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
It's seems not work,Is my procedure&nbsp;correct ? Thanks for your=20
comments.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2>Regards /=20
Roy</FONT></DIV></FONT></BODY></HTML>

------=_NextPart_000_0047_01C259D0.E272A8F0--


