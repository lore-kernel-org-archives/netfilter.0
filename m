From: "Yoann JUET" <yoann.juet@univ-nantes.fr>
Subject: Re: ipset - bitmap:ip,mac kernel crashes, errors
Date: Thu, 11 Apr 2013 19:04:04 +0200 (CEST)
Message-ID: <b108bc79c3422cb7b587039ff4232f50.squirrel@webmail.univ-nantes.fr>
References: <7a05d31eedfbe24e7ebf47c00df77176.squirrel@webmail.univ-nantes.fr>
    <alpine.DEB.2.00.1304111652180.32023@blackhole.kfki.hu>
    <b4b9d9095cc35c0d3c167d09d9ac269b.squirrel@webmail.univ-nantes.fr>
    <alpine.DEB.2.00.1304111810520.32023@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1304111810520.32023@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Yoann JUET <yoann.juet@univ-nantes.fr>, netfilter@vger.kernel.org


> That looks OK. However, I'm unable to reproduce the problem: I create=
d a
> bitmap:ip,mac set with timeout, added 255 entries and can list it jus=
t
> fine.
>
> Is your machine stressed in memory? What's your architecture? Does th=
e
> "Kernel error received: No buffer space available" returned immediate=
ly
> after the set is created/elements added, or after some time?
>
> ENOBUFS is returned by netlink itself.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of
> Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
>

Tests are conducted on a dedicated virtual machine (KVM, architecture
AMD64). No I/O, memory stress. I observe the same problem on a "physica=
l"
debian or ubuntu machine. The string " "Kernel error received" is
immediately returned by 'ipset list'. I just wait a few seconds after t=
he
last 'ipset add' before executing 'ipset list'.

I've just compiled ipset modules provided by your package 6.17 with a
kernel 3.2... And that's much better. Don't know why ?! No more kernel
errors when issuing command 'ipset list'. Unfortunately, the ouput is n=
ow
troncated at the first 99 entries.

Regards,
Yoann.
--=20
Universit=E9 de Nantes - Direction des Syst=E8mes d'Information
IM jabber: yoann.juet@univ-nantes.fr




