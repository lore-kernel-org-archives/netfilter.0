From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: PPTP
Date: Fri, 11 Oct 2002 19:23:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F79@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2714A.E4111F2A"
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
To: Rickard Eriksson <riceri@home.se>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2714A.E4111F2A
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Rickard Eriksson [mailto:riceri@home.se] wrote:
>
>When i try to restart and load the modules i get a error, i didn't copy =

>it but it was something about "unresolved ... helper"
>And i can't find any setting in "make config" so that it shall make the =

>helper in any way.
>
>Do you know what i am talking  about :)
>

Vaguely :-)

Are you loading the modules with "insmod" or with "modprobe" ?
After a correct kernel compile you shouldn't get unresolved
symbols with modprobe. Although, iirc, there is a dependency
thingie with the pptp conntracker (modprobe ip_?_pptp doesn't
trigger the loading of ip_?_proto_gre, I think).

Can you try the following for pptp and load any other modules
with modprobe instead of insmod and report any problems:

modprobe ip_conntrack_proto_gre
modprobe ip_nat_proto_gre
modprobe ip_conntrack_pptp
modprobe ip_nat_pptp

This shouldn't give problems.

Regards,
Filip








------_=_NextPart_001_01C2714A.E4111F2A
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

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
Rickard Eriksson [<A =
HREF=3D"mailto:riceri@home.se">mailto:riceri@home.se</A>] wrote:<BR>
&gt;<BR>
&gt;When i try to restart and load the modules i get a error, i didn't =
copy<BR>
&gt;it but it was something about &quot;unresolved ... helper&quot;<BR>
&gt;And i can't find any setting in &quot;make config&quot; so that it =
shall make the<BR>
&gt;helper in any way.<BR>
&gt;<BR>
&gt;Do you know what i am talking&nbsp; about :)<BR>
&gt;<BR>
<BR>
Vaguely :-)<BR>
<BR>
Are you loading the modules with &quot;insmod&quot; or with =
&quot;modprobe&quot; ?<BR>
After a correct kernel compile you shouldn't get unresolved<BR>
symbols with modprobe. Although, iirc, there is a dependency<BR>
thingie with the pptp conntracker (modprobe ip_?_pptp doesn't<BR>
trigger the loading of ip_?_proto_gre, I think).<BR>
<BR>
Can you try the following for pptp and load any other modules<BR>
with modprobe instead of insmod and report any problems:<BR>
<BR>
modprobe ip_conntrack_proto_gre<BR>
modprobe ip_nat_proto_gre<BR>
modprobe ip_conntrack_pptp<BR>
modprobe ip_nat_pptp<BR>
<BR>
This shouldn't give problems.<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2714A.E4111F2A--

