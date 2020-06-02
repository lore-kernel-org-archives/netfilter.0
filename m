From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Tue, 2 Jun 2020 12:58:20 -0700
Message-ID: <000d2e24-1df3-c42a-3117-05d6390194e8@softtalker.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
 <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
 <20200601124124.GA12580@salvia>
 <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
 <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
 <29f39abf-a146-fa5a-6178-574cbfb9c83c@softtalker.com>
 <20200602162536.55948b65@redhat.com> <20200602183819.50b4bd84@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200602183819.50b4bd84@redhat.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

> On Tue, 2 Jun 2020 16:25:36 +0200
> Stefano Brivio <sbrivio@redhat.com> wrote:
>
> Mike, yes, I'm seeing a number of issues with your reproducer,
> debugging that now.
>
> The only kind of unique thing about your setup is that you declare a
> set with intervals but (I guess) you never add intervals to it. That
> should work in any case, but as quick workaround, you could omit the
> 'interval' flag in the set declaration -- assuming you're always
> inserting single elements.
Hi Stefan,

I was considering that myself.  As of now, I only declare single elements, and no CIDR's nor ranges.  I will look into changing that since the Debian testing kernel availability won't be as timely as I'd like for this particular change.

Thanks for looking into this and confirming.

-MikeD
