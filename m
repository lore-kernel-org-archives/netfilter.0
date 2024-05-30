Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384426F2F3
	for <netfilter@vger.kernel.org>; Thu, 30 May 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717074609; cv=none; b=ngzFJEP8Fd0iXtRAGVLZnu0tbRx8kaNibtxKqbfG6m5HgK1uB4XXeLFwgnk0+1DKJtsRpgifr/BheKwPdEMom6ZUS7VvshoON0Bqws9hpDpeFvHgutreMXQcFBDthBoODBzWcQMFf8XZYOnGID//XyP+/ENiDByeTe5FpJz1kD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717074609; c=relaxed/simple;
	bh=nny/XSHbvDpsYd/hf7HoBvip2XfBGf5bO5lAweU34+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPaCljYsksfexIdqx9zXeCoqNFpC0b/D7bzx/394PsSo4Mc9XRWMYN5fP42pH2PK0YqOOg6VKPTzUcsj2HQXKfkKxcgVzcgBZuXVZUB4V/1WuDouZTQN7T6YHwq8Ixf+/1+NbOr+4x/0+NWlnJiuxkXXnRsrJWK/B/uXcLK83+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sCfXe-00029U-FV; Thu, 30 May 2024 15:10:02 +0200
Date: Thu, 30 May 2024 15:10:02 +0200
From: Florian Westphal <fw@strlen.de>
To: netfilter@e-posta.sk
Cc: netfilter@vger.kernel.org
Subject: Re: ebtables rule rewriten to nft 'set host' does not work
Message-ID: <20240530131002.GA2041@breakpoint.cc>
References: <b1c34f18-f564-4eda-a4ce-1af086d5a8aa@e-posta.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1c34f18-f564-4eda-a4ce-1af086d5a8aa@e-posta.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)

netfilter@e-posta.sk <netfilter@e-posta.sk> wrote:
> I guys I got kind of Man-In-Middle setup, where ubuntu based box is
> correcting coordinates transferred thru wire.
> 
> This is old setup coming from age of iptables and ebtables. I tried to move
> to nft command-line, but with no success. ebtables command works, but nft
> does not. Note: box is running nftables with iptable and ebtable interface.
> 
> When I convert ebtables command into nft rule, this rule never get hit,
> while its ebtables equivalent does.
> 
> nft version
> 
> # nft -V
> nftables v1.0.2 (Lester Gooch)
>   cli:          editline
>   json:         yes
>   minigmp:      no
>   libxtables:   yes
> 
> 
> script setting nft ruleset via nft and ebtables
> 
> #!/bin/bash
> IP=*IP*
> PORT=*PORT*
> 
> nft flush ruleset
> nft -f - <<NFT
> table bridge nat {
>         chain PREROUTING {
>                 type filter hook prerouting priority dstnat; policy accept;
>                 meta ibrname "*DEV*"  ip daddr ${IP}  ether type ip  tcp
> dport ${PORT}  meta pkttype set host
>         }
> }
> ....
> NFT
> # this rule does not work in NFT (yet?)
> ebtables -t nat -A PREROUTING --logical-in *DEV*-p ipv4 --ip-protocol tcp
> --ip-dst $IP --ip-dport $PORT -j redirect --redirect-target ACCEPT

-j redirect mangles ethernet destination address to that of bridge
device.

See this example from nft(8):

 # assumes 00:11:22:33:44:55 is local MAC address.
 bridge input meta iif eth0 ip saddr 192.168.0.0/16 tcp dport \
   80 meta pkttype set unicast ether daddr set 00:11:22:33:44:55
