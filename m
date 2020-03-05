From: Florian Westphal <fw@strlen.de>
Subject: Re: Is it possible to get a transparent proxy with Redsocks when
 using the new nftables?
Date: Thu, 5 Mar 2020 12:12:45 +0100
Message-ID: <20200305111245.GI979@breakpoint.cc>
References: <CACtV=deJ2Sfq1q0r=MYvFOyh9B0UHkRTTnCYPW4yxMVfGLJyeA@mail.gmail.com>
 <20200303155712.GA14081@strlen.de>
 <CACtV=dd_TJNKLiExGvNWGPkMrSEZ4zyL=J5GGbx_9k7vFMzKxA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACtV=dd_TJNKLiExGvNWGPkMrSEZ4zyL=J5GGbx_9k7vFMzKxA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Verachten Bruno <gounthar@gmail.com>
Cc: netfilter@vger.kernel.org

Verachten Bruno <gounthar@gmail.com> wrote:
> > given all counters are 0 i would guess you use an older kernel
> > where nft nat and iptables nat cannot coexist.
> >
> > I suspect you need to unload iptable_nat module.
> Thanks for the tip.
> As for the kernel, I have:
> Linux orangepizero 5.4.20-sunxi #20.02.1 SMP Mon Feb 17 02:09:41 CET
> 2020 armv7l GNU/Linux

This kernel is recent so iptables_nat isn't source of your problem.
