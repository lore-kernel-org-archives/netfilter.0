From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: IPTABLES NAT
Date: Wed, 10 Sep 2003 16:18:44 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C293@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C37763.62FE6454"
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
To: Matthew Mileham <matthew@postbag.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C37763.62FE6454
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can you explain your network layout on this?
=20
Are these 2 independant ISPs your connected through?

-----Original Message-----
From: Matthew Mileham [mailto:matthew@postbag.co.za]
Sent: Wednesday, September 10, 2003 4:07 PM
To: Netfilter Mailing List
Subject: IPTABLES NAT

=20
Box1=20
iptables -t nat -A POSTROUTING -o eth1 -s 172.20.128.121 -j SNAT --to =
57.24.224.242
=20
Box2=20
iptables -t nat -A PREROUTING -i eth1 -d 57.24.224.242 -j DNAT --to =
172.20.128.121
=20
=20
=20
=20
=20


------_=_NextPart_001_01C37763.62FE6454
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D298291706-10092003><FONT face=3DArial color=3D#0000ff =
size=3D2>Can=20
you explain your network layout on this?</FONT></SPAN></DIV>
<DIV><SPAN class=3D298291706-10092003><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D298291706-10092003><FONT face=3DArial color=3D#0000ff =
size=3D2>Are=20
these 2 independant ISPs your connected through?</FONT></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Matthew Mileham=20
  [mailto:matthew@postbag.co.za]<BR><B>Sent:</B> Wednesday, September =
10, 2003=20
  4:07 PM<BR><B>To:</B> Netfilter Mailing List<BR><B>Subject:</B> =
IPTABLES=20
  NAT<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Box1 </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o =
eth1 -s=20
  172.20.128.121 -j SNAT --to 57.24.224.242</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Box2 </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -i eth1 =
-d=20
  57.24.224.242 -j DNAT --to 172.20.128.121</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C37763.62FE6454--

