From: "John Arthur" <list@davey.net.au>
Subject: RE: redirect port 80 to another port > 1024 on same machine
Date: Tue, 19 Aug 2003 16:23:33 +0930
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GNECLCLHIFNNAHMOKHDPMENLDGAA.list@davey.net.au>
References: <005901c365d9$5c127d10$6564a8c0@redwood.medexpert.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0023_01C3666E.3C3C8220"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005901c365d9$5c127d10$6564a8c0@redwood.medexpert.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: david brant <dbrant@medexpert.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0023_01C3666E.3C3C8220
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

  -----Original Message-----
  From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of david brant
  Sent: Tuesday, 19 August 2003 8:08 AM
  To: netfilter@lists.netfilter.org
  Subject: redirect port 80 to another port > 1024 on same machine


  I need to forward tcp port 80 to tcp port 8080 on the same box.  The
machine does not function as a NAT box and has only a single interface.  Has
anyone come across a rule that might help me out?


------=_NextPart_000_0023_01C3666E.3C3C8220
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4926.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial><FONT color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D298335206-19082003>iptables</SPAN>&nbsp;-t nat -A&nbsp;<SPAN=20
class=3D298335206-19082003>PREROUTING</SPAN> -p tcp --dport 80 -j =
REDIRECT=20
--to-port&nbsp;<SPAN=20
class=3D298335206-19082003>8080</SPAN><BR></FONT></FONT></FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #0000ff 2px =
solid; MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of </B>david=20
  brant<BR><B>Sent:</B> Tuesday, 19 August 2003 8:08 AM<BR><B>To:</B>=20
  netfilter@lists.netfilter.org<BR><B>Subject:</B> redirect port 80 to =
another=20
  port &gt; 1024 on same machine<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial><FONT face=3D"Courier New"><FONT =
size=3D2>I&nbsp;need to=20
  forward tcp port&nbsp;80 to tcp port&nbsp;8080 on the same box.&nbsp; =
The=20
  machine does not function as a NAT box and has only a single =
interface.&nbsp;=20
  Has anyone come across a rule that might help me=20
  =
out?</FONT>&nbsp;<BR></FONT><BR></FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0023_01C3666E.3C3C8220--


