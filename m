From: Adel Belhouane <bugs.a.b@free.fr>
Subject: Re: Connection tracking Cli and an ALG for DNS
Date: Wed, 2 Dec 2015 12:12:47 +0100
Message-ID: <565ED22F.7070903@free.fr>
References: <201511041332.09522.boober95@rogers.com>
 <201511061727.37090.boober95@rogers.com> <5648D2D2.7010107@free.fr>
 <201511191352.03564.boober95@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201511191352.03564.boober95@rogers.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill <boober95@rogers.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Le 19/11/2015 19:52, Bill a =E9crit :

> For reference here is my diagram again:
>=20
>>>> local host               dns/nat gateway              remote host
>>>> 192.168.20.171      192.168.20.170                192.168.30.172
>>>>                                192.168.30.170
>>>> inside               ----->>> nat >>> ------          outside
>=20
> As you can see, DNAT would no do for my requirements since I'd have t=
o=20
> add/delete iptables rules, which I supposed I could do, but doesn't s=
eem te=20
> right approach.
>=20
> Now since my original posting I have been reading code and have mange=
d to=20
> create an e'expect' connection by upgrading to the latest 4.4 kernel.=
  In=20
> this version I find the sample test 'create-expect' works.
>=20
> After succeeding with this I realize I may need to build a kernel mod=
ule for=20
> the expectation and have started looking at the kernel code for this,=
 such as=20
> those for FTP etc.
>=20
I didn't get before that the "ALG" part was essential. I read a summary=
 here:
https://www.juniper.net/documentation/en_US/junos12.1x47/topics/concept=
/security-alg-dns-overview.html

So I still don't get exactly what you are looking for (sorry), but I re=
alize
it's related to DNS data content, not just connections. Sorry to have
waisted your time with my replies and good luck with your project.

> /bill
>=20

regards,
Adel BELHOUANE.
