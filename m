From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: PPTP and netfilter
Date: Tue, 29 Oct 2002 21:05:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD776A5@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C27F86.87657CDA"
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
To: Thomas Kirk <thomas@arkena.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C27F86.87657CDA
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thomas Kirk [mailto:thomas@arkena.com] wrote:
>
>ive loaded the modules :
>
>ip_conntrack_pptp		2400   0  (unused)
>ip_conntrack_proto_gre		2432   0  [ip_conntrack_pptp]
>

Hi Thomas,

You will also have to load ip_nat_pptp.o and ip_nat_proto_gre.o

Regards,
Filip


------_=_NextPart_001_01C27F86.87657CDA
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>RE: PPTP and netfilter</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Thomas Kirk [<A =
HREF=3D"mailto:thomas@arkena.com">mailto:thomas@arkena.com</A>] =
wrote:<BR>
&gt;<BR>
&gt;ive loaded the modules :<BR>
&gt;<BR>
&gt;ip_conntrack_pptp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2400&nbsp;&nbsp; 0&nbsp; =
(unused)<BR>
&gt;ip_conntrack_proto_gre &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2432&nbsp;&nbsp; 0&nbsp; [ip_conntrack_pptp]<BR>
&gt;<BR>
<BR>
Hi Thomas,<BR>
<BR>
You will also have to load ip_nat_pptp.o and ip_nat_proto_gre.o<BR>
<BR>
Regards,<BR>
Filip<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C27F86.87657CDA--

