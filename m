From: "Rowan Reid" <rreid@studio3arc.com>
Subject: RE: VPN behind Linux Firewall
Date: Mon, 24 Jun 2002 10:05:48 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c21ba1$636456c0$6b01a8c0@s3ac>
References: <00ff01c21b9e$fafe0790$0327a8c0@kayegee>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0006_01C21B66.B7057EC0"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00ff01c21b9e$fafe0790$0327a8c0@kayegee>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'kayegee' <tontense4u@hotmail.com>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0006_01C21B66.B7057EC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit



 > I have a LINUX firewall protecting my local LAN. I have 2 computers
that use the Nortel VPN client to connect to my office.  
 
you may want to read up on pptp and IPSec masquarading. I'm not familiar
with Nortels VPN but if it uses pptp or IPSec you need to build in
kernel support for both.  link below.
 
ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html 


------=_NextPart_000_0006_01C21B66.B7057EC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 5.00.2919.6307" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<BLOCKQUOTE style=3D"MARGIN-RIGHT: 0px">
  <DIV align=3Dleft class=3DOutlookMessageHeader dir=3Dltr =
lang=3Den-us><FONT=20
  face=3DTahoma size=3D2><BR></FONT></DIV>
  <DIV><FONT size=3D2><FONT face=3DArial><SPAN =
class=3D234250317-24062002><FONT=20
  color=3D#0000ff>&nbsp;&gt;&nbsp;</FONT></SPAN>I have a LINUX firewall =
protecting=20
  my local LAN. I have 2 computers that use the Nortel VPN client to =
connect to=20
  my office.&nbsp;<FONT color=3D#0000ff><SPAN=20
  class=3D234250317-24062002>&nbsp;</SPAN></FONT></FONT></FONT></DIV>
  <DIV><FONT size=3D2><FONT face=3DArial><FONT color=3D#0000ff><SPAN=20
  class=3D234250317-24062002></SPAN></FONT></FONT></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2><FONT face=3DArial><FONT color=3D#0000ff><SPAN=20
  class=3D234250317-24062002>you may want to read up on pptp and IPSec=20
  masquarading. I'm not familiar with Nortels VPN but if it uses pptp or =
IPSec=20
  you need to build in kernel support for both.&nbsp; link=20
  below.</SPAN></FONT></FONT></FONT></DIV>
  <DIV><FONT size=3D2><FONT face=3DArial><FONT color=3D#0000ff><SPAN=20
  class=3D234250317-24062002></SPAN></FONT></FONT></FONT>&nbsp;</DIV>
  <DIV><FONT size=3D2><FONT face=3DArial><FONT color=3D#0000ff><SPAN=20
  class=3D234250317-24062002><A=20
  =
href=3D"ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html">=
ftp://ftp.rubyriver.com/pub/jhardin/masquerade/ip_masq_vpn.html</A>&nbsp;=
</SPAN></FONT></FONT></FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0006_01C21B66.B7057EC0--


