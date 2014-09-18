From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: FW: Can IPTables check for a valid IP address
Date: Thu, 18 Sep 2014 18:29:59 +0200
Message-ID: <541B0887.5090108@familie-kuntze.de>
References: <D4669F1AE5CE3D4293C4658A698E502904B637068E4C@SELENIUM.amity.local> <541AF628.8090509@sterenborg.org> <1888551.XEiLyKG9NI@nb003> <D4669F1AE5CE3D4293C4658A698E502904B637068E4F@SELENIUM.amity.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D4669F1AE5CE3D4293C4658A698E502904B637068E4F@SELENIUM.amity.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lars Dam <l.p.dam@amity.nl>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

If with "invalid", you mean addresses of a certain type
(multicast, anycast, broadcast, reserved address space, etc), look at t=
he addrtype module.

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658
Am 18.09.2014 um 17:53 schrieb Lars Dam:
> Thanks. I know what to do.
>
> Regards,
>
> Lars Da,
>
> -----Oorspronkelijk bericht-----
> Van: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ker=
nel.org] Namens Michael Schwartzkopff
> Verzonden: Thursday, September 18, 2014 5:31 PM
> Aan: netfilter@vger.kernel.org
> Onderwerp: Re: Can IPTables check for a valid IP address
>
> Am Donnerstag, 18. September 2014, 17:11:36 schrieb R. Sterenborg:
>> On 09/18/2014 03:50 PM, Lars Dam wrote:
>>> We suffer from DNS lookups with a response IP address which is not
>>> existing.
>>>
>>> Can Iptables check on this?
>>
>> What is it you actually want iptables to do? Do you want it to check
>> if the IP address that the DNS server responds with exists and is in=
 use?
>> Or..? Maybe the DNS server should be fixed instead of trying to go t=
his way.
>>
>> Iptables (well, Netfilter) is a packet filter. You can filter packet=
s
>> that match a rule that you define. It can't validate your DNS server=
's
>> output
>
> iptables cannot help you since the source IP address presumably varie=
s. If the source address does not vary than iptables can help you.
>
> Just google "iptables rate limit"
>
>
> Anyway, it seems that you operate a open resolver on your server. Ple=
ase google, why this is not a good idea. But if you really want to run =
a open resolver, than read the docs of your DNS server how to limit the=
 request rates. For bind, see:
>
> http://ss.vix.su/~vjs/rl-arm.html
>  .
>
>
>
> Mit freundlichen Gr=C3=BC=C3=9Fen,
>
> Michael Schwartzkopff
>
> --
> [*] sys4 AG
>
> http://sys4.de, +49 (89) 30 90 46 64, +49 (162) 165 0044 Franziskaner=
stra=C3=9Fe 15, 81669 M=C3=BCnchen
>
> Sitz der Gesellschaft: M=C3=BCnchen, Amtsgericht M=C3=BCnchen: HRB 19=
9263
> Vorstand: Patrick Ben Koetter, Marc Schiffbauer
> Aufsichtsratsvorsitzender: Florian Kirstein

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUGwiHAAoJEDg5KY9j7GZYeDYP/2hf9l/2ByZx1IzMHZfnHE/J
bmQYnip8bgRQc51Lcl4K3l06AMlBai947dDHvhFWbYRdJaMIPTLJ6v6Hudh/asSt
Tfa2Fdu2cIiSAWWBCcyRW0GqsJdXNrffwAWwWz5w0xv9TvX02Frd0FFyB9RJtmXL
yPioe+jLQS8677f/bM4Sy+zRDirGbPsCdBOlb0ysqKFOCue+Xipel640oPsp+HIt
C0GudjUMFKdQX66Vo/p69fWdpOEJeqnhpQ375fH89Y8dqjCpTRiOSUng3J/NNrCc
ylzfBZV6GRoPca535eXm2OhGcXbkdJkNyK6jJMpoQMjZ6pMiWD7rBzPr4ShVcCA7
2fYOTk68PJRwKp3UJFPP+oIdg1mo8ajc/w8idP72kabEG7i+psaVUxyr3Hw5+Lay
2LgFWiODWc9I3KDD6/pqaT7BvbC9Uvk0lLxx2LoWwrwoc+QO+sW39P4NkBvWUtrt
jP4aCAKWqcsh/FHhoI22D7GRurRa7cdDJIlZMa+E+5Zg6o2n0FTnQ2/UG8uSk0EA
6cevkcuEZtJ2sjozvYjfpz0jx0bF+jvl0nivDqLc/wUwLf1WKt7msniy8451seeT
eqq9cC2Ythsoi5i+gsRxC9S6pzz+s5icdqeP4tmF144TyljMfewNx0TjhDe3Auy0
I/t9vYIlgFlIo08Eapr1
=3DUFIr
-----END PGP SIGNATURE-----

