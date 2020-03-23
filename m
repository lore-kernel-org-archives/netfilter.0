From: darius <dram@mailbox.org>
Subject: A question about priority in chains
Date: Mon, 23 Mar 2020 20:48:29 +0100
Message-ID: <62b3a8f8-d0ae-bac1-c0f1-54f19ee3d31f@mailbox.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Gcrids6Uv2m6P9TrH23xD7cfReaxHssKW"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:mime-version:date:date:message-id
        :subject:subject:from:from:received; s=mail20150812; t=
        1584992916; bh=zlgwl76WUQX2Z9UN4Huqv0dXfeJbFnskP/boRsclxbI=; b=n
        dQNCRPxZZ+aEKtRMh/qguiGwPDLCQnvRrYnSX0OXoMo6yd5Jhh2ieXo+bI1tMfRj
        As+rLCw/NqPqJijhJVv0t4+yge1yPcEN9tzS6nfi4OIgQPagm3dHZ3U+OLhx1Kyg
        xjLQJ5wj/3wTkWSdUxxo3BqfFagK2ttjkI/SabIMSBvIAAEbArPOBat+3golbK1q
        9RTfZ00AmzeLKNhyYonatdwsZMl9pZRbuA4T74kpJ7IU+rxGix2AhaP7DTbYL7je
        RWqS9ndPWy7M8CnOf8QMxDiYDgGNAgAbVL8CcRt2uqX/rJXctIVr/6YGPL+sNy+q
        XQrIbzIC3X4E42+E5Hrsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1584992917;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
        to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
        bh=zlgwl76WUQX2Z9UN4Huqv0dXfeJbFnskP/boRsclxbI=;
        b=B5LHi0Ag1rsdqMsILaBor03vkc+FrD5joP6VNnluV5gvjsuc9PxQAJpk7wMxxtlHrKIsQH
        x6CXy6ikFcmiiFB5TpQ+06YPUsG0TYz0Vm/zAZHiZ2atIilWCZb1TwW5WbBAub6lv/lIh3
        vkd1aTqthrk+sw5wy+WlVocGf++eS/4KUad933Wbj4ShlXjDk1rS3bKYD58vPlsD1ha8Le
        nEAgl2a1duLoznEKQpuJWmLmRxHbbjYbxBmzuAOapxPBIDQCyE/Lzc5SMv9V7vFQqs1Lnu
        lZ0YIwmN+vFfva3h/K77l/pAeyc8+I7lA3aRJQ29nqvbPlnt8erT2FrijEHPow==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Gcrids6Uv2m6P9TrH23xD7cfReaxHssKW
Content-Type: multipart/mixed; boundary="JG1N0fJjTmYygSDWezaIue67lnNVrIUwg"

--JG1N0fJjTmYygSDWezaIue67lnNVrIUwg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm still studying a bit of nftables and got confused about priority
value in chains. Manual says:

priority refers to a number used to order the chains or to set them
between some Netfilter operations. Possible values are:
NF_IP_PRI_CONNTRACK_DEFRAG (-400), NF_IP_PRI_RAW (-300),
NF_IP_PRI_SELINUX_FIRST (-225), NF_IP_PRI_CONNTRACK (-200),
NF_IP_PRI_MANGLE (-150), NF_IP_PRI_NAT_DST (-100), NF_IP_PRI_FILTER (0),
NF_IP_PRI_SECURITY (50), NF_IP_PRI_NAT_SRC (100), NF_IP_PRI_SELINUX_LAST
(225), NF_IP_PRI_CONNTRACK_HELPER (300).

So, if I use hook "prerouting" and priority -150, then I will be in
"Prerouting Mangle" chain acc. to Netfiler packet flow. If I will use
hook "prerouting" and priority -100, then I will be in "Prerouting NAT"
chain and so on. All clear.
But what will happen if I use hood "filter" and priority -150, for
example? There is no chain "Filter Mangle" according to Netfilter packet
flow. I'm quite sure that combination of hook "filter" and priority -150
will work, but does it have any sense?
Can anyone please give more detailed information on this topic? Can I be
a bit away of Netfilter packet flow by using different hood and priority
combinations, or is it recommended to stay within official Netfilter
packet flow?

--=20
Best regards,
Darius


--JG1N0fJjTmYygSDWezaIue67lnNVrIUwg--

--Gcrids6Uv2m6P9TrH23xD7cfReaxHssKW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEsTT6a9w8eWH3N7FdweSUJGHD1ZoFAl55EpMACgkQweSUJGHD
1ZrSUAf8Dt+/3bKo0nG2K7oRbKF0um/iz23Idn4I/VorRLzb1QAUd2C04bZ5WYr3
Q4ZeeQ6Voz8XSqzPFbwFrTGNFaZyYGdJXW7ZyJyrRmIPC7JOOC9dt6CpKWx+RKCE
d4LqoHcUu+xpEgWXlzolLLTcl2j1TtoAPW/+B+E+hEcbVxo8+5D8A7L2RdXmwrRf
rUVIQzrChf6oLliCYy9O7SFEugV73FqN6eak8n1A77M6Bara60B49Sm1tz1ad3p8
4ayjNZjihL81Jmxh7FUBKwHufb8MRbLxagUKIi2G3cgozybCh8+Jhd+VtJE1UMXl
nUg/c2g0250X//auGB+lx/wjT+cs2w==
=QmOg
-----END PGP SIGNATURE-----

--Gcrids6Uv2m6P9TrH23xD7cfReaxHssKW--
