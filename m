From: Andrew Beverley <andy@andybev.com>
Subject: Re: Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 18:28:38 +0100
Message-ID: <1317317318.26402.271.camel@andybev-desktop>
References: <1317248412.26402.39.camel@andybev-desktop>
	 <1317279076.26402.52.camel@andybev-desktop>
	 <alpine.LNX.2.01.1109291224580.18982@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1317317345;
	bh=jdX1MyUxue+2At2NGtV+Jud6SOUZ4w26w4sNM5RTSCQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=ByhBOTfImM6bGtQi0CxjpH2QmNRP2CE/o8YvqHULNnFhtC8jL1KHPwtv3nBBkJNkZ
	 Xrdwb7HP+EwZi5OwBGT3LQOYk+n2W3rjzh7a1hW50gmNmiiqhwJ2DAAbev7MDJNUfg
	 nxSEPfvzR7RNV5OUMXnwaP6SntSqU4Wk5cspWa+o=
In-Reply-To: <alpine.LNX.2.01.1109291224580.18982@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>

On Thu, 2011-09-29 at 12:28 +0200, Jan Engelhardt wrote:
> On Thursday 2011-09-29 08:51, Andrew Beverley wrote:
> >> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x800
> >> ip rule add fwmark 0x800/0xffff table T2
> >> ip route add table T2 default dev ppp1 via 94.30.127.76
> >
> >I've also added the following, which makes no difference:
> >
> >iptables -t nat -A POSTROUTING -o ppp1 \
> >	-j SNAT --to-source 109.224.134.110
> 
> Of course it makes no difference, because SNAT is applied after routing.
> ("POST" "ROUTING", see?)

Yes, but in my case the SNAT still needed applying. The problem was that
although the packets were being routed via the second interface, they
were still being sent from the original IP address of the first
interface. Therefore, packets were being returned to the first
interface, making it look as if the second interface wasn't being used.

> 
> >So, I assume the problem is that the packet is marked too late to affect
> >the routing.
> >Looking at the packet flow diagram[1] though, there should
> >be a re-route check after the mangle table, which should re-route if a
> >packet's mark has changed. Does this feature need enabling?
> 
> mangle is the right place; in its code you will find
> 
>         ret = ipt_do_table(skb, NF_INET_LOCAL_OUT, NULL, out,
>                            dev_net(out)->ipv4.iptable_mangle);
>         /* Reroute for ANY change. */
>         if (ret != NF_DROP && ret != NF_STOLEN) {
>                 iph = ip_hdr(skb);
>                 if (iph->saddr != saddr ||
>                     iph->daddr != daddr ||
>                     skb->mark != mark ||  
>                     iph->tos != tos)
>                         if (ip_route_me_harder(skb, RTN_UNSPEC))
>                                 ret = NF_DROP;

Thanks, that helps. Useful to know exactly what is going on.

Thanks for all the help.

Andy


