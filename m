Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF56D1B4
	for <netfilter@vger.kernel.org>; Thu, 18 Jul 2024 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336425; cv=none; b=n/Kz7KORIvYjZDHJ30a8joHZyqPqaLWen3INTPkjqyETUfAXDoQTUSO0wHVynQTtRdgH19m+LrGOM+EOwU6OJT+e9D6JN+2lh/5tjYppBGm1yvnf1B3D3wqZOdNtMsvk/f3IV/VrZQu7K7zwZRwBu16y+hdfZM7bTiN/M82gu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336425; c=relaxed/simple;
	bh=2WK6q34pAGtSAOpHFpMFuH/ibALZzq306avbVe0NH5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gT7G58iR80xPpZQ2hESBbEGeY6FGHPEWNCuduCtg4Om/jbK4HvSB9r9OrSF/m0ZhLfy6qsZMR509tLc9FA/7E4yks5J5RdE29vNgIUdiDpmong0XrtwmWVUkou1nDcq4ola8pB2efATmD8/gn0zwbmK2IzQHGDhYKBGBQrhF/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1sUYEd-0004HZ-35; Thu, 18 Jul 2024 23:00:19 +0200
Date: Thu, 18 Jul 2024 23:00:19 +0200
From: Florian Westphal <fw@strlen.de>
To: pgnd <pgnd@dev-mail.net>
Cc: netfilter@vger.kernel.org
Subject: Re: syntax issues when reducing rules through grouping ?
Message-ID: <20240718210019.GA15052@breakpoint.cc>
References: <374dc2fb-f3e1-4599-a46f-524fd894ee32@dev-mail.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <374dc2fb-f3e1-4599-a46f-524fd894ee32@dev-mail.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

pgnd <pgnd@dev-mail.net> wrote:
> 		table nat {
> 			chain prerouting {
> 				type nat hook prerouting priority -150; policy accept;
> 
> 				# SET1
> 				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 udp dport 53
> 				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 tcp dport 53
> 				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 udp dport 25
> 				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 tcp dport 465
> 
> 				# SET2 (This seem a bit tortured, but it's fewer lines ...)
> 				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 meta l4proto {tcp, udp} th dport 53
> 				meta mark set 0x02 meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 tcp dport { 25, 465 }
> 
> 				# SET3
> 				meta mark set 0x02 {
> 24					meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 meta l4proto {tcp, udp} th dport 53
> 25					meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR2 tcp dport { 25, 465 }
> 26				}
> 27
> 28			}
> 29		}
> 
> 
> rule group "SETs" 1, 2 & 3 are _intended_ to be functionally equivalent, but simply increasingly "grouped" for convenience/readability (yes, arguable!)
> 
> testing, SET1 & SET2 seem OK, but SET3 is clearly unhappy,
> 
> 	nft -c -f tmp.nft
> 		tmp.nft:24:4-7: Error: syntax error, unexpected meta
> 		                        meta iifname "$VPN" meta oifname "$LAN" ip daddr $SVR1 meta l4proto {tcp, udp} th dport 53
> 		                        ^^^^
> 		tmp.nft:29:1-1: Error: syntax error, unexpected '}'
> 		}
> 		^
> 
> what's specifically DISallowed in my SET3 syntax usage?

Missing 'jump' or 'goto' keyword: meta mark set 2 jump { meta ...
