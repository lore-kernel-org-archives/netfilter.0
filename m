From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Mon, 17 Oct 2016 22:17:28 +0200
Message-ID: <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nPpL7MCjB6Sjm1Hj3tsjqht1BFRdmQtjx"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161017201149.GB7690@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org, fw@strlen.de

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nPpL7MCjB6Sjm1Hj3tsjqht1BFRdmQtjx
Content-Type: multipart/mixed; boundary="jtbpMuhCLiIIR9HAwb21hKx8nonj2rEfJ";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org, fw@strlen.de
Message-ID: <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
In-Reply-To: <20161017201149.GB7690@salvia>

--jtbpMuhCLiIIR9HAwb21hKx8nonj2rEfJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.10.2016 22:11, Pablo Neira Ayuso wrote:
> On Mon, Oct 17, 2016 at 09:52:06PM +0200, Noel Kuntze wrote:
>> > On 17.10.2016 21:44, Pablo Neira Ayuso wrote:
>>> > > On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach wrote:
>>>>> > >> > Hi,
>>>>> > >> >=20
>>>>> > >> > I have two hosts with public ip addresses running Ubuntu 16.=
04 with
>>>>> > >> > Kernel version 4.4.0.
>>>>> > >> >=20
>>>>> > >> > I want to interconnect two containers (systemd-nspawn) with =
veth
>>>>> > >> > interfaces running on these hosts in a server client setup.
>>>>> > >> >=20
>>>>> > >> > So on the first host, where the server in the container runs=
 I have
>>>>> > >> > the following rules:
>>>>> > >> > # nft list ruleset
>>>>> > >> > table ip nat {
>>>>> > >> >   chain prerouting {
>>>>> > >> >     type nat hook prerouting priority 0; policy accept;
>>>>> > >> >     tcp dport { 4506, 4505} dnat 10.0.0.2=20
>>>>> > >> >   }
>>>>> > >> >=20
>>>>> > >> >   chain output {
>>>>> > >> >     type nat hook output priority 0; policy accept;
>>>>> > >> >     tcp dport { 4505, 4506} dnat 10.0.0.2
>>>>> > >> >   }
>>>>> > >> >=20
>>>>> > >> >   chain input {
>>>>> > >> >     type nat hook input priority 0; policy accept;
>>>>> > >> >   }
>>>>> > >> >=20
>>>>> > >> >   chain postrouting {
>>>>> > >> >     type nat hook postrouting priority 0; policy accept;
>>>>> > >> >     ip saddr 10.0.0.0/8 oif enp4s0 masquerade=20
>>>>> > >> >   }
>>>>> > >> > }
>>>>> > >> >=20
>>>>> > >> > On the second host, where the client runs i have the followi=
ng:
>>>>> > >> > # nft list ruleset
>>>>> > >> > table ip nat {
>>>>> > >> >   chain prerouting {
>>>>> > >> >     type nat hook prerouting priority 0; policy accept;
>>>>> > >> >   }
>>>>> > >> >=20
>>>>> > >> >   chain output {
>>>>> > >> >     type nat hook output priority 0; policy accept;
>>>>> > >> >   }
>>>>> > >> >=20
>>>>> > >> >   chain input {
>>>>> > >> >     type nat hook input priority 0; policy accept;
>>>>> > >> >   }
>>>>> > >> >=20
>>>>> > >> >   chain postrouting {
>>>>> > >> >     type nat hook postrouting priority 0; policy accept;
>>>>> > >> >     ip saddr 10.0.0.0/8 oif enp0s31f6 masquerade=20
>>>>> > >> >   }
>>>>> > >> > }
>>>>> > >> >=20
>>>>> > >> > This works as expected and without any problems at all. Now =
IPSec
>>>>> > >> > enters the picture. As soon as I setup a policy to encrypt e=
veryting
>>>>> > >> > between the two hosts the following happens:
>>>>> > >> > + I can still connect from the second host to the server in =
the
>>>>> > >> >   container without problems,
>>>>> > >> > + I can still /connect/ (i.e. establish a connection) from t=
he
>>>>> > >> >   container on the second host to the server on the first ho=
st, but
>>>>> > >> > + in tcpdump listening on the interface of the container (on=
 the
>>>>> > >> >   second host) I see lots of TCP Retransmissions and the TCP=
 connection
>>>>> > >> >   is effectively broken.
>>>>> > >> >=20
>>>>> > >> > Can someone give me a hint what is going on here?
>>> > > Did you find the root cause for this problem?
>>> > > --
>>> > > To unsubscribe from this list: send the line "unsubscribe netfilt=
er" in
>>> > > the body of a message to majordomo@vger.kernel.org
>>> > > More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
>>> > >=20
>> >=20
>> > Probably missing TCP MTU clamping. Normal problem.
>> > Can happen with broken PMTUD.
>> >=20
>> > We also need the policy match module to support ipsec in nftables.
>> > Is that on the TODO list?
> I know Florian Westphal made a simple extension, he's got a patch in
> his queue. Trimming off most of it, just leaving this small chunk:
>=20
> diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
> index 6c1e024..76b70e1 100644
> --- a/net/netfilter/nft_meta.c
> +++ b/net/netfilter/nft_meta.c
> @@ -190,6 +190,9 @@ void nft_meta_get_eval(const struct nft_expr
> *expr,
>                 *dest =3D prandom_u32_state(state);
>                 break;
>         }
> +       case NFT_META_SECPATH:
> +               *(__u8 *)dest =3D secpath_exists(skb);
> +               break;
>         default:
>                 WARN_ON(1);
>                 goto err;
>=20
> Would this be enough for your usecase?

No, the problem is that in nftables, we can't tell apart ipsec protected =
packets
from unprotected ones. But we need that, because generally, we want to tr=
eat them differently.
In iptables we can do that with -m policy [additional args], but there's =
nothing like that in nftables.
We need complete support for all the options of the policy match module i=
n nftables.

I don't see what that three line patch actually does. Would you kindly el=
aborate?

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--jtbpMuhCLiIIR9HAwb21hKx8nonj2rEfJ--

--nPpL7MCjB6Sjm1Hj3tsjqht1BFRdmQtjx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYBTHYFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYI2oQAJ76RnKQXEFsA4koz5q1uVkCOkiK8x55oTqFliHkVhkZB9cuMhF+Ufrt
baAIb0tGsIPtghFFVYiM82EjY11/7I3J4iXWqzkBVdni3Le7z5nDj+bXbcrbsqim
6LXwTSiFoagdVSgUHCaxIUQ6jMY0My06FrmBOo3s43N4L64PzrIl5dFgpAit78o7
tIibPM7GzWRNUwZwCWhBkv3wEhokQmd+ibp8qT/RIXR9G9qKlYHsLbvdY0uiKdSU
8MeLJbQ+7ZqkHGcbLDNRfHlhB0/oI/URjbyfEvCPolWcJjzMM4upIcJmrr2uUa8h
qI82ivTMyJue8V5ojkpidNa2dNrUTEOlP6i7iCtRXpArxsdUQ0Y08SB6Ic8vOFvh
drbj0B+SPVLjuheHGeL5XFnv0OG1VNXkSLjfNPtJqqD3zd1+/69VMFn404wTaEA6
/vfsefHfajOPSkgrTBwQc2AdeaSmcbUf8VGowqA4Qq9WQuEgDoj7JBQwMRnK3gJ6
iY4tUN+meNR9HesXMexXas/HwXeKyQzAv5pdPkayeaWuolktt51tPFqutx2qN8Tm
L50m4pVD2b+TAIF1meEqWjj5IiUpa0vKgRERBBCtAUy2ssT98DRb0g/N/ae2HyAz
BoJrhZPHdFTIACCIq8DVbzM2Z8jLnSsUl/fGWRD4Tk2tEL2t9/NQ
=z1CJ
-----END PGP SIGNATURE-----

--nPpL7MCjB6Sjm1Hj3tsjqht1BFRdmQtjx--
