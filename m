From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Mon, 1 Jun 2020 09:13:10 -0700
Message-ID: <ec6b660c-e06f-80f5-d865-30985892d546@softtalker.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
 <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
 <20200601124124.GA12580@salvia>
 <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
 <20200601174814.17bacbd4@elisabeth>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200601174814.17bacbd4@elisabeth>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

> *From:* Stefano Brivio [mailto:sbrivio@redhat.com]
> *To:* Mike Dillinger <miked@softtalker.com>
> *Cc:* Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org
> *Date:* Monday, June 1, 2020, 8:48 AM PDT
> *Subject:* nftables: Strange Error When Adding Element to Named Set
>
> Yes, that might help. By the way, your kernel (based on 5.6.8 upstream,
> not 5.6.14 -- that's the Debian package version) also contains:
>
> commit 340eaff651160234bdbce07ef34b92a8e45cd540
> Author: Phil Sutter <phil@nwl.cc>
> Date:   Mon May 11 15:31:41 2020 +0200
>
>      netfilter: nft_set_rbtree: Add missing expired checks
>
> so any issue in that sense should be fixed. See the changelog at:
> 	https://metadata.ftp-master.debian.org/changelogs//main/l/linux/linux_5.6.14-1_changelog
>
> Anyway, my further question is whether at the moment of the insertion
> there's an overlapping address already in the set, or the inserted
> address is included in an interval also already present in the set.
> What is "a.b.c.d" in your earlier report? Is it a single address or an
> interval?
>
> Once the failure is detected, would it be possible to automatically dump
> the ruleset (nft list ruleset)?
>
Hi Stefan,

I just saw this message after I sent out my detailed repro scenario.  Please let me know if I did something wrong and/or you would like me to dump the entire ruleset, or anything else for that matter.  I am hoping the repro scenario covers everything.

I can answer one of your questions.  At the moment of insertion, there are no overlapping ranges in my set.  I originally thought I wanted to declare CIDR's/ranges but never ended up doing that, but the table was originally created using intervals.  I've always used individual IP addresses.

"a.b.c.d" is an IP address in all of my correspondence, not a CIDR nor a range.

Thanks!
-MikeD
