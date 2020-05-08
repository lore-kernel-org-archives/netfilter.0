From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Fri, 8 May 2020 10:13:06 -0700
Message-ID: <97c834d9-9810-e2b7-8a80-5e6b1e84c252@softtalker.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200508160132.GA2278@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> Please, make sure your Linux kernel version is >= 5.6.7 or manually
> cherry-pick this fix which was included starting that version.
> Versions from 5.6.0 to 5.6.6 include this problem you describe.
>
> See https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.6.7
>
> Author: Stefano Brivio <sbrivio@redhat.com>
> Date:   Wed Apr 1 17:14:38 2020 +0200
>
>      netfilter: nft_set_rbtree: Drop spurious condition for overlap detection on insertion
>      
>      commit 72239f2795fab9a58633bd0399698ff7581534a3 upstream.
>
Thank you very much!
-MikeD

