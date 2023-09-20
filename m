From: Florian Westphal <fw@strlen.de>
Subject: Re: [ANNOUNCE] ipset 7.18 released
Date: Wed, 20 Sep 2023 14:50:56 +0200
Message-ID: <20230920125056.GA25778@breakpoint.cc>
References: <55c2bf9d-ec58-8db-e457-8a36ebbbc4c0@blackhole.kfki.hu>
 <382279q3-6on5-32rq-po59-6r18os6934n9@vanv.qr>
 <0r045rnn-70s8-34pq-o5o3-nr3q48n9sq68@vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0r045rnn-70s8-34pq-o5o3-nr3q48n9sq68@vanv.qr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, sam@gentoo.org

Jan Engelhardt <jengelh@inai.de> wrote:

You might want to CC author of that change.

> On Wednesday 2023-09-20 13:20, Jan Engelhardt wrote:
> >On Tuesday 2023-09-19 20:26, Jozsef Kadlecsik wrote:
> >>
> >>I'm happy to announce ipset 7.18, which brings a few fixes, backports, 
> >>tests suite fixes and json output support.
> >
> >The installation of the pkgconfig file is now broken.
> >
> >>  - lib/Makefile.am: fix pkgconfig dir (Sam James)
> >
> >Aaaaagh.. that change completely broke installation and must be reverted.
> 
> commit 326932be0c4f47756f9809cad5a103ac310f700d
> Author: Sam James <sam@gentoo.org>
> Date:   Sat Jan 28 19:23:54 2023 +0100
> 
>     lib/Makefile.am: fix pkgconfig dir
> 
>     Signed-off-by: Sam James <sam@gentoo.org>
>     Signed-off-by: Jozsef Kadlecsik <kadlec@netfilter.org>
> 
> Can I just take a moment to vent about this some more.
> The change is, in the words of another Linux developer, utter garbage.
> ${libdir} contains ${prefix} and did so for eternities.
> 
> The commit message is utter garbage too, because it does not
> even try to make an argument to even _have_ the change in the
> first place. Allowing such an underdocumented change is a
> failure in the review process itself.
