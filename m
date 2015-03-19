From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: DROP policy, serious vulnerability?
Date: Thu, 19 Mar 2015 12:34:45 +0100
Message-ID: <550AB455.1040705@familie-kuntze.de>
References: <550A63F0.2030400@gmail.com> <838AB161BE491743AE3CA3A916CF1CC648BB45AF@CCDEX015.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <838AB161BE491743AE3CA3A916CF1CC648BB45AF@CCDEX015.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?QW5kcsOpIFBhdWxzYmVyZy1Dc2liaQ==?= <Andre.Paulsberg-Csibi@evry.com>, dE <de.techno@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

Additionally, you will never be able to communicate this host, because
the policy in OUTPUT is DROP:

"iptables -P OUTPUT DROP"

Please read these docs on iptables rules and design to fix your setup:
http://inai.de/links/iptables/
https://github.com/QueuingKoala/netfilter-samples
http://sfvlug.editthis.info/wiki/Things_You_Should_Know_About_Netfilter
http://inai.de/images/nf-packet-flow.png

You do a lot of things wrong in your rule set. Please find out what the=
se
are and fix them yourself using the documents I referenced.

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 19.03.2015 um 12:25 schrieb Andr=C3=A9 Paulsberg-Csibi:
> I know you already have your answer (from Neal Murphy) , but I feel I=
 need to mention that your RULE makes no sense in a pratical manner !
>
> Now your rules are not working because the order is incorrect for you=
r *plans* ,
> but this even if you change the order , your setup makes less sense t=
han do things the "normal" way .
>
> To make the current set work you would not only have to change the or=
der ,
> But making new openings would require you to change one single rule w=
ith removing some ports from your DROP rule .
>
> iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:79,81:65535 =
-m state --state NEW -j DROP
> iptables -A INPUT -p tcp -j ACCEPT
> iptables -A INPUT -p udp -j ACCEPT
>
> next time you would make a more complex multiport rule ...
>
> iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:21,23:79,81:=
65535 -m state --state NEW -j DROP
> iptables -A INPUT -p tcp -j ACCEPT
> iptables -A INPUT -p udp -j ACCEPT
>
> next time you would make a even more complex multiport rule ...
>
> iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:21,23:79,81:=
442,444:65535 -m state --state NEW -j DROP
> iptables -A INPUT -p tcp -j ACCEPT
> iptables -A INPUT -p udp -j ACCEPT
>
> This makes very little sense when you can just make ONE accept for al=
l , and drop the rest !
>
> iptables -A INPUT -p tcp -i lo -m multiport --dports 22,80,443 -j ACC=
EPT
> iptables -A INPUT -j DROP
>
> I will mention I also removed your "iptables -A INPUT -p udp -j ACCEP=
T" ,
> and I would have replaced that with one that gives the ports you want=
 opened before the DROP rule .
>
>
> Kind Regards Andr=C3=A9
>
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ke=
rnel.org] On Behalf Of dE
> Sent: 19. mars 2015 06:52
> To: netfilter@vger.kernel.org
> Subject: DROP policy, serious vulnerability?
>
> Hi!
>
> I'm using the drop policy for iptables using the following --
>
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -A INPUT -p tcp -j ACCEPT
> iptables -A INPUT -p udp -j ACCEPT
> iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:79,81:65535 =
-m
> state --state NEW -j DROP
> Unfortunately, in this configuration, none of the ports get blocks.
>
> This implies that after an ACCEPT, further rules are not matched. Is
> this a bug or intended by design?
>
> If this is by design, how am I supposed to use modules like connlimit
> with DROP policy.
>
> Thanks for any help!
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> N=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDr=EF=BF=BD=EF=BF=BDy=EF=
=BF=BD=EF=BF=BD=EF=BF=BDb=EF=BF=BDX=EF=BF=BD=EF=BF=BD=C7=A7v=EF=BF=BD^=EF=
=BF=BD)=DE=BA{.n=EF=BF=BD+=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=EF=BF=BD=
=D7=AB=EF=BF=BD{ay=EF=BF=BD=1D=CA=87=DA=99=EF=BF=BD,j=07=EF=BF=BD=EF=BF=
=BDf=EF=BF=BD=EF=BF=BD=EF=BF=BDh=EF=BF=BD=EF=BF=BD=EF=BF=BDz=EF=BF=BD=1E=
=EF=BF=BDw=EF=BF=BD=EF=BF=BD=EF=BF=BD=0C=EF=BF=BD=EF=BF=BD=EF=BF=BDj:+v=
=EF=BF=BD=EF=BF=BD=EF=BF=BDw=EF=BF=BDj=EF=BF=BDm=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=07=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDzZ+=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=DD=A2j"=EF=BF=BD=EF=BF=BD!tml=3D

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVCrRSAAoJEDg5KY9j7GZYgnQP/jaMJbcnPRpROwVk5s49ozPc
0urtcfmNkMLvAS1wwWm67P4r0SEkU8nN6+6Zr/2Lr5M+TjVsqfleIjdxi/eK2Ph6
oz9AX+b/PMwEBbNDOTB5zQ1NzOSAF6ChmTfFmVQiAWKRl/wjxLBP5YjKp7cSEV6H
EOXlFeY7SETxcw/OuOgGD1FsJ0W4z3DcvYTpns5waVXVfon/t+3S6FfGIaFxONuo
RBiJiEAtqRnUD4jpEnnOraUQ4U/lXXSfzchwASVwe1+BMdPozCJVGMFaofOtMxjA
GPHkr2TDBrLNt0VpC6HQCNNXKBVuktEgZ7oAQVXjwBev1GtZm32DsEPuGDXsvsSJ
q1/Yb9uq1hNoqiJmaT0Pa/BTaWSJMTYXucwL1qTKbbid6SuIrd5fWcgE2DLm7Igw
8Z4V7XXuzetdqhyo3znv/qp0pzt46vQRfcvsBr0l1LLRQhAg++Obm9CFKHIWnh1U
O4B754e4Lx2LhpMdOrsjVrA04dHq7IK7CDxtahRUcn8Ml66fhCWAR8D9rWNjoKBp
NJ2f/3W+ohYD/Jj0e+CG2hA80gy7vfuUs+nvxOWSznCK103yA8zuyTCnmgCu3xK3
bdYHf6qkLQq8R/YVrUkAgb7GOxYwjitlVJSvbEhxtDxh8LFHfXm2jdSyXgMdnkNL
G/yeZ+p0nFF8GtLwCjUE
=3DjHen
-----END PGP SIGNATURE-----

