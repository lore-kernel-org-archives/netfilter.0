From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: Microsoft VPN and iptables
Date: Sat, 9 Nov 2002 14:47:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E131E9F1848D0148813EAF06A846608FD776F1@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C287F6.81C3EEA2"
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C287F6.81C3EEA2
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Antony Stone [mailto:Antony@Soft-Solutions.co.uk] wrote:
>
>Are you using NAT, and is the VPN system using PPTP (I think this is =
common=20
>with M$ things...) ?
>
>If the answer to both of these is yes, then I think you need to =
investigate=20
>the PPTP connection tracking module patch for netfilter, because =
otherwise=20
>this protocol gets upset by the address translation.
>
>Sorry to be a bit vague about this, but I don't use PPTP or M$ VPNs - I =
am=20
>simply reporting on stuff I have seen on this mailing list in the past =
from=20
>other people apparently trying to do the same thing.
>
>If anyone knows that M$ VPNs can be made to work without doing this, =
please=20
>jump in and help...
>

This is correct. The PPP protocol that's encapsulated inside the GRE
tunnel (protocol 47) uses a "caller ID" and "callee ID" to distinguish
calls/session. It's not strictly the same as a tcp or udp port, but it=20
basically serves more or less the same purpose, and poses problems with =
NAT.

Note that you shouldn't run into problems with NAT if you are DNAT'ing
traffic to the pptp server. However, as soon as you do any type of SNAT,
two ppp calls may get hidden behind the same IP. Even then, it doesn't=20
mean immediate breakage: if you are fortionate enough that those clients
are using different caller IDs, things will still work. As soon as two
of them use the same caller ID, you're in trouble.

All this isn't helped by the fact that the MS PPTP client implementation
isn't terrible good at picking random ID's, hence when you are doing
SNAT on Windows PPTP VPNs, you're bound to get in trouble without the
pptp conntrack/nat helper.

That's what I understood from it when I tested the pptp helper and read
some documentation...

Regards,
Filip

------_=_NextPart_001_01C287F6.81C3EEA2
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
<TITLE>RE: Microsoft VPN and iptables</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Antony Stone [<A =
HREF=3D"mailto:Antony@Soft-Solutions.co.uk">mailto:Antony@Soft-Solutions.=
co.uk</A>] wrote:<BR>
&gt;<BR>
&gt;Are you using NAT, and is the VPN system using PPTP (I think this is =
common<BR>
&gt;with M$ things...) ?<BR>
&gt;<BR>
&gt;If the answer to both of these is yes, then I think you need to =
investigate<BR>
&gt;the PPTP connection tracking module patch for netfilter, because =
otherwise<BR>
&gt;this protocol gets upset by the address translation.<BR>
&gt;<BR>
&gt;Sorry to be a bit vague about this, but I don't use PPTP or M$ VPNs =
- I am<BR>
&gt;simply reporting on stuff I have seen on this mailing list in the =
past from<BR>
&gt;other people apparently trying to do the same thing.<BR>
&gt;<BR>
&gt;If anyone knows that M$ VPNs can be made to work without doing this, =
please<BR>
&gt;jump in and help...<BR>
&gt;<BR>
<BR>
This is correct. The PPP protocol that's encapsulated inside the GRE<BR>
tunnel (protocol 47) uses a &quot;caller ID&quot; and &quot;callee =
ID&quot; to distinguish<BR>
calls/session. It's not strictly the same as a tcp or udp port, but =
it<BR>
basically serves more or less the same purpose, and poses problems with =
NAT.<BR>
<BR>
Note that you shouldn't run into problems with NAT if you are =
DNAT'ing<BR>
traffic to the pptp server. However, as soon as you do any type of =
SNAT,<BR>
two ppp calls may get hidden behind the same IP. Even then, it =
doesn't<BR>
mean immediate breakage: if you are fortionate enough that those =
clients<BR>
are using different caller IDs, things will still work. As soon as =
two<BR>
of them use the same caller ID, you're in trouble.<BR>
<BR>
All this isn't helped by the fact that the MS PPTP client =
implementation<BR>
isn't terrible good at picking random ID's, hence when you are doing<BR>
SNAT on Windows PPTP VPNs, you're bound to get in trouble without =
the<BR>
pptp conntrack/nat helper.<BR>
<BR>
That's what I understood from it when I tested the pptp helper and =
read<BR>
some documentation...<BR>
<BR>
Regards,<BR>
Filip</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C287F6.81C3EEA2--

