From: Jay Levitt <lists-netfilter@shopwatch.org>
Subject: RST instead of FIN?
Date: Sat, 10 Apr 2004 14:33:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <05c301c41f2a$4a6ef650$9701a8c0@office>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_05C0_01C41F08.C3458890"
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

------=_NextPart_000_05C0_01C41F08.C3458890
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On my Mandrake 9.0 box (2.4.19-38 kernel), a few times an hour I see TCP =
packets after the end of a TCP session, which result in log/drops in =
iptables.  I ran ethereal to capture one such session, and found that in =
this instance I seem to be the party at fault - but I have no idea why =
or what to do...

66.35.250.206, a sourceforge.net box, connects to my mail server to =
deliver an e-mail, as follows:

sourceforge: [SYN]
me: [SYN, ACK]
sourceforge: [ACK]
[SMTP conversation ensues, switches to TLS, sends me an e-mail.  at the =
end..]
me: [RST]
sourceforge: [FIN, ACK]
me: [RST]
me: [RST]

Since I'd already RST the connection, the [FIN, ACK] was of course =
treated as un-ESTABLISHED, and so was logged and dropped. =20

But what could cause me to be sending three RSTs at the end of a =
conversation instead of a FIN?  Could that be a sendmail problem (I'm =
running 8.12.10), a kernel problem, something else?  The whole =
conversation took 5 seconds, so there are no timeouts occurring...

Jay Levitt
------=_NextPart_000_05C0_01C41F08.C3458890
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>On my Mandrake 9.0 box (2.4.19-38 =
kernel), a few=20
times an hour&nbsp;I see TCP packets after the end of a TCP session, =
which=20
result in log/drops in iptables.&nbsp; I ran ethereal to capture one =
such=20
session, and found that in this instance I seem to be the party at fault =
- but I=20
have no idea why or what to do...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>66.35.250.206, a&nbsp;sourceforge.net =
box, connects=20
to my mail server to deliver an e-mail, as follows:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>sourceforge: [SYN]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>me: [SYN, ACK]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>sourceforge: [ACK]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[SMTP conversation ensues, switches to =
TLS, sends=20
me an e-mail.&nbsp; at the end..]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>me: [RST]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>sourceforge: [FIN, ACK]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>me: [RST]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>me: [RST]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Since I'd already RST the connection, =
the [FIN,=20
ACK] was of course treated as un-ESTABLISHED, and so was logged and=20
dropped.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But what could cause me to be sending =
three RSTs at=20
the end of a conversation instead of a FIN?&nbsp; Could that be a =
sendmail=20
problem (I'm running 8.12.10), a kernel problem, something else?&nbsp; =
The whole=20
conversation took 5 seconds, so there are no timeouts =
occurring...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jay Levitt</FONT></DIV></BODY></HTML>

------=_NextPart_000_05C0_01C41F08.C3458890--


