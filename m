From: Florian Westphal <fw@strlen.de>
Subject: Re: Is it possible to get a transparent proxy with Redsocks when
 using the new nftables?
Date: Tue, 3 Mar 2020 16:57:12 +0100
Message-ID: <20200303155712.GA14081@strlen.de>
References: <CACtV=deJ2Sfq1q0r=MYvFOyh9B0UHkRTTnCYPW4yxMVfGLJyeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACtV=deJ2Sfq1q0r=MYvFOyh9B0UHkRTTnCYPW4yxMVfGLJyeA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Verachten Bruno <gounthar@gmail.com>
Cc: netfilter@vger.kernel.org

Verachten Bruno <gounthar@gmail.com> wrote:
> I've been using Redsocks for a few months now on a Ubuntu "18.04.3 LTS
> (Bionic Beaver)" machine. This machine has iptables, and not nftables.
> So I have a few rules to redirect 80,443,9048,1935 and so on.
> 
> (buster)", which has nftables. I converted the existing rules thanks
> to
> 
> iptables-save > save.txt
> iptables-restore-translate -f save.txt > ruleset.nft
> nft -f ruleset.nft
> 
> Nothing seems to work, as a git command or anything else is just
> falling in timeout.
> Here is the configuration I get once the rules have been imported:

> table ip filter {
>         chain INPUT {
>                 type filter hook input priority 0; policy accept;
>         }
> 
>         chain FORWARD {
>                 type filter hook forward priority 0; policy accept;
>         }
> 
>         chain OUTPUT {
>                 type filter hook output priority 0; policy accept;
>         }
> }

The above chains are unneded and can be removed.

> table ip nat {
>         chain PREROUTING {
>                 type nat hook prerouting priority -100; policy accept;
>                 meta l4proto tcp tcp dport 443 counter packets 0 bytes
> 0 jump REDSOCKS
>                 meta l4proto tcp tcp dport 1935 counter packets 0
> bytes 0 jump REDSOCKS

meta l4proto tcp tcp dport { 443, 1935 , ... } jump REDSOCKS

>                 ip daddr 240.0.0.0/4 counter packets 0 bytes 0 return

given all counters are 0 i would guess you use an older kernel
where nft nat and iptables nat cannot coexist.

I suspect you need to unload iptable_nat module.

