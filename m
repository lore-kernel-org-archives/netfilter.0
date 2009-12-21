From: Mike Kazantsev <mk.fraggod@gmail.com>
Subject: [SOLVED] Re: IPv6 forwarding to TAP-interface fails
Date: Mon, 21 Dec 2009 14:09:52 +0500
Message-ID: <20091221140952.63c607f5@malediction>
References: <20091219162047.04be7ac3@coercion>
	<4B2CDE84.3060703@plouf.fr.eu.org>
	<20091221114648.08eede72@malediction>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/h1G70NmK=uNtPI0q0.xxl_y"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:in-reply-to:references:x-mailer:mime-version
         :content-type;
        bh=boJy3aO0HzuYXIhGHmgYl0iZY3Nl2p5wSMbtmzaSJo4=;
        b=aYVZCoKWDVNPuAzyYKhtxxXH3+JY+hYsJ0GXC5W0rF1pLpjoXmg4M8rcL/Ls9WdIRu
         KKQT4z0Z1xqhna32rsAAoaDHzeg7VcK02t98QCJj8S1SPvz3v4cpBKVHBxJ8IPT5AGM0
         0xxoHPWqhbHlIs+BQXgBYxoggIe23YK5db8YE=
In-Reply-To: <20091221114648.08eede72@malediction>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--Sig_/h1G70NmK=uNtPI0q0.xxl_y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 21 Dec 2009 11:46:48 +0500
Mike Kazantsev <mk.fraggod@gmail.com> wrote:

> Then I start the simple ping6 from lan network to vde (VM):
...
>=20
>   IP6 2001:470:1f0b:11de::22 > ff02::1:ff00:21: ICMP6, neighbor
> solicitation, who has 2001:470:1f0b:11de::21, length 32=20
>   IN=3Dvde OUT=3D MAC=3D33:33:ff:00:00:21:00:16:3e:16:38:41:86:dd
>    SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0022
>    DST=3Dff02:0000:0000:0000:0000:0001:ff00:0021
>    LEN=3D72 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D135 C=
ODE=3D0
>  =20
>   IP6 2001:470:1f0b:11de::21 > 2001:470:1f0b:11de::22: ICMP6,
> neighbor advertisement, tgt is 2001:470:1f0b:11de::21, length 32=20
>   IN=3D OUT=3Dvde
>    SRC=3D2001:0470:1f0b:11de:0000:0000:0000:0021
>    DST=3D2001:0470:1f0b:11de:0000:0000:0000:0022
>    LEN=3D72 TC=3D0 HOPLIMIT=3D255 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D136 C=
ODE=3D0
>  =20

Just looking at these lines as I pasted them actually helped: ICMP6
neighbor solicitation request was sent from 22 to 21, while the packets
were originated from 21.
Made me wondering about what kind of backwards magic is at work here...


> ip addr:
...
>   7: vde: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast sta=
te UNKNOWN qlen 500
>       link/ether b2:f5:e7:68:fd:9e brd ff:ff:ff:ff:ff:ff
>       inet 192.168.0.20/28 scope global vde
>       inet6 2001:470:1f0b:11de::20/125 scope global
>          valid_lft forever preferred_lft forever

And here's the problem: no link-local address on the interface.
"ip addr flush dev vde" in init.d script setting up interface did that,
that was the mistake.

With this address added (or rather preserved), router is able to send
neighbor solicitation requests from it and everything works fine.

Anyway, strange thing is that, apparently, VM on the other side is able
to send these requests without link-local address, using global one
instead:

  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qlen 1000
      inet6 2001:470:1f0b:11de::22/125 scope global
         valid_lft forever preferred_lft forever

Guess older kernel (2.6.30.4) there is the cause of it, and that's also
why it worked before with pretty much the same setup.

Thanks again to Pascal for pointing me in the right direction.


--=20
Mike Kazantsev // fraggod.net

--Sig_/h1G70NmK=uNtPI0q0.xxl_y
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.13 (GNU/Linux)

iEYEARECAAYFAksvO2cACgkQASbOZpzyXnF6NgCg2SSKS1elHpjiAKNAgJjfBIN1
Ce4AnA62mwwHQ03fEeCX+0FilRpZ+Mqb
=49lu
-----END PGP SIGNATURE-----

--Sig_/h1G70NmK=uNtPI0q0.xxl_y--
