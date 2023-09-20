From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ipset 7.18 released
Date: Wed, 20 Sep 2023 13:20:42 +0200 (CEST)
Message-ID: <382279q3-6on5-32rq-po59-6r18os6934n9@vanv.qr>
References: <55c2bf9d-ec58-8db-e457-8a36ebbbc4c0@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <55c2bf9d-ec58-8db-e457-8a36ebbbc4c0@blackhole.kfki.hu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Tuesday 2023-09-19 20:26, Jozsef Kadlecsik wrote:
>
>I'm happy to announce ipset 7.18, which brings a few fixes, backports, 
>tests suite fixes and json output support.

The installation of the pkgconfig file is now broken.

>  - lib/Makefile.am: fix pkgconfig dir (Sam James)

Aaaaagh.. that change completely broke installation and must be reverted.

[   44s] RPM build errors:
[   44s]     Installed (but unpackaged) file(s) found:
[   44s]    /usr/usr/lib64/pkgconfig/libipset.pc
