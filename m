From: "Matti Luoma" <matti.luoma@bitboys.com>
Subject: RE: Small problem -> Prerouting
Date: Wed, 16 Apr 2003 15:47:35 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NIENICGJBBAFMLFBMABHGELFCDAA.matti.luoma@bitboys.com>
References: <1050496812.1001.2.camel@india>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0026_01C3042F.7FF3E450"
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1050496812.1001.2.camel@india>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0026_01C3042F.7FF3E450
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

                    Seems to be in use, so i cant remove it, so it has =
to be something else...

                    What module does PREROUTING need anyways?



  On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:=20
Hiya!

Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest =

iptables 1.2.8

now i got this weird problem with

example this line:

iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to =
IP:Port

It should works, and it works, but not anymore, SSH forwarding like this =

works thou

also im gettin some stuff in syslog:

kernel: NAT: 0 dropping untracked packet c66ab6c0

i think these things are related, and probably some module is causing =
this,=20
any ideas?

Cheers,
Matti

I guess this is because of conntrack module. Just check do you need this =
if not remove it. --=20
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain =
privileged or Confidential information. If you have received this =
message in error,please notify the sender and destroy the message =
immediately.Unauthorised use or reproduction of this message is strictly =
prohibited.=20

------=_NextPart_000_0026_01C3042F.7FF3E450
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; CHARSET=3DUTF-8">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D478394312-16042003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Seems to be in use, so i cant remove it, so it has to be something=20
else...</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D478394312-16042003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D478394312-16042003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;What=20
module does PREROUTING need anyways?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D478394312-16042003></SPAN></FONT>&nbsp;</DIV>
<BLOCKQUOTE>
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma><FONT=20
  size=3D2><BR></FONT></FONT>&nbsp;</DIV>On Wed, 2003-04-16 at 17:41, =
Matti Luoma=20
  wrote:=20
  <BLOCKQUOTE><PRE><FONT color=3D#737373><FONT =
size=3D3><I>Hiya!</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>Well i upgraded my kernel to =
2.4.20 from 2.4.3, and also compiled newest </FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>iptables 1.2.8</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>now i got this weird problem =
with</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>example this =
line:</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>iptables -A PREROUTING -t nat -p =
UDP -d IP -dport port -j DNAT --to IP:Port</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>It should works, and it works, =
but not anymore, SSH forwarding like this </FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>works thou</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>also im gettin some stuff in =
syslog:</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>kernel: NAT: 0 dropping =
untracked packet c66ab6c0</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>i think these things are =
related, and probably some module is causing this, </FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>any ideas?</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>Cheers,</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I>Matti</FONT></FONT></I>
<FONT color=3D#737373><FONT size=3D3><I></FONT></FONT></I>
<FONT size=3D3>I guess this is because of conntrack module. Just check =
do you need this if not remove it. </FONT></PRE></BLOCKQUOTE>
  <TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
    <TBODY>
    <TR>
      <TD><PRE>--=20
Regards
Dharmendra.T


This message is intended for the addressee only. It may contain =
privileged or Confidential information. If you have received this =
message in error,please notify the sender and destroy the message =
immediately.Unauthorised use or reproduction of this message is strictly =
prohibited.</PRE></TD></TR></TBODY></TABLE></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0026_01C3042F.7FF3E450--


