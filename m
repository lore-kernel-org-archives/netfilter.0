From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: Patch-o-matic failed... Why?
Date: Wed, 19 Feb 2003 15:28:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD7783F@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D823.338E47A4"
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
To: Alexander Maus <amaus@gmx.de>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2D823.338E47A4
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Alexander,

>
>I'm using kernel 2.4.19 and need the talk-conntrack-patch.
>So I got the latest version of netfilter by CVS.
>Running './runme extra/talk-conntrack-nat.patch' showed:
>
...
>
>My question: What's wrong? I couldn't find any hints about this error =
("Could
>not find place to...").
>

You need to apply all pending and submitted patches first.
More specifically, if you're patching your kernel with
conntrack/nat helpers from recent patch-o-matic, you need=20
newnat support for your kernel. newnat has been submitted
in between 2.4.19 and 2.4.19 so you're probably still
missing this.

Regards,
Filip




------_=_NextPart_001_01C2D823.338E47A4
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
<TITLE>RE: Patch-o-matic failed... Why?</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Alexander,<BR>
<BR>
&gt;<BR>
&gt;I'm using kernel 2.4.19 and need the talk-conntrack-patch.<BR>
&gt;So I got the latest version of netfilter by CVS.<BR>
&gt;Running './runme extra/talk-conntrack-nat.patch' showed:<BR>
&gt;<BR>
...<BR>
&gt;<BR>
&gt;My question: What's wrong? I couldn't find any hints about this =
error (&quot;Could<BR>
&gt;not find place to...&quot;).<BR>
&gt;<BR>
<BR>
You need to apply all pending and submitted patches first.<BR>
More specifically, if you're patching your kernel with<BR>
conntrack/nat helpers from recent patch-o-matic, you need<BR>
newnat support for your kernel. newnat has been submitted<BR>
in between 2.4.19 and 2.4.19 so you're probably still<BR>
missing this.<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2D823.338E47A4--

