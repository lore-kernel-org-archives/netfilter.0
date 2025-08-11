Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C21FAC34
	for <netfilter@vger.kernel.org>; Mon, 11 Aug 2025 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754942911; cv=none; b=OGLIW5LkukpV0wHmM+Ody9iElVuFr49xtG53Sv146XodX38/E2STHJnPThGIU/ByNKocluhAPuXGBcJ3XWaN97FlUhPD21jBYgJ8n0I9L6dI4pp1Q8H5Efn33nIc4vlY/olakvtHu75ET8bW/cAD8khS4PVTS4nljr6zmK1enVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754942911; c=relaxed/simple;
	bh=oA+7WtTNZOtg6a6I1fJeUDOqDALwHxuHZHXRav0HH/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9O0YnLXAcDz16kOw2AsQCZrg7yBAV+UwlksH80yXUDhrBAfkF1MWEpTJ+DHgL41+esNyIQuYGzJVqgRh/iZZF3Zfx+jg1iDQFI6NUDJ3JrkCubzmsWcMECerlnPQInGJpq/r6t8XEp+YKzG8/DEGLrgaBytH/AXT05ATcyjUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=TqNVoE6e; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=njdZmd8M; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="TqNVoE6e";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="njdZmd8M"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 2C084606EE; Mon, 11 Aug 2025 22:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1754942906;
	bh=wkXPhewfgMhFU+uniCaAdkwR39wCH8IxuP27HqtqtuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqNVoE6ePv9mlbzvgUUF6/o8JZiwD3eLYLAW2LpRAFTxphHan96Q0HIOal30T7rMS
	 xwWIoolWHBsYSNaCEKfnl75ONatHGi3/G7Qigu2zPysBBgf1gYge0agZvt/7XczUJj
	 K/s8NLCwiNLLNRdR2sePd/wtUDHMFS+8H1THpJq3hBra+JvR87iUNomD5QhctuRBNk
	 u6wmrpp/Z0V70tHi26LjspACILTs4LsbWxGcWFceX2MoDLYqBB5ncFwH83F2GkX/Eq
	 RRSkZdDKNtJb9FrJtzmFpdij4pBU4qanZZGNxQNu7/TvcFziy1ep+6u9KPuazxH5Me
	 IZgF8ViMzqJog==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 2F440606EA;
	Mon, 11 Aug 2025 22:08:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1754942905;
	bh=wkXPhewfgMhFU+uniCaAdkwR39wCH8IxuP27HqtqtuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=njdZmd8MD9nMTj8jUzWrfAaIr++3vpLZXevSEYDCEp5/e7Cg1czEiKZ0odqey+NFg
	 XC4OUCASit20n/MVC3UM4b7Wml+n8XLXOrfqAQubDcbXEXCLXf2h/jiYT4jMn3+IyS
	 85boy1pnAyGvbK+9fOPs8bo9syZqvVxGDKijvXhUrLmdDDWj9+KtZKNqkkAEZ2TcN8
	 9UlFXiZsjiazRu+RFwpiUhfhn0ytzynZhArQ9F2XPQZAtulnrLYOQHlOiRqD7+DxcD
	 LTn/WxEctf25b4Z5tsMAsoztR5foHCQzcoW3bTfOvcz/dAHUQSzxbyJ+RIYjKZAhtg
	 bAwU4k4lmGnAA==
Date: Mon, 11 Aug 2025 22:08:22 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Florian Westphal <fw@strlen.de>
Cc: Antonio Ojea <antonio.ojea.garcia@gmail.com>, netfilter@vger.kernel.org
Subject: Re: Query on nftables DNAT for localhost-to-localhost traffic in
 IPv6 or without route_localnet
Message-ID: <aJpNme8xRUbhNs4P@calendula>
References: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>
 <aJBugbUKvPaiZ_PD@strlen.de>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJBugbUKvPaiZ_PD@strlen.de>

Hi Florian,

On Mon, Aug 04, 2025 at 10:25:37AM +0200, Florian Westphal wrote:
> Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> > We (kubernetes) are currently exploring options for port forwarding
> > traffic that originates from localhost and is also destined for
> > localhost, to redirect it to a different destination IP address and
> > port [1].
> 
> Don't think its a good idea, has much higher risk of exposing
> credentials.  Maybe fixable by placing macsec or ipsec tunnel.
> 
> > We can use the route_localnet sysctl parameter, however, that does not
> > work for IPv6.
> 
> Seems no kernel changes are needed, but its ugly because daddr ::1 has
> to be concealed in prerouting to prevent RT6_LOOKUP_F_IFACE flag:
> 
>         if (rt6_need_strict(&fl6->daddr) && dev->type != ARPHRD_PIMREG)
>                 flags |= RT6_LOOKUP_F_IFACE;
>
> ... in ip6_route_input_lookup().

>This seems to do the trick:

To simplify this example below, would it be possible to extend nft_fib
to attach DST_METADATA in prerouting to modify the ip6_route_input_lookup()
behaviour? This is similar to the conntrack template, but for routing.

> define fakein6 = dead::1ce
> table inet test {
>         chain nat_pr {
>                 type nat hook postrouting priority srcnat ; policy accept;
>                 ct status dnat ct original ip6 saddr ::1 masquerade
>         }
> 
>         chain nat_out {
>                 type nat hook output priority dstnat ; policy accept;
>                 ip6 daddr ::1 tcp dport 12345 dnat to [dead:beef:0:227:300::3]:22
>         }
> 
>         chain pre {
>                 type filter hook prerouting priority 0 ; policy accept;
>                 ct status dnat,snat ct original ip6 saddr ::1 ct original ip6 daddr ::1 ip6 daddr set $fakein6 comment "daddr is ::1 but that forces strict route lookup"
>         }
> 
>         chain in {
>                 type filter hook input priority 0 ; policy accept;
>                 ct status dnat,snat ct original ip6 saddr ::1 ct original ip6 daddr ::1 ip6 daddr set ::1 comment " get rid if fakein6"
>         }
> }
> 
> $ ip -6 addr show dev lo
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
>     inet6 dead::1ce/128 scope global
>        valid_lft forever preferred_lft forever
>     inet6 ::1/128 scope host noprefixroute
>        valid_lft forever preferred_lft forever
> 
> $ uname -sr ; ssh -p 12345 ::1 uname -sr
> Linux 6.15.8-200.fc42.x86_64
> Linux 6.1.0-37-amd64
> 
