From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Applying Nat rules during traffic
Date: Wed, 20 Jun 2012 17:24:12 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206201721110.1125@frira.zrqbmnf.qr>
References: <CACJKonqQND2VnPgsiE5=FTJp6qkjKjTZKVvfMAvTVThsjo=vPA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACJKonqQND2VnPgsiE5=FTJp6qkjKjTZKVvfMAvTVThsjo=vPA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sreejith menon <sreejithjmenon@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-06-20 17:05, sreejith menon wrote:

>I have enabled IP masquerading on an outgoing interface using the below 
>command
>
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE.
>
>But it doesnt seem to take effect if the traffic was ongoing. As soon 
>as i stop and start traffic the rule is effective. Is it implemented 
>this way or do i need to apply xtables add on patch to fix this issue? 
>Currently i am doing a conntrack -F to avoid this issue. But i would 
>like to have a permanent fix. Any ideas?

It's not a bug. The connection tracking table is independent from the 
ruleset by design. There is not much point in (automatically) changing 
the NAT tuples while a TCP connection is open anyway - since it would 
rupture the connection (and that's what can happen if you force it with 
conntrack -F.)
