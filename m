From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: on high load the connections drop
Date: Tue, 1 Oct 2002 16:30:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F3D@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26957.1E4FDF53"
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
To: root@dworf.com, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C26957.1E4FDF53
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dworf [mailto:root@dworf.com] wrote:
>
>In high loads (when iptables DROP packets couse of Syn Flood I get =
`kernel:=20
>eth0: Too much work in interrupt, status e401.`  message and the =
connections=20
>drop after about 20mins of constant attack. I think it could be the =
buffer=20
>filling up or somthing? Is there any patch for iptables to flush the =
buffer=20
>or somthing? or a patch for high loads?
>

Hi,

This message is not coming from iptables but from your network
card driver, hence the driver is where you should look at.

It may be possible to adjust some parameters to set buffer sizes
etc for the driver. One other thing to look at is the NAPI
framework (in 2.5 but it's available as a patch to 2.4 kernel,
I think it already in the 2.4.20-pre kernels) to mitigate high
network traffic interrupts coming from NICs. Google for NAPI
and you'll find the URL.

Good luck,
Filip



------_=_NextPart_001_01C26957.1E4FDF53
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
<TITLE>RE: on high load the connections drop</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Dworf [<A =
HREF=3D"mailto:root@dworf.com">mailto:root@dworf.com</A>] wrote:<BR>
&gt;<BR>
&gt;In high loads (when iptables DROP packets couse of Syn Flood I get =
`kernel:<BR>
&gt;eth0: Too much work in interrupt, status e401.`&nbsp; message and =
the connections<BR>
&gt;drop after about 20mins of constant attack. I think it could be the =
buffer<BR>
&gt;filling up or somthing? Is there any patch for iptables to flush the =
buffer<BR>
&gt;or somthing? or a patch for high loads?<BR>
&gt;<BR>
<BR>
Hi,<BR>
<BR>
This message is not coming from iptables but from your network<BR>
card driver, hence the driver is where you should look at.<BR>
<BR>
It may be possible to adjust some parameters to set buffer sizes<BR>
etc for the driver. One other thing to look at is the NAPI<BR>
framework (in 2.5 but it's available as a patch to 2.4 kernel,<BR>
I think it already in the 2.4.20-pre kernels) to mitigate high<BR>
network traffic interrupts coming from NICs. Google for NAPI<BR>
and you'll find the URL.<BR>
<BR>
Good luck,<BR>
Filip<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C26957.1E4FDF53--

