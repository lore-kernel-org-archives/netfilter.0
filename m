From: darius <dram@mailbox.org>
Subject: Re: A question about priority in chains
Date: Tue, 24 Mar 2020 20:28:16 +0100
Message-ID: <5042488d-3299-4a53-9250-843a3e902717@mailbox.org>
References: <62b3a8f8-d0ae-bac1-c0f1-54f19ee3d31f@mailbox.org>
 <e43d85e0-0a1c-05b8-d1b4-bed6bdcbe6a2@fhmtech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="cVIo6xSzN9GSqamLkDeVzxLcknBxJbK4o"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:in-reply-to:mime-version:date:date
        :message-id:from:from:references:subject:subject:received; s=
        mail20150812; t=1585078103; bh=LjuoFEgbvEcYwTjg4e68N7FGozWs/FeQ8
        OnUcpsNo/c=; b=ZWl3/YDm0Z9vG1Wbi/TKdycR29wSx1XacfANbk3wbUykYkka/
        osKSFST/pIyJ+OEihqMmwWwDBBu0AEEK6sw9+TOHDB89C97tiBLZ4/Ry92v0IjtI
        Dmbe66mcFObmUihKmFkeDVypT3OokK3KGMmm4Gl+dt699ZuWhqrS/MJe13+nqAOE
        TP1GXGfClJdbVR0sf9zh18fThqxx+JGZ4qPDaE6UNu+L0CfTEA2rJuXrnCV3Zs1V
        k08ogb2oO9h/VECF+9b5WelS5bEgco+2G4HripjH3lBEu/FO8ZpN6Ue2sZNZ5BYF
        i1mUQ0EepwjWDlYguNGQ21oyIG1NtvRZ6qUQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1585078104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=LjuoFEgbvEcYwTjg4e68N7FGozWs/FeQ8OnUcpsNo/c=;
        b=UzzcK3COnAFUgLwPeL4PvHefSbDrpE0IrfclXF/vXdDZEv4xIEaSNFjCVd4/7Y1pSmvaaC
        tjQwezOduk41Md9OsM9EyxeP1ii+sHh8iXb3AGl8VBmF9u5irDoVU7pzyRZsK0zeM4OSpn
        NDStI5I79OSrVjNRUdomoFkCM01BJEZF8BdOZH2T5w7Rn6m4rIYn0yhEJ8HcOYwjvH32h+
        q1ZxsnrAgkSwhnX06T7Rwiq7qiG3ngekHYgoyyIfN+E+U4FPN5jAyRgOsD+U6I20Rk6R0y
        GLHtXTiujxDMFM44bQiH8vcgFcasCWkt7cpnGBe0hrHSuPNfnSf4AePXUKbvCQ==
In-Reply-To: <e43d85e0-0a1c-05b8-d1b4-bed6bdcbe6a2@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Frank Myhr <fmyhr@fhmtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cVIo6xSzN9GSqamLkDeVzxLcknBxJbK4o
Content-Type: multipart/mixed; boundary="Ba7kjg1ZQB58aBY7rxsT5TGQgdxay7lYL"

--Ba7kjg1ZQB58aBY7rxsT5TGQgdxay7lYL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Thank you very much for your thorough explanation. It makes total sense
to me.

And yes, I've made a mistake in my question. I was referring to
Netfilter packet flow
https://en.wikipedia.org/wiki/Netfilter#/media/File:Netfilter-packet-flow=
=2Esvg
and my main concern was if it makes sense to have combination of
chain/hook/priority which does not exist in Netfilter packet flow. For
example, "filter" chain, "input" hook and NF_IP_PRI_NAT_DST(-100)
priority. It does not makes sense to have DST NAT in input filter as
routing decision is already done. I guess I was a bit confused with
constant names assigned to priority values.

But again, nft is replacement for netfilter and it works in slightly
different way. that was maybe a bad idea to try to follow Netfilter
packet flow diagram.

Anyway, your explanation really answered my question.

Best regards,
Darius

On 24.03.2020 13.20, Frank Myhr wrote:
> Hi Darius,
>=20
> On 2020/03/23 15:48, darius wrote:
>> Hi all,
>>
>> I'm still studying a bit of nftables and got confused about priority
>> value in chains. Manual says:
>>
>> priority refers to a number used to order the chains or to set them
>> between some Netfilter operations. Possible values are:
>> NF_IP_PRI_CONNTRACK_DEFRAG (-400), NF_IP_PRI_RAW (-300),
>> NF_IP_PRI_SELINUX_FIRST (-225), NF_IP_PRI_CONNTRACK (-200),
>> NF_IP_PRI_MANGLE (-150), NF_IP_PRI_NAT_DST (-100), NF_IP_PRI_FILTER (0=
),
>> NF_IP_PRI_SECURITY (50), NF_IP_PRI_NAT_SRC (100), NF_IP_PRI_SELINUX_LA=
ST
>> (225), NF_IP_PRI_CONNTRACK_HELPER (300).
>>
>> So, if I use hook "prerouting" and priority -150, then I will be in
>> "Prerouting Mangle" chain acc. to Netfiler packet flow. If I will use
>> hook "prerouting" and priority -100, then I will be in "Prerouting NAT=
"
>> chain and so on. All clear.
>> But what will happen if I use hood "filter" and priority -150, for
>> example? There is no chain "Filter Mangle" according to Netfilter pack=
et
>> flow. I'm quite sure that combination of hook "filter" and priority -1=
50
>> will work, but does it have any sense?
>=20
> Actually this will not work; there is no "filter" hook.
>=20
> Relevant wiki pages:
>=20
> https://wiki.nftables.org/wiki-nftables/index.php/Main_differences_with=
_iptables
>=20
>=20
> https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains
>=20
> https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftab=
les_in_10_minutes#Chains
>=20
>=20
> https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks
> * Good diagram of netfilter hooks for families ip, ip6 and inet:
> =C2=A0=C2=A0=C2=A0=C2=A0prerouting, forward, input, output and postrout=
ing
> * arp family has only input & output hooks.
> * netdev family has only ingress hook.
> * bridge family has hooks: ???
>=20
> As I understand it, the above hooks always exist, and are used by
> connection tracking and routing. At each hook, nftables packet filterin=
g
> happens only if you hook a base chain there. The numerical priority you=

> assign your base chain affects the order in which netfilter operations
> happen *on that hook only*.
>=20
> If you create 2 base chains:
>=20
> nft add chain ip some_table INPUT_NEG150 { type filter hook input
> priority -150 \; }
>=20
> nft add chain ip some_other_table INPUT_0 { type filter hook input
> priority 0 \; }
>=20
> then ipv4 packets at the input stage of processing will traverse chain
> INPUT_NEG150 before they hit chain INPUT_0. If instead of -150 you'd
> assigned priority -1 to INPUT_NEG150 this would still be true. The
> absolute priority numbers do not matter, only their numerical order
> within the same hook matters. If you have two base chains at same hook
> with _same_ priority... I don't know what happens! Probably best to
> avoid that. Even if deterministic, it would still be confusing to us
> ugly bags of water (obscure Star Trek reference, sorry).
>=20
> Hope this helps (and that it's correct),
> Frank


--Ba7kjg1ZQB58aBY7rxsT5TGQgdxay7lYL--

--cVIo6xSzN9GSqamLkDeVzxLcknBxJbK4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEsTT6a9w8eWH3N7FdweSUJGHD1ZoFAl56X1YACgkQweSUJGHD
1ZoC5wf+IEUXhZGYllijG6HW2ZtPAeTgj9h3YWi0LomzgXR6VQJDE7nJ/Xaa1PmJ
PGo6rBGhoaX/pcI9wy/iAsQpPas+Lz6ezx+uyvn0WACCySIfMF1CsDAG9Rv+YkAa
P+JYYZzwfxM86ENHTVDxnv4QftlR2RbkiPs5Tz3GuB71aItJYS+wFmff9B93xqpm
68ljZd4BnzXupSfTR1g6q3apx2s/vfPf1ohEipqzgnSXf4iYOGXmujsaxXLnnemX
Z6cHSmz71qlf9mDmDxrEyVX4c0JPY/vBIC6HnOl++TnUI+k3U7FAiaAmHJ83A0Uh
hrsLJMZ4qEnR75dJF33m7Aa/MqYdeg==
=Kt2e
-----END PGP SIGNATURE-----

--cVIo6xSzN9GSqamLkDeVzxLcknBxJbK4o--
