From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ipset 7.18 released
Date: Wed, 20 Sep 2023 13:30:06 +0200 (CEST)
Message-ID: <0r045rnn-70s8-34pq-o5o3-nr3q48n9sq68@vanv.qr>
References: <55c2bf9d-ec58-8db-e457-8a36ebbbc4c0@blackhole.kfki.hu> <382279q3-6on5-32rq-po59-6r18os6934n9@vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <382279q3-6on5-32rq-po59-6r18os6934n9@vanv.qr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Wednesday 2023-09-20 13:20, Jan Engelhardt wrote:
>On Tuesday 2023-09-19 20:26, Jozsef Kadlecsik wrote:
>>
>>I'm happy to announce ipset 7.18, which brings a few fixes, backports, 
>>tests suite fixes and json output support.
>
>The installation of the pkgconfig file is now broken.
>
>>  - lib/Makefile.am: fix pkgconfig dir (Sam James)
>
>Aaaaagh.. that change completely broke installation and must be reverted.

commit 326932be0c4f47756f9809cad5a103ac310f700d
Author: Sam James <sam@gentoo.org>
Date:   Sat Jan 28 19:23:54 2023 +0100

    lib/Makefile.am: fix pkgconfig dir

    Signed-off-by: Sam James <sam@gentoo.org>
    Signed-off-by: Jozsef Kadlecsik <kadlec@netfilter.org>

Can I just take a moment to vent about this some more.
The change is, in the words of another Linux developer, utter garbage.
${libdir} contains ${prefix} and did so for eternities.

The commit message is utter garbage too, because it does not
even try to make an argument to even _have_ the change in the
first place. Allowing such an underdocumented change is a
failure in the review process itself.
