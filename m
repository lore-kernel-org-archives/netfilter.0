From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: TARPIT Redhat 9 error
Date: Thu, 23 Oct 2003 11:21:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E10119909C@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39947.11A924B2"
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
To: netfilter list <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C39947.11A924B2
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Perhaps I'm being too simplistic, but is that '-m tcp' ok?
=20
Gaby

-----Original Message-----
From: Regalado, Ron [mailto:Ron.Regalado@mci.com]
Sent: woensdag 22 oktober 2003 19:54
To: netfilter@lists.netfilter.org
Subject: TARPIT Redhat 9 error


I have upgraded to iptables 1.2.8, installed the patch-o-matic extra for =
tarpit, recompiled the kernel.  I am getting the error=20
=20
iptables -A INPUT -p tcp -m tcp --dport 135 -j TARPIT
iptables: No chain/target/match by that name
=20
Will tarpit work with redhat's rpm package?
Or do I need to download and install the package from the netfilter =
site?
=20
Thanks,
=20
Ron


------_=_NextPart_001_01C39947.11A924B2
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D383442009-23102003>Perhaps I'm being too simplistic, but is that =
'-m tcp'=20
ok?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D383442009-23102003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D383442009-23102003>Gaby</SPAN></FONT></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Regalado, Ron=20
  [mailto:Ron.Regalado@mci.com]<BR><B>Sent:</B> woensdag 22 oktober 2003 =

  19:54<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> =
TARPIT=20
  Redhat 9 error<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D438185017-22102003>I =
have upgraded to=20
  iptables 1.2.8, installed the patch-o-matic extra for tarpit, =
recompiled the=20
  kernel.&nbsp; I am getting the error </SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -A INPUT -p tcp -m tcp =
--dport 135 -j=20
  TARPIT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>iptables: No chain/target/match by =
that=20
  name</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D438185017-22102003>Will =
tarpit work=20
  with redhat's rpm package?</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D438185017-22102003>Or =
do I need to=20
  download and install the package from the netfilter =
site?</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D438185017-22102003></SPAN></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D438185017-22102003>Thanks,</SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D438185017-22102003></SPAN></FONT>&nbsp;</DIV>
  <DIV><SPAN class=3D438185017-22102003><FONT face=3DArial=20
  size=3D2>Ron</FONT></SPAN></DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C39947.11A924B2--

