From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: ip_conntrack_lock not readlocked ? anyone ....
Date: Thu, 17 Oct 2002 01:42:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F98@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2756D.B3702934"
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
To: smalik@vistawiz.com, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2756D.B3702934
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

smalik@vistawiz.com [mailto:smalik@vistawiz.com] wrote:
>hello everyone -
>
>I was wondering if someone has seen this error message before.  Prt =
what
>does is mean? I am running iptables 1.2.7.
>
>Oct 13 11:50:18 fire kernel: ASSERT ip_nat_core.c:739
>&ip_conntrack_lock_Rsmp_4193d6ac readlocked
>Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:91
>&ip_conntrack_lock_Rsmp_4193d6ac readlocked
>Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:743 =
&ip_conntrack_lock
>not readlocked
>Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:977
>&ip_conntrack_lock not readlocked
>Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:840 =
&ip_conntrack_lock
>not readlocked
>Oct 13 11:50:18 fire kernel: ASSERT ip_nat_core.c:739
>&ip_conntrack_lock_Rsmp_4193d6ac readlocked
>Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:91
>&ip_conntrack_lock_Rsmp_4193d6ac readlocked
>Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:743 =
&ip_conntrack_lock
>not readlocked
>Oct 13 11:50:18 firekernel: ASSERT: ip_nat_core.c:840 =
&ip_conntrack_lock
>not readlocked
>

Is that on a kernel with newnat, like 2.4.20-pre something ?

It's harmless but annoying - check the archives of netfilter-devel
for the discussion and fix by Martin Josefsson. That fix is already
in 2.4.20-pre11.

Regards,
Filip





------_=_NextPart_001_01C2756D.B3702934
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
<TITLE>RE: ip_conntrack_lock not readlocked ? anyone ....</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
smalik@vistawiz.com [<A =
HREF=3D"mailto:smalik@vistawiz.com">mailto:smalik@vistawiz.com</A>] =
wrote:<BR>
&gt;hello everyone -<BR>
&gt;<BR>
&gt;I was wondering if someone has seen this error message before.&nbsp; =
Prt what<BR>
&gt;does is mean? I am running iptables 1.2.7.<BR>
&gt;<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT ip_nat_core.c:739<BR>
&gt;&amp;ip_conntrack_lock_Rsmp_4193d6ac readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:91<BR>
&gt;&amp;ip_conntrack_lock_Rsmp_4193d6ac readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:743 =
&amp;ip_conntrack_lock<BR>
&gt;not readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:977<BR>
&gt;&amp;ip_conntrack_lock not readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:840 =
&amp;ip_conntrack_lock<BR>
&gt;not readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT ip_nat_core.c:739<BR>
&gt;&amp;ip_conntrack_lock_Rsmp_4193d6ac readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT ip_conntrack_core.c:91<BR>
&gt;&amp;ip_conntrack_lock_Rsmp_4193d6ac readlocked<BR>
&gt;Oct 13 11:50:18 fire kernel: ASSERT: ip_nat_core.c:743 =
&amp;ip_conntrack_lock<BR>
&gt;not readlocked<BR>
&gt;Oct 13 11:50:18 firekernel: ASSERT: ip_nat_core.c:840 =
&amp;ip_conntrack_lock<BR>
&gt;not readlocked<BR>
&gt;<BR>
<BR>
Is that on a kernel with newnat, like 2.4.20-pre something ?<BR>
<BR>
It's harmless but annoying - check the archives of netfilter-devel<BR>
for the discussion and fix by Martin Josefsson. That fix is already<BR>
in 2.4.20-pre11.<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2756D.B3702934--

