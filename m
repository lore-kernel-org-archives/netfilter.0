From: "Urban Spielmann" <spielmann@it-insourcing.ch>
Subject: pptp NAT modules prevent pptp-server behind NAT machine
Date: Wed, 28 May 2003 09:25:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A9B668705BE3754790A3C32C768214946DB5@pluto.insourcing.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C324EA.556EDF5C"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: laforge@netfilter.org
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C324EA.556EDF5C
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 May 2003 18:14:02 +0200, Harald Welte wrote:
=20
> There is a bug in the current helper, which prevents a locally-running
> pptp server on the NAT machine.  I have a fix here, but I still need
to
> test it...
=20
Dear Harald Welte,
=20
this fix looks exactly what I would need.
=20
I patched my kernel with this pptp_nat stuff.
And did:
modprobe ip_conntrack_proto_gre
modprobe ip_nat_pptp
modprobe ip_nat_proto_gre

So now I could work with multiple pptp-clients behind my firewall. Very
good :-)
But now I could not reach my pptp-server anymore from outside. :-(
=20
If I do not start this three modules above my pptp-server is reachable,
but then I cannot do multiple pptp-client connections anymore.
=20
Will your fix solve this problem?
Where can I get it?
=20
Thank for any help.
=20
Best regards,
Urban Spielmann
=20

------_=_NextPart_001_01C324EA.556EDF5C
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Nachricht</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D337524006-28052003>On =
<FONT=20
size=3D3><FONT face=3D"Times New Roman"><EM>Mon, 19 May 2003 18:14:02 =
+0200,=20
</EM><STRONG>Harald Welte =
wrote:</STRONG></FONT></FONT></SPAN></FONT></DIV>
<DIV><FONT face=3D"Times New Roman" size=3D3><SPAN=20
class=3D337524006-28052003><STRONG></STRONG></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman" size=3D3><SPAN =
class=3D337524006-28052003>&gt;=20
There is a bug in the current helper, which prevents a =
locally-running<BR>&gt;=20
pptp server on the NAT machine.&nbsp; I have a fix here, but I still =
need=20
to<BR>&gt; test it...</SPAN></FONT></DIV>
<DIV><FONT face=3D"Times New Roman" size=3D3><SPAN=20
class=3D337524006-28052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman" size=3D3><SPAN =
class=3D337524006-28052003><FONT=20
face=3DArial size=3D2>Dear Harald Welte,</FONT></SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D337524006-28052003>this =
fix looks=20
exactly what I would need.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D337524006-28052003></SPAN></FONT><FONT=20
face=3D"Times New Roman" size=3D3><SPAN =
class=3D337524006-28052003>&nbsp;</DIV>
<DIV><SPAN class=3D337524006-28052003></SPAN><FONT face=3DArial><FONT =
size=3D2>I<SPAN=20
class=3D337524006-28052003> patched my kernel with this pptp_nat=20
stuff.</SPAN></FONT></FONT></DIV>
<DIV><FONT><FONT size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT></FONT><SPAN=20
class=3D337524006-28052003></SPAN><FONT face=3DArial><FONT =
size=3D2>A<SPAN=20
class=3D337524006-28052003>nd did:</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>modprobe=20
ip_conntrack_proto_gre<BR>modprobe ip_nat_pptp<BR>modprobe=20
ip_nat_proto_gre<BR></SPAN></FONT></FONT></DIV>
<DIV><SPAN class=3D337524006-28052003></SPAN><FONT face=3DArial><FONT =
size=3D2>S<SPAN=20
class=3D337524006-28052003>o now I could work with multiple pptp-clients =
behind my=20
firewall. Very good :-)</SPAN></FONT></FONT></DIV>
<DIV><FONT><FONT size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT></FONT><SPAN=20
class=3D337524006-28052003></SPAN><FONT face=3DArial><FONT =
size=3D2>B<SPAN=20
class=3D337524006-28052003>ut now I could not reach&nbsp;my pptp-server =
anymore=20
from outside. :-(</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>If I do not=20
start this three modules above&nbsp;my pptp-server is reachable, but =
then I=20
cannot do multiple pptp-client connections =
anymore.</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>Will your fix=20
solve this problem?</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>Where can I=20
get it?</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>Thank for any=20
help.</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D337524006-28052003></SPAN></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>Best=20
regards,</SPAN></FONT></FONT></DIV>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D337524006-28052003>Urban=20
Spielmann</SPAN></FONT></FONT></DIV></SPAN></FONT>
<DIV>&nbsp;</DIV></BODY></HTML>
=00
------_=_NextPart_001_01C324EA.556EDF5C--

