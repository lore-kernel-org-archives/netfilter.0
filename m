From: Louis Sautier <sautier.louis@gmail.com>
Subject: nftables: difference between "meta l4proto tcp" and "ip protocol tcp"
Date: Mon, 11 Sep 2017 23:10:26 +0200
Message-ID: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6DgdNhEFUN2bxq6UcXolalWPTxTRE21Mk"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version;
        bh=+u0bRIWYMCrCztkSrV4iRRfGR2cKvel8pM8TKqYTP90=;
        b=KaMQYPN6h0C55oTI2gAuMr47MF81aaoU46YvNdDx+bbx5XVXM6tYpWRq/cucrp+571
         lqFvHtk7PslvIWS/Q4P4RoSPsZTWmgpCuHDBv/LS2CIhfVriwEMYIsMf7C7cm/yYc7an
         nbj2Sr+BxXWBkkLXg1B/VkrlDIMoes7bum7UthT1Vq9vaUcP5eA9R3PSEKeCkka1gZ9J
         0RFF7OUvUT9ZgkFmioe6J7vBptMqGrOstThQ0iIYLqdkNOus6+LCASG7/8f/OHUeBSO6
         wz4Sn8A+Pm8d7j1H6rUaaYkKbXBjEOyuTlAO7NQ+cpRA0RBgA167AB/dNLB486UbCmbt
         7mrA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6DgdNhEFUN2bxq6UcXolalWPTxTRE21Mk
Content-Type: multipart/mixed; boundary="0BQ3g63pFNDgh2ohAgjXjjC4AKNM3L9Km";
 protected-headers="v1"
From: Louis Sautier <sautier.louis@gmail.com>
To: netfilter@vger.kernel.org
Message-ID: <ba8e2901-5aea-8e5e-9bc7-0d79bda82968@gmail.com>
Subject: nftables: difference between "meta l4proto tcp" and "ip protocol tcp"

--0BQ3g63pFNDgh2ohAgjXjjC4AKNM3L9Km
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hello,

I noticed that I can not use "ip protocol tcp" for IPv6, I assume that
this is due to IPv6 packets not having a protocol field.
However, I also noticed that "meta l4proto tcp" works for IPv4 and it
seems to match exactly the same packets as "ip protocol tcp".

The only relevant piece of information that I could gather is a message
(https://patchwork.ozlabs.org/patch/593221/) stating that (for "meta
l4proto" and "ip protocol") "However, the two statements are
redundants... the second implies the first".


If those expressions are different, what exactly do they use to match
packets? Is one more efficient?

I am writing a script that works with both IPv4 and IPv6, is it
reasonable to always use "meta l4proto" to avoid duplicating some code?


Please CC me in replies as I am not subscribed to the list.

Kind regards,

Louis


--0BQ3g63pFNDgh2ohAgjXjjC4AKNM3L9Km--

--6DgdNhEFUN2bxq6UcXolalWPTxTRE21Mk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIaYtDDqHEijHS173LN9/2oYrKfsFAlm2+8IACgkQLN9/2oYr
KftZ6wgAmYadEX2myCnGpW17T/ye7WRILY0bsazSfdhm04Ic935X1uElE82I/Cmk
BR6YUaihB3pJigRGIIjszn7UTLUJEa2GiBgJ37DAJgS1CIZOEtGWENzJsPo4foJG
HhQMEcwZ0f0jpA0JyDb8/+5Q1h9ZwXj+b9JHzl4hJaSeE/oMGx+iYZ4ZlJDHkrkF
6BKdL6I+VBf0YZgBJgb52HpLjFSOC38VvBeRzljqwOyDPkrFiDBNOTOofPJfjjC1
L6RIYUbazR2ksNwIpLUHSFO7t91q2gPevYeL3aR3P6h8KzDwqmy9JCrwXkEzGzBc
qMNcN6IXGq4+y9K6VtcLpixMAUsNog==
=eRPQ
-----END PGP SIGNATURE-----

--6DgdNhEFUN2bxq6UcXolalWPTxTRE21Mk--
