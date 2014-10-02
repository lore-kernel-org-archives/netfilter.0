From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: ban traffic per country
Date: Thu, 02 Oct 2014 19:35:48 +0200
Message-ID: <542D8CF4.8060505@familie-kuntze.de>
References: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAODtcdfJrgtXcoQUVkJ=kcUuf-p1MkVnz8DDqLXdSEyMkYzH7A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Al Grant <bigal.nz@gmail.com>, netfilter <netfilter@vger.kernel.org>


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Al,

Yes, that is possible. Get the list of subnets that is assigned to the =
ISPs in
New Zealand and put it into an ipset. Then match on said ipset with the=
 "set"
match module.

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 02.10.2014 um 19:27 schrieb Al Grant:
> Hi All,
>
> I have a Amazon instance running asterisk. I think it also has fail2b=
an running.
>
> I want to lock it down a little as I have opened up some ports for
> asterisk to run.
>
> In essence no traffic should connect to it except from my country .nz
>
> Is there a way to do this? I see a few websites list some very long
> lists of iptables per country.
>
> Cheers
>
> -Al
>
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJULYz0AAoJEDg5KY9j7GZYWloQAISdZ9eh48B9Verdp1uKPDo0
DqBK/yvoDjbVvVH9DPc0r4T9niOsfrnUwHwCrkbJeIZy1nXjzubHZQsaOWD+lAd5
D/g8Owg6s82KKxCMQiuOQ8757Yya39cQPpOhRHq/RAL/LYe7z/36uq87bB4Empb2
iFQ+MiDUmCIFjV5tjbOHchSU4e9RMtMB0FOfkwq2sdKtPyVWdlwUDpig6MNPEazF
ftKEAQjLARt/Q+9WcXqgObyq3r2qgqqMnzdeXbgLHLnh/PI4MhmDP0eDEsQw10+z
QRwqbQ/fdRtZVTDxgFLDovICsDjv+Sd1vZoOQ6JOkHBKOMiurZtJYXTBzrDB2PXl
IeCbvcpTKBpYiSuTyslWF8NDKFNZ0n0yDjHchwat64LEKnlurxLmK+eqXhZ+WkuB
=468qctSEXcirdG/1HFwTh99z4A/3IONz1YYj9yaeqfGer512Imwk+5gv5spThDjCr
vWOyLQaiTaNRldLjQnFRMLnVRG08m5EVk1KwRhy2nw0DB7o2nhQIxB7ooNwiM1MF
EujimHn+22xiijUfinAmQTCE906fqsgEgw7+4ohL8VrSWc78HpLa92J3GVxkiT33
YYDHnPvCT2oK9QtpB8zn/MBZw6wXvuXRWfnm9OwGWCuD1vDqXGDGtlGqGqEgDV9/
9/1E8+kvwY79busU3317
=3DiFBn
-----END PGP SIGNATURE-----

