From: Mike Kazantsev <mk.fraggod@gmail.com>
Subject: Re: IPv6 forwarding to TAP-interface fails
Date: Mon, 21 Dec 2009 11:46:48 +0500
Message-ID: <20091221114648.08eede72@malediction>
References: <20091219162047.04be7ac3@coercion>
	<4B2CDE84.3060703@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/sF8qKesO5Jcf+=rhF_RmEe="; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:in-reply-to:references:x-mailer:mime-version
         :content-type;
        bh=qzWlYhEVp5L+VmU3TR+yEHDRSW5aiNige//w+Ezsvp0=;
        b=bzi64xoLypw0V46L4CYJwIHvtWWaI1Mb5ssG+zA4ghvNuKg9V5BpX/8LzcNlACnJHy
         j0SorlcZKGNzEwtUKemDTKtlp8kRGVFXjJhE5SBCdA3dfoFu59beRNdFbzLXVoVs2st4
         YRsvlTwp3gw0nynRvA/9Ob0qOp2M7ZbAs/orE=
In-Reply-To: <4B2CDE84.3060703@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

--Sig_/sF8qKesO5Jcf+=rhF_RmEe=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 19 Dec 2009 15:09:08 +0100
Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:

> > So, I assume the packet is lost somewhere in netfilter, but I've no
> > idea how to tell why it's getting discarded like that.
>=20
> Have you tried to track the packet in the mangle/POSTROUTING chain
> too, either with the LOG target in that chain or with the TRACE
> target in the raw/PREROUTING chain ?

Didn't know about it, very handy way to check what's happening.
Thanks. Pity I've missed it before.

As for the results - it seems that everything is passing through
netfilter just fine, more about it below.


> > Strangely enough (for me), when I type "ping6
> > 2001:0470:1f0b:11de::21" on router machine it gives "Destination
> > unreachable: Address unreachable"
>=20
> This indicates that the neighbour discovery for that address failed,
> either because the ICMPv6 neighbour solicitation request could not be
> sent or the ICMPv6 neighbour advertisement reply was not received. If
> neighbour discovery fails, packets cannot be sent or forwarded to that
> destination.

Yes, that seem to be the cause of a problem, but then I don't seem to
understand why router doesn't send these requests.


I've set TRACE to packets with 2001:470:1f0b:11de::22 as a destination
in raw.PREROUTING and -j LOG to INPUT and OUTPUT chains of filter table.

On VM start tcpdump (with "ip6" filter) shows these:
  IP6 :: > ff02::16: HBH ICMP6, multicast listener report v2, 1 group recor=
d(s), length 28
  IP6 :: > ff02::1:ff00:22: ICMP6, neighbor solicitation, who has 2001:470:=
1f0b:11de::22, length 24
  IP6 :: > ff02::16: HBH ICMP6, multicast listener report v2, 1 group recor=
d(s), length 28

Then I start the simple ping6 from lan network to vde (VM):
  IP6 2001:470:1f0b:11de::13 > 2001:470:1f0b:11de::22: ICMP6, echo request,=
 seq 1, length 64
 =20
  TRACE: raw:PREROUTING:policy:2 IN=3Dlan OUT=3D MAC=3D00:22:15:3a:ef:7d:00=
:17:c4:10:7f:4f:86:dd
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
   DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   LEN=3D104 TC=3D0 HOPLIMIT=3D64 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 COD=
E=3D0 ID=3D29452 SEQ=3D1
  TRACE: mangle:PREROUTING:policy:1 IN=3Dlan OUT=3D MAC=3D00:22:15:3a:ef:7d=
:00:17:c4:10:7f:4f:86:dd
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
   DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   LEN=3D104 TC=3D0 HOPLIMIT=3D64 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 COD=
E=3D0 ID=3D29452 SEQ=3D1
  TRACE: mangle:FORWARD:policy:1 IN=3Dlan OUT=3Dvde
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
   DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   LEN=3D104 TC=3D0 HOPLIMIT=3D63 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 COD=
E=3D0 ID=3D29452 SEQ=3D1
  TRACE: filter:FORWARD:policy:1 IN=3Dlan OUT=3Dvde
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
   DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   LEN=3D104 TC=3D0 HOPLIMIT=3D63 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 COD=
E=3D0 ID=3D29452 SEQ=3D1
  TRACE: mangle:POSTROUTING:policy:1 IN=3D OUT=3Dvde
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0013
   DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   LEN=3D104 TC=3D0 HOPLIMIT=3D63 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D128 COD=
E=3D0 ID=3D29452 SEQ=3D1

  IP6 2001:470:1f0b:11de::22 > ff02::1:ff00:21: ICMP6, neighbor solicitatio=
n, who has 2001:470:1f0b:11de::21, length 32
 =20
  IN=3Dvde OUT=3D MAC=3D33:33:ff:00:00:21:00:16:3e:16:38:41:86:dd
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   DST=3Dff02:0000:0000:0000:0000:0001:ff00:0021
   LEN=3D72 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D135 COD=
E=3D0
 =20
  IP6 2001:470:1f0b:11de::21 > 2001:470:1f0b:11de::22: ICMP6, neighbor adve=
rtisement, tgt is 2001:470:1f0b:11de::21, length 32
 =20
  IN=3D OUT=3Dvde
   SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0021
   DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
   LEN=3D72 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D136 COD=
E=3D0
 =20
 =20
  IP6 2001:470:1f0b:11de::22 > 2001:470:1f0b:11de::13: ICMP6, echo reply, s=
eq 1, length 64

...and so on until tcpdump just stops, while traces show the same thing.


On lan interface, unlike vde, neighbor requests seem to be passed quite
frequently:

  ...
  IP6 2001:470:1f0b:11de::13 > 2001:470:1f0b:11de::22: ICMP6, echo request,=
 seq 5, length 64
  IP6 2001:470:1f0b:11de::22 > 2001:470:1f0b:11de::13: ICMP6, echo reply, s=
eq 5, length 64
  IP6 fe80::222:15ff:fe3a:ef7d > 2001:470:1f0b:11de::13: ICMP6, neighbor so=
licitation, who has 2001:470:1f0b:11de::13, length 32
  IP6 2001:470:1f0b:11de::13 > fe80::222:15ff:fe3a:ef7d: ICMP6, neighbor ad=
vertisement, tgt is 2001:470:1f0b:11de::13, length 24
  IP6 2001:470:1f0b:11de::13 > 2001:470:1f0b:11de::22: ICMP6, echo request,=
 seq 6, length 64
  IP6 2001:470:1f0b:11de::22 > 2001:470:1f0b:11de::13: ICMP6, echo reply, s=
eq 6, length 64
  ...


And when I type "ping6 2001:470:1f0b:11de::22" on router itself I can
see neighbor solicitation in tcpdump and pings from lan start working
again, although not for long (if I ping on router):

  [complete silence]
  IP6 2001:470:1f0b:11de::21 > ff02::1:ff00:22: ICMP6, neighbor solicitatio=
n, who has 2001:470:1f0b:11de::22, length 32
  IP6 2001:470:1f0b:11de::22 > 2001:470:1f0b:11de::21: ICMP6, neighbor adve=
rtisement, tgt is 2001:470:1f0b:11de::22, length 32
  IP6 2001:470:1f0b:11de::13 > 2001:470:1f0b:11de::22: ICMP6, echo request,=
 seq 135, length 64
  IP6 2001:470:1f0b:11de::22 > 2001:470:1f0b:11de::13: ICMP6, echo reply, s=
eq 135, length 64
  ...


So I guess that pinpoints the problem as "router doesn't send neighbor
solicitation requests along with forwarded packets", thanks to your
suggestion.

I have to admit that "neighbor solicitation", although basic IPv6
mechanism, is a obscure to me, since I haven't done necessary research
on the topic before setting the network up, and that's quite a stupid
mistake I'm going to fix right now ;)

Guess that gives me something to search for and debug further, so I'll
probably be able to either fix it or come up with another, more
specific, question.
Thanks for your help.


> Regardless of your problem, 2001:470:1f0b:11de::10 and
> 2001:470:1f0b:11de::20 are the prefix addresses of
> 2001:470:1f0b:11de::10/25 and 2001:470:1f0b:11de::20/25 and have a
> special status : they are anycast addresses meaning "any router
> connected to that prefix". So I guess that they should not be assigned
> to an interface.

While that worked before, I agree that it's a bad practice, and I've
fixed it now, although it doesn't seem to affect this particular
problem indeed.

For the above tests I've changed ...::10 to 11, ...::20 to 21
and ...::21 to 22.


> ICMPv6 packets involved in neighbour discovery go through the INPUT
> and OUTPUT chains. What do these chains contain ? Connection tracking
> of these ICMPv6 types changed in kernel 2.6.29.

These (as well as the rest of ICMPv6) were unrestricted in all chains,
but for the sake of this test (dumps/traces posted above) I've set
everything to ACCEPT explicitly.


> You wrote in the subject "with ip6tables". Do you mean that it works
> without ip6tables, without ip6_tables loaded or without
> ip6table_filter loaded, or with all chains empty and with ACCEPT
> default policy ?

My mistake, sorry, ip6tables tool probably have nothing to do with it,
it's just that the whole forwarding concept is closely associated with
iptables in my mind ;)

ACCEPT everywhere doesn't affect the test, and above results acquired
with just that setup.


--=20
Mike Kazantsev // fraggod.net

--Sig_/sF8qKesO5Jcf+=rhF_RmEe=
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.13 (GNU/Linux)

iEYEARECAAYFAksvGd8ACgkQASbOZpzyXnFakgCbB42g0apzgyb23mcKbq7VijT4
RGkAn19dPTZm1cdzgS7zRYcQoF5senat
=LDQ2
-----END PGP SIGNATURE-----

--Sig_/sF8qKesO5Jcf+=rhF_RmEe=--
