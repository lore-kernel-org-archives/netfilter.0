From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: PPTP/GRE + Newnat Issues
Date: Thu, 13 Jun 2002 20:11:24 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615DB2@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C21305.BAC585C0"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: SoulBlazer <soul@lamp-post.net>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C21305.BAC585C0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

What happens if you explicitly allow the GRE protocol ?

iptables -A FORWARD -p 47 -j ACCEPT

It shouldn't be needed if you let through RELATED connections though...

Regards,
Filip

-----Original Message-----
From:	SoulBlazer [mailto:soul@lamp-post.net]
Sent:	Thu 13/06/2002 18:26
To:	netfilter@lists.samba.org
Cc:=09
Subject:	Re: PPTP/GRE + Newnat Issues
I have received private email's regarding similar occurrences.  Perhaps =
there=20
is some weirdness about since I am not alone on this?

Additionally if this is a problem with the module should I move this=20
conversation to the netfilter-devel list ? opinions ?
--
Re: PPTP/GRE + Newnat Issues
Date: Thu, 13 Jun 2002 15:47:00 +0200
From: <robert@xxxx.nospam.xxx>
To: "SoulBlazer" <soul@lamp-post.net>

same promblems at me,
no solution known
greets

On June 12, 2002 07:53 pm, SoulBlazer wrote:
> Hey List,
>
> I've been having a problem getting PPTP/GRE (ms-vpn) sessions to work
> properly using netfilter cvs (06/12/2002) and a 2.4.19-pre10 kernel =
(please
> note I have tried the following with a vanilla 2.4.18 kernel as well =
to
> which the same results have occurred).
>
> After applying the newnat and pptp patches to my kernel I compile with =
the
> following :
>
> CONFIG_IP_NF_CT_PROTO_GRE=3Dy
> CONFIG_IP_NF_PPTP=3Dy
>
> (I also have standard iptables options allowing for nat enabled)
>
> After a recompile and reboot, I create the following rule for a winXP
> workstation on my LAN:
>
> iptables -t nat -A POSTROUTING -s 192.168.12.19 -j SNAT --to =
64.119.104.135
>
> I then verify connectivity on the winXP box via the ping command and
> subsequent web browsing; all which yield success.
>
> I then attempt to use the VPN adapter in Network places and it appears =
to
> work however gets stuck at the 'Verifying username/password' (the l/p =
is
> correct btw).  I go on the linux firewall and open up tcpdump to which =
I am
> getting the following:
>
> my.ext.addr.1081 > remote.vpn.server.1723: tcp 0 (DF)
> remote.vpn.server.1723 > my.ext.addr.1081: tcp 0
> my.ext.addr.1081 > remote.vpn.server.1723: tcp 156 (DF)
> remote.vpn.server.1723 > my.ext.addr.1081: tcp 156
> my.ext.addr.1081 > remote.vpn.server.1723: tcp 168 (DF)
> remote.vpn.server.1723 > my.ext.addr.1081: tcp 32
> remote.vpn.server > my.ext.addr: gre-proto-0x880B (gre encap)
> my.ext.addr > remote.vpn.server: icmp: my.ext.addr protocol 47 =
unreachable
>
> I have a feeling the pptp/gre support does not like being built =
internally
> opposed to modularly, so I recompile them as modules and attempt =
again.
>
> With the same rules and the following loaded as modules :
>
> Module                  Size  Used by
> ip_nat_proto_gre        1248   0  (unused)
> ip_conntrack_pptp       2352   1  (autoclean)
> ip_nat_pptp             1712   0  (unused)
> ip_conntrack_proto_gre    1952   0  [ip_conntrack_pptp ip_nat_pptp]
>
>
> I again try to establish a vpn connection .. and again I get the same
> protocol 47 unreachable messages.
>
> Any ideas ?





------_=_NextPart_001_01C21305.BAC585C0
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5762.3">
<TITLE>RE: PPTP/GRE + Newnat Issues</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
What happens if you explicitly allow the GRE protocol ?<BR>
<BR>
iptables -A FORWARD -p 47 -j ACCEPT<BR>
<BR>
It shouldn't be needed if you let through RELATED connections =
though...<BR>
<BR>
Regards,<BR>
Filip<BR>
<BR>
-----Original Message-----<BR>
From:&nbsp;&nbsp; SoulBlazer [<A =
HREF=3D"mailto:soul@lamp-post.net">mailto:soul@lamp-post.net</A>]<BR>
Sent:&nbsp;&nbsp; Thu 13/06/2002 18:26<BR>
To:&nbsp;&nbsp;&nbsp;&nbsp; netfilter@lists.samba.org<BR>
Cc:&nbsp;&nbsp;&nbsp;&nbsp;<BR>
Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Re: PPTP/GRE + Newnat =
Issues<BR>
I have received private email's regarding similar occurrences.&nbsp; =
Perhaps there<BR>
is some weirdness about since I am not alone on this?<BR>
<BR>
Additionally if this is a problem with the module should I move this<BR>
conversation to the netfilter-devel list ? opinions ?<BR>
--<BR>
Re: PPTP/GRE + Newnat Issues<BR>
Date: Thu, 13 Jun 2002 15:47:00 +0200<BR>
From: &lt;robert@xxxx.nospam.xxx&gt;<BR>
To: &quot;SoulBlazer&quot; &lt;soul@lamp-post.net&gt;<BR>
<BR>
same promblems at me,<BR>
no solution known<BR>
greets<BR>
<BR>
On June 12, 2002 07:53 pm, SoulBlazer wrote:<BR>
&gt; Hey List,<BR>
&gt;<BR>
&gt; I've been having a problem getting PPTP/GRE (ms-vpn) sessions to =
work<BR>
&gt; properly using netfilter cvs (06/12/2002) and a 2.4.19-pre10 kernel =
(please<BR>
&gt; note I have tried the following with a vanilla 2.4.18 kernel as =
well to<BR>
&gt; which the same results have occurred).<BR>
&gt;<BR>
&gt; After applying the newnat and pptp patches to my kernel I compile =
with the<BR>
&gt; following :<BR>
&gt;<BR>
&gt; CONFIG_IP_NF_CT_PROTO_GRE=3Dy<BR>
&gt; CONFIG_IP_NF_PPTP=3Dy<BR>
&gt;<BR>
&gt; (I also have standard iptables options allowing for nat =
enabled)<BR>
&gt;<BR>
&gt; After a recompile and reboot, I create the following rule for a =
winXP<BR>
&gt; workstation on my LAN:<BR>
&gt;<BR>
&gt; iptables -t nat -A POSTROUTING -s 192.168.12.19 -j SNAT --to =
64.119.104.135<BR>
&gt;<BR>
&gt; I then verify connectivity on the winXP box via the ping command =
and<BR>
&gt; subsequent web browsing; all which yield success.<BR>
&gt;<BR>
&gt; I then attempt to use the VPN adapter in Network places and it =
appears to<BR>
&gt; work however gets stuck at the 'Verifying username/password' (the =
l/p is<BR>
&gt; correct btw).&nbsp; I go on the linux firewall and open up tcpdump =
to which I am<BR>
&gt; getting the following:<BR>
&gt;<BR>
&gt; my.ext.addr.1081 &gt; remote.vpn.server.1723: tcp 0 (DF)<BR>
&gt; remote.vpn.server.1723 &gt; my.ext.addr.1081: tcp 0<BR>
&gt; my.ext.addr.1081 &gt; remote.vpn.server.1723: tcp 156 (DF)<BR>
&gt; remote.vpn.server.1723 &gt; my.ext.addr.1081: tcp 156<BR>
&gt; my.ext.addr.1081 &gt; remote.vpn.server.1723: tcp 168 (DF)<BR>
&gt; remote.vpn.server.1723 &gt; my.ext.addr.1081: tcp 32<BR>
&gt; remote.vpn.server &gt; my.ext.addr: gre-proto-0x880B (gre =
encap)<BR>
&gt; my.ext.addr &gt; remote.vpn.server: icmp: my.ext.addr protocol 47 =
unreachable<BR>
&gt;<BR>
&gt; I have a feeling the pptp/gre support does not like being built =
internally<BR>
&gt; opposed to modularly, so I recompile them as modules and attempt =
again.<BR>
&gt;<BR>
&gt; With the same rules and the following loaded as modules :<BR>
&gt;<BR>
&gt; =
Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used by<BR>
&gt; ip_nat_proto_gre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1248&nbsp;&nbsp; 0&nbsp; (unused)<BR>
&gt; ip_conntrack_pptp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2352&nbsp;&nbsp; 1&nbsp; (autoclean)<BR>
&gt; =
ip_nat_pptp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 1712&nbsp;&nbsp; 0&nbsp; (unused)<BR>
&gt; ip_conntrack_proto_gre&nbsp;&nbsp;&nbsp; 1952&nbsp;&nbsp; 0&nbsp; =
[ip_conntrack_pptp ip_nat_pptp]<BR>
&gt;<BR>
&gt;<BR>
&gt; I again try to establish a vpn connection .. and again I get the =
same<BR>
&gt; protocol 47 unreachable messages.<BR>
&gt;<BR>
&gt; Any ideas ?<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C21305.BAC585C0--

