Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A31DF985
	for <netfilter@vger.kernel.org>; Mon,  4 Aug 2025 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754295949; cv=none; b=tM+m1q+PG7q8WT6SHctxRPDd87FLd0A6tpjkHf6JIoSJ0x/1Ijas8LYWFkGTJsRJH3CjLHgep5XG/Us8SvLfrM3exe52ZsjGBfReKMXKrVgbkOvg4JDGGM+8fZnKXwaJCPSsrSjQQ17u5uJq3HdBP4WglG5TfI29RHB5tXz3sC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754295949; c=relaxed/simple;
	bh=Y0PKgOHB6rEk1diKX60yWfxZiAPuKTfLGkYYfg36lBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlnBjzRu1VRG+r5ibrX5jI84VYU3RSBFkBEqezXgcc8DSUQc64OmMHFYwBip/sptPZxzR/2u2bf/A4XT79r74Fs+tj9Od+fffoFkpmbMo0VWYGsKjpxIPSR436P5k2dPY9C0YJlTYYweZ7Z7a+rIRy7YIZhIEo0Oit2L+uwcTzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 232F760532; Mon,  4 Aug 2025 10:25:38 +0200 (CEST)
Date: Mon, 4 Aug 2025 10:25:37 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Query on nftables DNAT for localhost-to-localhost traffic in
 IPv6 or without route_localnet
Message-ID: <aJBugbUKvPaiZ_PD@strlen.de>
References: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tbrKeaQCAnKHbJoWNcgTthvmAEPEOcvux_W8eztR5QT1Q@mail.gmail.com>

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> We (kubernetes) are currently exploring options for port forwarding
> traffic that originates from localhost and is also destined for
> localhost, to redirect it to a different destination IP address and
> port [1].

Don't think its a good idea, has much higher risk of exposing
credentials.  Maybe fixable by placing macsec or ipsec tunnel.

> We can use the route_localnet sysctl parameter, however, that does not
> work for IPv6.

Seems no kernel changes are needed, but its ugly because daddr ::1 has
to be concealed in prerouting to prevent RT6_LOOKUP_F_IFACE flag:

        if (rt6_need_strict(&fl6->daddr) && dev->type != ARPHRD_PIMREG)
                flags |= RT6_LOOKUP_F_IFACE;

... in ip6_route_input_lookup().  This seems to do the trick:

define fakein6 = dead::1ce
table inet test {
        chain nat_pr {
                type nat hook postrouting priority srcnat ; policy accept;
                ct status dnat ct original ip6 saddr ::1 masquerade
        }

        chain nat_out {
                type nat hook output priority dstnat ; policy accept;
                ip6 daddr ::1 tcp dport 12345 dnat to [dead:beef:0:227:300::3]:22
        }

        chain pre {
                type filter hook prerouting priority 0 ; policy accept;
                ct status dnat,snat ct original ip6 saddr ::1 ct original ip6 daddr ::1 ip6 daddr set $fakein6 comment "daddr is ::1 but that forces strict route lookup"
        }

        chain in {
                type filter hook input priority 0 ; policy accept;
                ct status dnat,snat ct original ip6 saddr ::1 ct original ip6 daddr ::1 ip6 daddr set ::1 comment " get rid if fakein6"
        }
}

$ ip -6 addr show dev lo
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    inet6 dead::1ce/128 scope global
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever

$ uname -sr ; ssh -p 12345 ::1 uname -sr
Linux 6.15.8-200.fc42.x86_64
Linux 6.1.0-37-amd64
