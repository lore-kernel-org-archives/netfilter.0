From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: PPTP
Date: Wed, 9 Oct 2002 17:04:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F6F@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26FA5.2893AF2A"
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
To: Rickard Eriksson <riceri@home.se>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C26FA5.2893AF2A
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Rickard,

>When i try to install the pptp-conntrack module i get this error:
>
>Testing patch extra/pptp-conntrack-nat.patch...
>    Placed new Config.in line
>    Placed new Configure.help entry
>    Placed new Makefile line
>    Placed new Makefile line
>    Placed new ip_conntrack.h line
>    Placed new ip_conntrack.h line
>Could not find place to slot in ip_conntrack.h line
>Could not find place to slot in ip_conntrack.h line
>Could not find place to slot in ip_conntrack.h line
>Could not find place to slot in ip_conntrack.h line
>Could not find place to slot in ip_conntrack.h line
>Could not find place to slot in ip_conntrack.h line
>TEST FAILED: patch NOT applied.
>
>
>anyone know whats wrong?

You *are* applying this to a kernel with newnat support, aren't you ?

Regards,
Filip



------_=_NextPart_001_01C26FA5.2893AF2A
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
<TITLE>RE: PPTP</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Rickard,<BR>
<BR>
&gt;When i try to install the pptp-conntrack module i get this =
error:<BR>
&gt;<BR>
&gt;Testing patch extra/pptp-conntrack-nat.patch...<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Config.in line<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Configure.help entry<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Makefile line<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Makefile line<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new ip_conntrack.h line<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new ip_conntrack.h line<BR>
&gt;Could not find place to slot in ip_conntrack.h line<BR>
&gt;Could not find place to slot in ip_conntrack.h line<BR>
&gt;Could not find place to slot in ip_conntrack.h line<BR>
&gt;Could not find place to slot in ip_conntrack.h line<BR>
&gt;Could not find place to slot in ip_conntrack.h line<BR>
&gt;Could not find place to slot in ip_conntrack.h line<BR>
&gt;TEST FAILED: patch NOT applied.<BR>
&gt;<BR>
&gt;<BR>
&gt;anyone know whats wrong?<BR>
<BR>
You *are* applying this to a kernel with newnat support, aren't you =
?<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C26FA5.2893AF2A--

