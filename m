From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type for
 socket"
Date: Sat, 12 Dec 2015 14:41:42 +0100
Message-ID: <566C2416.3030304@familie-kuntze.de>
References: <n4g4s8$4pr$1@ger.gmane.org> <566BEF33.7090501@gmail.com>
 <alpine.DEB.2.10.1512121116390.13421@blackhole.kfki.hu>
 <566C09F5.6080606@gmail.com>
 <alpine.DEB.2.10.1512121259340.14295@blackhole.kfki.hu>
 <566C0E75.6080800@familie-kuntze.de> <566C1751.403@gmail.com>
 <566C1804.5060605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <566C1804.5060605@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Remzi_AKY=c3=9cZ?= <linuxliste@gmail.com>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: =?UTF-8?Q?D=c3=a2niel_Fraga?= <fragabr@gmail.com>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

>        States for --ctstate:
>
>        INVALID
>               The packet is associated with no known connection.
>
>        NEW    The packet has started a new connection or otherwise as=
sociated with a connection which has not seen packets in both direction=
s.
>
>        ESTABLISHED
>               The packet is associated with a connection which has se=
en packets in both directions.
>
>        RELATED
>               The packet is starting a new connection, but is associa=
ted with an existing connection, such as an FTP data transfer or an ICM=
P error.
>
>        UNTRACKED
>               The packet is not tracked at all, which happens if you =
explicitly untrack it by using -j CT --notrack in the raw table.
>
>        SNAT   A virtual state, matching if the original source addres=
s differs from the reply destination.
>
>        DNAT   A virtual state, matching if the original destination d=
iffers from the reply source.

- --=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

A quote from the man page

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWbCQUAAoJEDg5KY9j7GZYA2YQAJARyzxFzaYyaFWmYnLFnLTN
TkCAfWqBCIz1ibQs2ajuIIVypslyRjSd8cLKT4x+VMGgT2gUv6uBLW3hZ/Kysui1
mKtYWk+Tiy/XStgHhjStUY86ImXadl11jX5P2aj+Ogr1pV96GJzCk/lCNjsEpqXQ
Sk3LS7U4EfTODWMRclnnjWcjuN5EQxLbdtoGM1Q0u8XmbwtQtnPoqtVfK4DSp8ny
=46v7/JabOJtZ+Ej5iiQOySXn8AOJOAqN5inWG5TQylsDkk65IfhCDsedHUoBd+kL4
3Ej59+bIYcpGYtpQTmAjTrV37+cDCxg49ms/gNSN4w4UeFFmZ8Tk/CHN3Kl0TncD
yBqEE3KyL6DkbjWpUkUx0uCtTAztj3R1nkbGQKthrnGWF6sedWlan9EgVC+qmolC
aG42OjpkjfRjbP15TR3srdj3SrYv5NeXqS5o07pTjxKUJNl6jFqICX9qSOq/LJ0M
LGdCvqmJx021MNW8GzUEGYcStViF2goMolxA8DXG/Qp3j7GSR3GlU89JRDE1fMj6
+vch/+QfoO08op5+r35/poFciwtQSpdND5yWFGyXiNNpOu4l16wfto+fUhjkXdgF
wL4B8J4RzdmXijbvr1GqJoTdG+dQIyg9d8g9wo83otB9NEOVzFNJjynFN0vhpN6+
J8coUqcCgB+b5NsMMkDj
=3DpDL1
-----END PGP SIGNATURE-----

