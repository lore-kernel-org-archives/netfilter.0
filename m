From: "Vladimir Getselevich" <vladg@techunix.technion.ac.il>
Subject: flushtimeout in ipt_ULOG question
Date: Sat, 17 May 2003 12:31:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c31c5f$89043110$0200c80a@vladcomp>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C31C70.4C694C70"
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

------=_NextPart_000_000D_01C31C70.4C694C70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If I set flushtimeout=3D0 in ipt_ULOG module how much milliseconds will =
pass after a message was
arrived to a linux host, that is guaranteed to me that the message will =
be moved to the userspace?
I run linux on Intel box and I saw the comments in ipt_ULOG.c code that: =


"*   Specify, after how many clock ticks (intel: 100 per second) the =
queue
 * should be flushed even if it is not full yet.

Does it mean that with flushtimeout=3D0 it will be moved to userspace =
somewhere in interval between=20
0 and 10 ms? If it so can I somehow accelerate it?
and what means HZ variable in:   "static unsigned int flushtimeout =3D =
10 * HZ; "

Also is it a right syntax to run module with flushtimeout=3D0?
'insmod ipt_ULOG set flushtimeout=3D0"=20

Please respond on my email (too):  vladg@tx.technion.ac.il

Thank you,
  Vladimir

------=_NextPart_000_000D_01C31C70.4C694C70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2723.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>If I set flushtimeout=3D0 in ipt_ULOG =
module&nbsp;how=20
much milliseconds will pass after&nbsp;a message was</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>arrived to a linux host,&nbsp;that is =
guaranteed to=20
me that the message&nbsp;will be moved to the userspace?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I run linux on Intel box and I =
saw&nbsp;the=20
comments in ipt_ULOG.c code that: </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>"*&nbsp;&nbsp; Specify, after how many =
clock ticks=20
(intel: 100 per second) the queue<BR>&nbsp;* should be flushed even if =
it is not=20
full yet.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Does it mean that with flushtimeout=3D0 =
it will be=20
moved to userspace somewhere in interval between </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>0 and 10 ms? If it so can I somehow =
accelerate=20
it?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and what means HZ&nbsp;variable =
in:&nbsp;&nbsp;=20
"static unsigned int flushtimeout =3D 10 * HZ;&nbsp;"</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Also is it a right syntax <FONT =
face=3DArial=20
size=3D2>to run module with flushtimeout=3D0?</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>'insmod ipt_ULOG set flushtimeout=3D0" =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please respond on my email (too):&nbsp; =
<A=20
href=3D"mailto:vladg@tx.technion.ac.il">vladg@tx.technion.ac.il</A></FONT=
></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp; =
Vladimir</FONT></DIV></BODY></HTML>

------=_NextPart_000_000D_01C31C70.4C694C70--


