From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Mon, 17 Oct 2016 23:07:17 +0200
Message-ID: <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fGQuXPWXDFA82Pvm2LB7nAXwhFxNNMkrj"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161017202712.GA8529@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org, fw@strlen.de

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fGQuXPWXDFA82Pvm2LB7nAXwhFxNNMkrj
Content-Type: multipart/mixed; boundary="9Mls5gan4Do0ksI8aEBhlqOCkxnAxw1eC";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org, fw@strlen.de
Message-ID: <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
In-Reply-To: <20161017202712.GA8529@salvia>

--9Mls5gan4Do0ksI8aEBhlqOCkxnAxw1eC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.10.2016 22:27, Pablo Neira Ayuso wrote:
> On Mon, Oct 17, 2016 at 10:17:28PM +0200, Noel Kuntze wrote:
>> > On 17.10.2016 22:11, Pablo Neira Ayuso wrote:
>>> > > On Mon, Oct 17, 2016 at 09:52:06PM +0200, Noel Kuntze wrote:
>>>>> > >> > On 17.10.2016 21:44, Pablo Neira Ayuso wrote:
>>>>>>> > >>> > > On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach w=
rote:
>>>>>>>>>>> > >>>>> > >> > Hi,
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> > I have two hosts with public ip addresses runn=
ing Ubuntu 16.04 with
>>>>>>>>>>> > >>>>> > >> > Kernel version 4.4.0.
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> > I want to interconnect two containers (systemd=
-nspawn) with veth
>>>>>>>>>>> > >>>>> > >> > interfaces running on these hosts in a server =
client setup.
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> > So on the first host, where the server in the =
container runs I have
>>>>>>>>>>> > >>>>> > >> > the following rules:
>>>>>>>>>>> > >>>>> > >> > # nft list ruleset
>>>>>>>>>>> > >>>>> > >> > table ip nat {
>>>>>>>>>>> > >>>>> > >> >   chain prerouting {
>>>>>>>>>>> > >>>>> > >> >     type nat hook prerouting priority 0; polic=
y accept;
>>>>>>>>>>> > >>>>> > >> >     tcp dport { 4506, 4505} dnat 10.0.0.2=20
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> >   chain output {
>>>>>>>>>>> > >>>>> > >> >     type nat hook output priority 0; policy ac=
cept;
>>>>>>>>>>> > >>>>> > >> >     tcp dport { 4505, 4506} dnat 10.0.0.2
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> >   chain input {
>>>>>>>>>>> > >>>>> > >> >     type nat hook input priority 0; policy acc=
ept;
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> >   chain postrouting {
>>>>>>>>>>> > >>>>> > >> >     type nat hook postrouting priority 0; poli=
cy accept;
>>>>>>>>>>> > >>>>> > >> >     ip saddr 10.0.0.0/8 oif enp4s0 masquerade =

>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> > }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> > On the second host, where the client runs i ha=
ve the following:
>>>>>>>>>>> > >>>>> > >> > # nft list ruleset
>>>>>>>>>>> > >>>>> > >> > table ip nat {
>>>>>>>>>>> > >>>>> > >> >   chain prerouting {
>>>>>>>>>>> > >>>>> > >> >     type nat hook prerouting priority 0; polic=
y accept;
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> >   chain output {
>>>>>>>>>>> > >>>>> > >> >     type nat hook output priority 0; policy ac=
cept;
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> >   chain input {
>>>>>>>>>>> > >>>>> > >> >     type nat hook input priority 0; policy acc=
ept;
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> >   chain postrouting {
>>>>>>>>>>> > >>>>> > >> >     type nat hook postrouting priority 0; poli=
cy accept;
>>>>>>>>>>> > >>>>> > >> >     ip saddr 10.0.0.0/8 oif enp0s31f6 masquera=
de=20
>>>>>>>>>>> > >>>>> > >> >   }
>>>>>>>>>>> > >>>>> > >> > }
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> > This works as expected and without any problem=
s at all. Now IPSec
>>>>>>>>>>> > >>>>> > >> > enters the picture. As soon as I setup a polic=
y to encrypt everyting
>>>>>>>>>>> > >>>>> > >> > between the two hosts the following happens:
>>>>>>>>>>> > >>>>> > >> > + I can still connect from the second host to =
the server in the
>>>>>>>>>>> > >>>>> > >> >   container without problems,
>>>>>>>>>>> > >>>>> > >> > + I can still /connect/ (i.e. establish a conn=
ection) from the
>>>>>>>>>>> > >>>>> > >> >   container on the second host to the server o=
n the first host, but
>>>>>>>>>>> > >>>>> > >> > + in tcpdump listening on the interface of the=
 container (on the
>>>>>>>>>>> > >>>>> > >> >   second host) I see lots of TCP Retransmissio=
ns and the TCP connection
>>>>>>>>>>> > >>>>> > >> >   is effectively broken.
>>>>>>>>>>> > >>>>> > >> >=20
>>>>>>>>>>> > >>>>> > >> > Can someone give me a hint what is going on he=
re?
>>>>>>> > >>> > > Did you find the root cause for this problem?
>>>>>>> > >>> > > --
>>>>>>> > >>> > > To unsubscribe from this list: send the line "unsubscri=
be netfilter" in
>>>>>>> > >>> > > the body of a message to majordomo@vger.kernel.org
>>>>>>> > >>> > > More majordomo info at  http://vger.kernel.org/majordom=
o-info.html
>>>>>>> > >>> > >=20
>>>>> > >> >=20
>>>>> > >> > Probably missing TCP MTU clamping. Normal problem.
>>>>> > >> > Can happen with broken PMTUD.
>>>>> > >> >=20
>>>>> > >> > We also need the policy match module to support ipsec in nft=
ables.
>>>>> > >> > Is that on the TODO list?
>>> > >
>>> > > I know Florian Westphal made a simple extension, he's got a patch=
 in
>>> > > his queue. Trimming off most of it, just leaving this small chunk=
:
>>> > >=20
>>> > > diff --git a/net/netfilter/nft_meta.c b/net/netfilter/nft_meta.c
>>> > > index 6c1e024..76b70e1 100644
>>> > > --- a/net/netfilter/nft_meta.c
>>> > > +++ b/net/netfilter/nft_meta.c
>>> > > @@ -190,6 +190,9 @@ void nft_meta_get_eval(const struct nft_expr
>>> > > *expr,
>>> > >                 *dest =3D prandom_u32_state(state);
>>> > >                 break;
>>> > >         }
>>> > > +       case NFT_META_SECPATH:
>>> > > +               *(__u8 *)dest =3D secpath_exists(skb);
>>> > > +               break;
>>> > >         default:
>>> > >                 WARN_ON(1);
>>> > >                 goto err;
>>> > >=20
>>> > > Would this be enough for your usecase?
>> >=20
>> > No, the problem is that in nftables, we can't tell apart ipsec
>> > protected packets from unprotected ones. But we need that, because
>> > generally, we want to treat them differently.  In iptables we can do=

>> > that with -m policy [additional args], but there's nothing like that=

>> > in nftables.  We need complete support for all the options of the
>> > policy match module in nftables.
> Are you using *all* options there? I'd appreciate if you can develop a
> bit the usecases where you use these different options.
>=20
>> > I don't see what that three line patch actually does. Would you
>> > kindly elaborate?
> Allowing to match if the packet is protected/unprotected in a
> true/false fashion.
>=20
> Thanks.

Well, I am active in the strongSwan community, so I believe I've seen all=
 the
use cases there are and I've seen uses of every option, except "--next" a=
nd "--strict".
But I think there are probably use cases where they are used as well.

--spi, --reqid --tunnel-src, --tunnel-dst, --mode and --proto are used to=
 identify different tunnels,
in e.g. a scenario where an IPsec enabled router is part of an IPsec prot=
ected LAN with host-to-host
transport mode tunnels with ah+esp bundles between the hosts
while providing IPsec VPN access from roadwarrior users using tunnel mode=
 that are marked with a particular, unique mark value, as well as
site-to-site tunnels using tunnel mode. A userspace component is used to =
multiplex broadcast
and multicast packets from the LAN to roadwarriors, as well as between di=
fferent roadwarriors by
listening for those packets and sending them out with the MARK value that=
 was set on the IPsec SPs.

In this scenario --tunnel-src, --tunnel-dst and --mode are used to identi=
fy the host-to-host LAN transport mode tunnels.
--mode tunnel, --spi  and --tunnel-dst and --mode are used to identify th=
e roadwarrior tunnels.
--reqid is used to identify particular tunnels, which are configured with=
 a special reqid by the userspace IKE daemon
to specially handle certain connections in the firewall configuration.

--spi is used to identify several transport mode tunnel endpoints behind =
a NAT device.
The different peers negotiated different SAS and SPs. --spi is used to te=
ll them apart
and mark the connections from those clients with different connmark value=
s, to enable
conntrack to tell them apart, as well as enable an accounting system, as =
well as the firewlal
on the host to differentiate them.

I hope this text was enlightning. :)

--
Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--9Mls5gan4Do0ksI8aEBhlqOCkxnAxw1eC--

--fGQuXPWXDFA82Pvm2LB7nAXwhFxNNMkrj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYBT2FFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYLpQP/AkvRm+1bYJbJ47A4GuBc0L8zUzr8kZvpzohzSupDxuGoSsU1fg+zi8i
uYiAhC8LTDF63LEYfeT6v7VBAVRUahFG4FyKdhGT4WFuiUnIMRTB+RfooFT/UbMi
9nhogBr185VzRkROF6RDeh9sRN1him28U0dpZ6FEjZqM8FZvHRLBcSEYUfq6MEC0
ke20crjIDAsNneO1ZHtm4iKQ2N3RqmPDYky9hConZq9LYVBIEcm5yBqr14wJejN7
j8mOe8m+/XnWcLZSE4iPMBuko9VyyU5fcB9oAyfgfa3Dla/bVIQZ+y353YIjBjDa
1Nk7Vgi2BQ+gEYMaO0dVE4kp/WbEfFq9i5tMYrv6Att3fcuaqr4tuP8aAYa0zMIA
0nit5GCuLF/jZsIVpVbA67X95YDv/Q9Se7/NBdAyvWnu1WqbEXkj1jifo/IJBvGW
oYjuBeiHJzf5/FbS/Kzn1jR9LWCCsu0CA/Z+oLNdDKXXFsUUJNhKrt8lEs1X+by+
bISE+m/MfxWUHi3/ZKYM4Ijps/oAgq1tY1PcFFFTNEqeW6woco4KJB540FhhIWLn
1XWvlLAGovPQmEVuZAY0CE+xQuzFYjT7BbXfpXfH0zqL18Ouvi6c6GWLC4agKnlr
t3dtE7M3a+TTSbMErd23jMK4eB90gnTjykxrgI88fflJPEzvjvg1
=aGc7
-----END PGP SIGNATURE-----

--fGQuXPWXDFA82Pvm2LB7nAXwhFxNNMkrj--
