From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: PPTP
Date: Wed, 9 Oct 2002 20:51:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F70@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26FC4.E7D57FAE"
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

------_=_NextPart_001_01C26FC4.E7D57FAE
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Rickard Eriksson [mailto:riceri@home.se] wrote:
>
>The z-newnet patch? I can't install that patch.
>
>BTW, this is the first time i am patching a kernel.
>

Hi Rickard,

What kernel version are you working from ?=20
Basically, newnat is a new API for writing connection tracking/nat
modules.

The patch has been sitting in p-o-m for a long time now, and all the
modules from recent iptables have been converted to work with newnat
and don't apply on kernels witout newnat.

Newnat has been included in the early 2.4.20-pre kernels, so from=20
2.4.20 (or the -pre releases if you don't mind running these) onwards,
there will be no need to patch the kernel with newnat support anymore
before adding conntrackers.

Now, if you're working from a pre-2.4.20 kernel, you need to download
iptables or check out CVS, then from the patch-o-matic directory
run "./runme *" and apply the newnat patch before trying any=20
conntrackers. That sould do the trick. You may need to apply some
additional stuff. IIRC, the pptp patch also needs an "unregister"
fix of some kind that's probably in p-o-m/pending or /submitted.

Good luck,
Filip





------_=_NextPart_001_01C26FC4.E7D57FAE
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

<P><FONT SIZE=3D2>Rickard Eriksson [<A =
HREF=3D"mailto:riceri@home.se">mailto:riceri@home.se</A>] wrote:<BR>
&gt;<BR>
&gt;The z-newnet patch? I can't install that patch.<BR>
&gt;<BR>
&gt;BTW, this is the first time i am patching a kernel.<BR>
&gt;<BR>
<BR>
Hi Rickard,<BR>
<BR>
What kernel version are you working from ?<BR>
Basically, newnat is a new API for writing connection tracking/nat<BR>
modules.<BR>
<BR>
The patch has been sitting in p-o-m for a long time now, and all the<BR>
modules from recent iptables have been converted to work with newnat<BR>
and don't apply on kernels witout newnat.<BR>
<BR>
Newnat has been included in the early 2.4.20-pre kernels, so from<BR>
2.4.20 (or the -pre releases if you don't mind running these) =
onwards,<BR>
there will be no need to patch the kernel with newnat support =
anymore<BR>
before adding conntrackers.<BR>
<BR>
Now, if you're working from a pre-2.4.20 kernel, you need to =
download<BR>
iptables or check out CVS, then from the patch-o-matic directory<BR>
run &quot;./runme *&quot; and apply the newnat patch before trying =
any<BR>
conntrackers. That sould do the trick. You may need to apply some<BR>
additional stuff. IIRC, the pptp patch also needs an =
&quot;unregister&quot;<BR>
fix of some kind that's probably in p-o-m/pending or /submitted.<BR>
<BR>
Good luck,<BR>
Filip<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C26FC4.E7D57FAE--

