Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF71C8604
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741030539; cv=none; b=gRHGaUX+0zFIae7jYaD7gJJij7RzjtgXt7gTNmvJK7Maxu13GRrAwy9TtYFKHPjgLS5fR2MhD4J3N23kosTztzLYZc8l9Lf48/Y32/OtLGwrxIj/MW+YuOTW1nN1puzHK7Bi1VlB3MdV8RepaeH4+SVuFq5XHWp99VJ97D/8tNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741030539; c=relaxed/simple;
	bh=21kk8I5YoOON3FtQEKDffoUg6w5t64LPsoq5GP1nYrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVPsBHtk9ouw7q/hovX4GeliIKJyiqXk+jfKywH24Y5FehxfwGDatSTcQUvB0qFPq34gbs/RGLaL9DPjXk/PTLoZp7WafmCJuYQ0IOdruHkubeHaLpiWFJU1/6/c/iUQB7IWsk9G9Ob3GA0yDMPF+P5mQDEYa2V7i2Baa1XsFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tpBZd-0004T0-83; Mon, 03 Mar 2025 20:35:33 +0100
Date: Mon, 3 Mar 2025 20:35:33 +0100
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250303193533.GA16225@breakpoint.cc>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> i want to log ARP headers, thus i create arp family table
> with one chain with only one rule, somethong as:
> 
>     arp operation request limit ... countef log group 2 prefix ...
> 
> It basically works, counter grows and packets are logged
> via ulogd2 stack::
> 
>     stack=log2a:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HWHDR,gp1:GPRINT
> 
> Except that the log entries has not any ARP headers.
> 
> Then i found this article [1], which mentions the ARP as
> sysctlt key:
> 
>     net.netfilter.nf_log.3

This is only required for logging that is triggered
internally, e.g. for nf_conntrack.log_Invalid.

Its not needed when using LOG or NFLOG targets or
the nftables equivalents, when rule gets triggered
its crytal clear which backend should be used.

> Thus i set it to "nfnetlink_log", but that doesn't help. It
> is hard to find what these numbers are, but i guess that
> family constants, as 2, 7 and 10 (from ulogd2 start log)
> coresponds to inet, inet6 and bridge family, but i am not
> aware of arp family...
> 
> I guess that ulogd2 is able to log ARP headers as i found
> them in BASE plugin's info output, but please what i have
> to do to get them into log? Or problem is, that i play with
> it inside LXC container (other logging works in it)?

I think this is missing support in ulogd2.

Untested, to give you some starting point:
(3 is NFPROTO_ARP).

--- a/filter/raw2packet/ulogd_raw2packet_BASE.c
+++ b/filter/raw2packet/ulogd_raw2packet_BASE.c
@@ -959,6 +959,8 @@ static int _interp_pkt(struct ulogd_pluginstance *pi)
                return _interp_ipv6hdr(pi, len);
        case AF_BRIDGE:
                return _interp_bridge(pi, len);
+       case 3:
+               return _interp_arp(pi, len);
        }
        return ULOGD_IRET_OK;
 }

