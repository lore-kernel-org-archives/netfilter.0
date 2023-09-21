From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [ANNOUNCE] ipset 7.18 released
Date: Thu, 21 Sep 2023 08:56:59 +0200 (CEST)
Message-ID: <62d31829-d130-2e80-e7c-d3da4f19e90@netfilter.org>
References: <55c2bf9d-ec58-8db-e457-8a36ebbbc4c0@blackhole.kfki.hu> <382279q3-6on5-32rq-po59-6r18os6934n9@vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <382279q3-6on5-32rq-po59-6r18os6934n9@vanv.qr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>, Sam James <sam@gentoo.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi Jan,

On Wed, 20 Sep 2023, Jan Engelhardt wrote:

> 
> On Tuesday 2023-09-19 20:26, Jozsef Kadlecsik wrote:
> >
> >I'm happy to announce ipset 7.18, which brings a few fixes, backports, 
> >tests suite fixes and json output support.
> 
> The installation of the pkgconfig file is now broken.
> 
> >  - lib/Makefile.am: fix pkgconfig dir (Sam James)
> 
> Aaaaagh.. that change completely broke installation and must be reverted.
> 
> [   44s] RPM build errors:
> [   44s]     Installed (but unpackaged) file(s) found:
> [   44s]    /usr/usr/lib64/pkgconfig/libipset.pc

Thanks for quickly noticing the issue - the new release is already out.

Even two persons can make mistakes.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
