From: =?UTF-8?B?VmxhZG8gRHLFvsOtaw==?= <vlado@ttx.sk>
Subject: Re: Xtables-addons 1.18 released
Date: Wed, 23 Sep 2009 09:41:00 +0200
Message-ID: <4AB9D10C.8030702@ttx.sk>
References: <alpine.LSU.2.00.0909091747080.23602@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.00.0909091747080.23602@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Jan,

Awesome work. Thank you.
I'm delighed to see the ACCOUNT code merged in.
I've tried ACCOUNT module with 2.6.31 and it works from kernel and
iptables side.
But what is not working for me is userspace part libipt_ACCOUNT (from
intra2net site).
Is that working for someone?
Without this you can't read the accounting data from kernel or is there
another way how to read the data now?

Thanks,
Vlado

Jan Engelhardt  wrote / nap=C3=ADsal(a):
> Hi everyone,
>=20
>=20
> Coinciding with the imminent release of Linux kernel 2.6.31, here is
> Xtables-addons 1.18. Of the numerous submissions I have received
> recently (thank you!), I got to merge the "ACCOUNT" and "psd"
> modules. The rest still needs review, but did not want to hold up
> some release here. There are also a number of fixes to the
> (already-existing) quota2 match =E2=80=94 which can be used for small=
-scale
> accounting too.
>=20
> Boilerplate:
> http://downloads.sf.net/xtables-addons/xtables-addons-1.18.tar.bz2 {,=
=2Easc}
>=20
> REMINDER that the Sourceforge GIT URL changed due to multi-repo suppo=
rt.
> The new one is:
> git://xtables-addons.git.sf.net/gitroot/xtables-addons/xtables-addons
>=20
> If in doubt, just visit the frontpage at
> http://xtables-addons.sf.net/
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

