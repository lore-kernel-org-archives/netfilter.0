From: Thomas Delrue <delrue.thomas@gmail.com>
Subject: Limitation on number of rules
Date: Wed, 9 Sep 2015 09:32:43 -0400
Message-ID: <55F034FB.7000104@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=fE787qzeJLLjXBqw/LuKx0+CI84u2W8xm7l3/uf5F60=;
        b=leOuzlqfOeWknwGp7X1C8BjZwLjthBJoNbOjeQNgFBdhv441ziVAlpRrtMKgRuvP1j
         0p99TcbQKnud/vpNHim7DCU6xjo/32N8SRF4MNS3td4Jo2Oua5l/xSGqWIM61Xep0kI5
         UVoWprVHeujbD36TyT0ctdAT/24YMYOdAMSuVfBdKUJ006WFfynJnj2tsiFyrorTuSmh
         EGBvmBEJ25mxMEkqpYt1Opx3Ihuil6Y+PxmQXc1bxbRmx061Bsy9VIGhP5fzR3r+uShq
         JvB3b85TNyKa52T3e2O64EJx6hyJ8XWzEliEhodFlL1WE5XD/Ks84QqNR1dW28uP5h2x
         Fz+A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi,

Is there an upper limit on how many rules one can have in total or per
chain?
I realize that this is limited by the memory available to the machine
but is there a formula that one can use to determine how much memory
will be needed/is used is one has X rules.

Thanks
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCgAGBQJV8DT7AAoJEKosl9oIs/pOvqEP/RRB3HBhORc76T78poJDUCeo
L1jSVot6VpHfRIYpBn0/ZGht0RPEdWU1T+XscfrdsWMSWAyWeqCRWZiWKMAeErEg
bGuMjwFJir/8E1apjH5y0DLGv7Rlpb2yKmYJBe1wTi3BeBeiIjFOwVQuakZUGkPq
XOGAUYIh0Jh9/LzBX0FpadzHvd5teF/OcUSHoufGzJKVxwUqqepaW76tQ5ODnWDz
rfceqXYS9rz1IaEWZF8Fr8OD1qDXC3mPdMaSPzt9nn2miSv49MW4J5hzKxmmwe99
rI0GnaWm2PU7H/84il/xfwcU8qF8KWmbDseAf5RkfkHsXAqD6OUJQ+sRO5CR93jM
U0bUugtGVYwvZz1IxwbnZgjYAqW4oI1SFOR0ymIaqAZTEgHdneA+90kyjZFnHfQ/
z17aTsBf05vI2bFQbq1v/oc4t75BXZRNw51rSBdnhsy+o1fATWxcG4nmeU5uhFXZ
boz55T3mj+y1Kn2hLuyY/afq8soeWOHm/GNhIiHYhFipcKaQ6Fy7tv9r38D6dUpr
OUblkueqMRXXes5/kuO2juNe/6eTPu3TzyhzuNmdMyk8mU/r1faW8KV+mp/WClTU
azAd7Vhq5RglgCELxK0ZzGzCVk9+L9uY3Uo0lloAuHN9vWY9q8O4obNAdlbCYThU
sOC7h/2Ve9NajlyMma0M
=FMzL
-----END PGP SIGNATURE-----
