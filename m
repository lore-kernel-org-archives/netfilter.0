From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: ip_nat_pptp & ip_conntrack_pptp help appreciated.
Date: Tue, 1 Oct 2002 00:22:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615F38@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C268CF.E981A8A1"
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
To: Kjetil Laasby <Kjetil@laasby.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C268CF.E981A8A1
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Kjetil Laasby [mailto:Kjetil@laasby.com] wrote:
>
>Following interessting modules are loaded :=20
>------------------------------------------------
>ip_conntrack_pptp       3392   0  (autoclean)
>ip_conntrack_proto_gre  3328   0  [ip_conntrack_pptp]
>ipt_REDIRECT            1408   0  (autoclean)
>ppp_mppe               24736   0  (autoclean)
>ppp_async               8096   0  (autoclean)
>ppp_generic            23692   0  (autoclean) [ppp_mppe ppp_async]
>slhc                    6092   0  (autoclean) [ppp_generic]
>ipt_multiport           1216   5  (autoclean)
>ipt_LOG                 4160   3  (autoclean)
>ipt_state               1056  86  (autoclean)
>iptable_nat            19124   1  (autoclean) [ipt_REDIRECT]
>iptable_filter          2336   1  (autoclean)
>ipt_conntrack           1664   0  (autoclean) (unused)
>ip_tables              13728   9  (autoclean) [ipt_REDIRECT
>ipt_multiport ipt_LOG ipt_state iptable_nat iptable_filter =
ipt_conntrack]
>ip_conntrack           25996   5  (autoclean) [ip_conntrack_pptp
>ip_conntrack_proto_gre ipt_REDIRECT ipt_state iptable_nat =
ipt_conntrack]
>
Hi,

In addition to what Anthony has already said: make sure
ip_nat_proto_gre is also loaded.

Regards,
Filip




=20





------_=_NextPart_001_01C268CF.E981A8A1
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
<TITLE>RE: ip_nat_pptp &amp; ip_conntrack_pptp help appreciated.</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Kjetil Laasby [<A =
HREF=3D"mailto:Kjetil@laasby.com">mailto:Kjetil@laasby.com</A>] =
wrote:<BR>
&gt;<BR>
&gt;Following interessting modules are loaded :<BR>
&gt;------------------------------------------------<BR>
&gt;ip_conntrack_pptp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
3392&nbsp;&nbsp; 0&nbsp; (autoclean)<BR>
&gt;ip_conntrack_proto_gre&nbsp; 3328&nbsp;&nbsp; 0&nbsp; =
[ip_conntrack_pptp]<BR>
&gt;ipt_REDIRECT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 1408&nbsp;&nbsp; 0&nbsp; (autoclean)<BR>
&gt;ppp_mppe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 24736&nbsp;&nbsp; 0&nbsp; (autoclean)<BR>
&gt;ppp_async&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 8096&nbsp;&nbsp; 0&nbsp; (autoclean)<BR>
&gt;ppp_generic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 23692&nbsp;&nbsp; 0&nbsp; (autoclean) [ppp_mppe ppp_async]<BR>
&gt;slhc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6092&nbsp;&nbsp; =
0&nbsp; (autoclean) [ppp_generic]<BR>
&gt;ipt_multiport&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 1216&nbsp;&nbsp; 5&nbsp; (autoclean)<BR>
&gt;ipt_LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4160&nbsp;&nbsp; 3&nbsp; =
(autoclean)<BR>
&gt;ipt_state&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 1056&nbsp; 86&nbsp; (autoclean)<BR>
&gt;iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 19124&nbsp;&nbsp; 1&nbsp; (autoclean) [ipt_REDIRECT]<BR>
&gt;iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2336&nbsp;&nbsp; 1&nbsp; (autoclean)<BR>
&gt;ipt_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 1664&nbsp;&nbsp; 0&nbsp; (autoclean) (unused)<BR>
&gt;ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 13728&nbsp;&nbsp; 9&nbsp; (autoclean) =
[ipt_REDIRECT<BR>
&gt;ipt_multiport ipt_LOG ipt_state iptable_nat iptable_filter =
ipt_conntrack]<BR>
&gt;ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 25996&nbsp;&nbsp; 5&nbsp; (autoclean) [ip_conntrack_pptp<BR>
&gt;ip_conntrack_proto_gre ipt_REDIRECT ipt_state iptable_nat =
ipt_conntrack]<BR>
&gt;<BR>
Hi,<BR>
<BR>
In addition to what Anthony has already said: make sure<BR>
ip_nat_proto_gre is also loaded.<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
<BR>
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
------_=_NextPart_001_01C268CF.E981A8A1--

