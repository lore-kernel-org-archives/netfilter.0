From: "omerakoz" <omerakoz@e-kolay.net>
Subject: YNT: ipip tunnel connection tracking
Date: Mon, 12 Apr 2004 08:55:45 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <23AD2F621376A84EB19BDB1ED3E6D470090FB8B2@excbe02.ekolayint.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C42052.CC3B3B5C"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org
Cc: Antony@Soft-Solutions.co.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C42052.CC3B3B5C
Content-Type: text/plain;
	charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable

	Dear all,=20
	=20
	I work on Mobile IP, I use Dynamics HUT Mobile IP implementation, It =
uses IPIP tunneling between FAs and HAs, and Anthony is right because =
netfilter tracks the outer src and dst addresses. However, I have to see =
the connections of Mobile Node and Correspondent Node in Iptables =
firewall, so I need to track the inner src and dst addresses,=20
=09

	Is there any other possibilities that how  I can do it ?=20
	=20
	Best regards,
	=20
	Omer Akoz.
	=20
	-----=D6zg=FCn =DDleti-----=20
	Kimden: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
	G=F6nderilmi=FE: Paz 11.04.2004 23:34=20
	Kime: netfilter@lists.netfilter.org=20
	Bilgi:=20
	Konu: Re: ipip tunnel connection tracking
=09
=09

	On Sunday 11 April 2004 8:09 pm, =D6mer Ak=F6z wrote:
=09
	> I am working on connection tracking of ipip tunnel packets, while =
using
	> ipip tunneling, in the ip_conntrack file, I see the outer src. and =
dst.
	> addresses, I try to see original src and dst addresses.
	>
	> Is there any module to do this ? I see the "ip_conntrack_proto_gre", =
I
	> think it makes this shows original addresses in gre packets ?
=09
	Why would a connection tracking module need to know about the addreses =
inside
	the packets, rather than the addresses in the headers?
=09
	I might be wrong (I haven't used the GRE conntrack module), but I would =
expect
	it to be interested in the source & destination addresses of the =
packets it's
	handling through the machine, rather than the source & destination =
addresses
	of the packets inside the packets.
=09
	After all, isn't that what a tunnel is all about?   The routers along =
the way
	just deal with the outer addresses, not the addresses inside?
=09
	Regards,
=09
	Antony.
=09
	--
	Most people have more than the average number of legs.
=09
	                                                     Please reply to =
the list;
	                                                           please don't =
CC me.
=09
=09
=09


------_=_NextPart_001_01C42052.CC3B3B5C
Content-Type: text/html;
	charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-9">=0A=
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">=0A=
<HTML>=0A=
<HEAD>=0A=
=0A=
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6389.0">=0A=
<TITLE>Re: ipip tunnel connection tracking</TITLE>=0A=
</HEAD>=0A=
<BODY dir=3Dltr>=0A=
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">=0A=
  <DIV><FONT size=3D2>Dear all, </FONT></DIV>=0A=
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>=0A=
  <DIV><FONT size=3D2>I work on Mobile IP,&nbsp;I use Dynamics HUT =
Mobile IP =0A=
  implementation, It uses IPIP tunneling between FAs and HAs, and =
Anthony is =0A=
  right because netfilter tracks the outer src and dst addresses. =
However, I =0A=
  have to see the connections of Mobile Node and Correspondent Node in =
Iptables =0A=
  firewall, so I need to track the inner src and dst addresses, =0A=
  </FONT></DIV><FONT size=3D2>=0A=
  <DIV><BR>Is there any other possibilities that how&nbsp; I can do it ? =
</DIV>=0A=
  <DIV>&nbsp;</DIV>=0A=
  <DIV>Best regards,</DIV>=0A=
  <DIV>&nbsp;</DIV>=0A=
  <DIV>Omer Akoz.</FONT></DIV>=0A=
  <DIV><FONT size=3D2></FONT>&nbsp;</DIV>=0A=
  <DIV><FONT size=3D2>-----=D6zg=FCn =DDleti----- <BR><B>Kimden:</B> =
Antony Stone =0A=
  [mailto:Antony@Soft-Solutions.co.uk] <BR><B>G=F6nderilmi=FE:</B> Paz =
11.04.2004 =0A=
  23:34 <BR><B>Kime:</B> netfilter@lists.netfilter.org <BR><B>Bilgi:</B> =0A=
  <BR><B>Konu:</B> Re: ipip tunnel connection =
tracking<BR><BR></DIV></FONT>=0A=
  <P><FONT size=3D2>On Sunday 11 April 2004 8:09 pm, =D6mer Ak=F6z =
wrote:<BR><BR>&gt; =0A=
  I am working on connection tracking of ipip tunnel packets, while =0A=
  using<BR>&gt; ipip tunneling, in the ip_conntrack file, I see the =
outer src. =0A=
  and dst.<BR>&gt; addresses, I try to see original src and dst =0A=
  addresses.<BR>&gt;<BR>&gt; Is there any module to do this ? I see the =0A=
  "ip_conntrack_proto_gre", I<BR>&gt; think it makes this shows original =0A=
  addresses in gre packets ?<BR><BR>Why would a connection tracking =
module need =0A=
  to know about the addreses inside<BR>the packets, rather than the =
addresses in =0A=
  the headers?<BR><BR>I might be wrong (I haven't used the GRE conntrack =0A=
  module), but I would expect<BR>it to be interested in the source &amp; =0A=
  destination addresses of the packets it's<BR>handling through the =
machine, =0A=
  rather than the source &amp; destination addresses<BR>of the packets =
inside =0A=
  the packets.<BR><BR>After all, isn't that what a tunnel is all =0A=
  about?&nbsp;&nbsp; The routers along the way<BR>just deal with the =
outer =0A=
  addresses, not the addresses =0A=
  inside?<BR><BR>Regards,<BR><BR>Antony.<BR><BR>--<BR>Most people have =
more than =0A=
  the average number of =0A=
  =
legs.<BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
  Please reply to the =0A=
  =
list;<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
  please don't CC me.<BR><BR><BR></FONT></P></BLOCKQUOTE>=0A=
=0A=
</BODY>=0A=
</HTML>
------_=_NextPart_001_01C42052.CC3B3B5C--

