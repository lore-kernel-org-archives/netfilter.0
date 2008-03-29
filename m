From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables vs. Linux kernel version question
Date: Sat, 29 Mar 2008 16:39:10 +0100
Message-ID: <47EE629E.8040104@plouf.fr.eu.org>
References: <20080329110322.9035678C75@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080329110322.9035678C75@gam.mel.teaser.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Noino a =E9crit :
> Is the a correspondence to be obeyed between the versions of the Linu=
x=20
> kernel version & the iptables program ?
> Specifically, I run a Linux kernel 2.6.5. My actual version of iptabl=
es=20
> is 1.2.9. Can I replace the latter with an up-to-date version without=
=20
> conflict (or else, up to which version?)

I have successully used an old iptables 1.2.11 with a recent Linux=20
kernel 2.6.24, but not the other way around.

> - and in the positive, is there=20
> anything to be gained from a new iptables program working with the ol=
der=20
> kernel ?

- Bug fixes.
- If the old iptables is older than the kernel, support for some new=20
matches, targets and options. For exemple the "comment" match support=20
requires Linux kernel >=3D 2.6.9 and iptables >=3D 1.3.0. (OK, this mat=
ch=20
may not be interesting enough to justify an upgrade)
