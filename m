From: Miroslav Rovis <miro.rovis@croatiafidelis.hr>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Fri, 25 Mar 2016 21:37:17 +0100
Message-ID: <20160325203717.GA12609@g0n>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org
Cc: Johannes Ernst <johannes.ernst@gmail.com>


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I thought I'd help point to a typo in the Nftables Archlinux Wiki
related to this trailblazer ;-) thread.

If I understand correctly, Johannes Ernst is the main contributor of
that wiki. BTW, a superb tutorial!

In short:

file:///Cmn/dLo/Nft/nftables-ArchWiki.htm#Practical_examples

Different rules for different interfaces

is:

    tcp port http accept
    tcp port https accept

but there ought to be:

    tcp port http accept
    tcp port https accept

And then only the example works, as I showed in my Gentoo Forums topic:

A Firewalled Internet Access to Internal Subnet
https://forums.gentoo.org/viewtopic-t-1041028.html#7897320

On 151028-10:14-0700, Johannes Ernst wrote:
> My box has two interfaces (enp2s0, upstream to ISP with DHCP) and (enp3s0=
, LAN, static IP assignment). Using nftables, I'm attempting to set it up a=
s a router with NAT, and selective port openings: enp2s0 is supposed to hav=
e the ssh port open, while enp3s0 also gets to have http, https, dhcp and d=
ns open so I can run Apache and dnsmasq on it for users on the LAN.
>=20
> Ideally I'm looking for a full example that will work if I execute 'nft -=
f' with it. (Pretty much all related nftables examples I find seem to leave=
 out crucial bits.)
>=20
> Here is what I have so far:
>=20
> table inet filter {
>   chain input { # this chain serves as a dispatcher
>     type filter hook input priority 0;
>=20
>     iifname lo accept # always accept loopback
>     iifname enp2s0 jump input_enp2s0
>     iifname enp3s0 jump input_enp3s0
>=20
>     reject with icmp type port-unreachable # refuse traffic from all othe=
r interfaces
>    }
>   chain input_enp2s0 {
>     ct state {established,related} accept
>     ct state invalid drop
>     udp dport bootpc accept
>     tcp dport bootpc accept
>     reject with icmp type port-unreachable # all other traffic
>   }
>=20
>   chain input_enp3s0 {
>     ct state {established,related} accept
>     ct state invalid drop
>     udp dport bootpc accept
>     tcp dport bootpc accept
>     tcp port http accept
>     tcp port https accept
>     # and a few others
>     reject with icmp type port-unreachable # all other traffic
>   }
>=20
>   chain ouput { # for now, we let everything out
>     type filter hook output priority 0;
>     accept
>   }
> }
>=20
> Now I=E2=80=99m attempting to add masquerading, and I=E2=80=99m failing:
> > nft add table nat
> > nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
> > nft add chain nat postrouting { type nat hook postrouting priority 0 \;=
 }
> > nft add rule nat postrouting masquerade
> <cmdline>:1:1-35: Error: Could not process rule: No such file or directory
> add rule nat postrouting masquerade
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> 1. This is copied straight from the wiki [1]. What am I doing wrong?
>=20
> 2. Even if this command worked, how do I properly integrate it into the r=
est of my tables/rules?
>=20
> I=E2=80=99m on Arch x86_64, nftables 0.5.
>=20
> Thanks,
>=20
>=20
>=20
> Johannes.
>=20
>=20
> [1] http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_A=
ddress_Translation_%28NAT%29
>=20
>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Happy upcoming Easter to all!
--=20
Miroslav Rovis
Zagreb, Croatia
http://www.CroatiaFidelis.hr

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW9aF9AAoJEOqYhIhPuvCu14cP/2ss7Qu9gvJxsEpKXCHMTMmL
75nQ2SQqB6lCvVXBeW92xPMFD4ISTlm6eTQ/bES/+IGMMXed6HBAL9mOkfRnnEp1
PQPPQ+UM1gJKMZAUsl5460tTR8LgnmcAAY6P2Dww/shtoCFpztZUpieBNXVTl1yX
/GebAJlQD99/Dfs+JDwnUr/LPaTZ78SoiXi9r2sGXePcgXMNXw/7cxgaHqoODig9
N2nYM75VcRHdeOYlEOowGVi57fa7R1WI5fdqkyPyqQLDMhwa0ejW5FP/Yuq4k9iD
CL88Cb05uklTU+reUOMjs5PlMDPE79Zag47yv7sBxJp97c6XqAa7jgHV+FWI0m3g
sPRTKiI0Hc34Ih+P/GvvgMBtxkAaq++7U8dW684q3ScRYlV0La6QAqoG1v/L7AqL
RJm16nVBwu0u2dq6NJi3+MciBXdN4TL+9Wzm/d19I4VseLkOtAKkCAtsKllThQ8f
Ev2sOyyhWjogKyZoO2HrqSH3o1rnlK5UpVWwt8iQXPAhxMtHIDeV0aaBgqc4rIgd
tIzMyAr4h2KjGNsqcnjSUHJL1tb2nuikBAvd36hM8YzrYH5xipNmU3PiL3fv0HlX
Vt/5OthqUjC5E/jBY+iHME1nsaUYeNKFyVI00EARRjPxg3MKnXQNkvABs0HqIIbv
bVP6l5kbbAdNp00p5n4o
=+YD1
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
