Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B060326AC5
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713634289; cv=none; b=TZ5zzZSPAZAIitDnaOfN5C+Ng1Ahd82dBObskazssTRxuIBeZzvfKSkBW+AtbT3ht8LMgovqvOcB5ybMv3MDdfl4D1vvcb9YgYsUmo1OvwOp+Xe0ZdB2xBl+2sJvp2FOMJwwZxmzcpp65txOSHikk1Y2uJjy5hU6va94yrFb3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713634289; c=relaxed/simple;
	bh=PGrW7KTSsEczwzfdOeY5OP8tHh9IgoIkwRWcfmDNjT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2kPq6G/HRMZneGdkdReG5ggVVuaE4jV0lKZq5GHAL8H/a+j7MKnM99u0xMnLCZpR8FrG6rP6kR5agS2ONoHXCSVb1rWXRGEi7Xgf8NPOSe1W0rmY0KnM0zjeFupAmUsppfU3MAZH77q/D7teD5E+KLdwPc+lG4humGQJbAybX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1ryEYY-0005mK-LC; Sat, 20 Apr 2024 19:31:18 +0200
Date: Sat, 20 Apr 2024 19:31:18 +0200
From: Florian Westphal <fw@strlen.de>
To: G H <uothrawn@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: Rewrite arp response with nft
Message-ID: <20240420173118.GA21662@breakpoint.cc>
References: <48471547.724608.1713545266678.ref@mail.yahoo.com>
 <48471547.724608.1713545266678@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48471547.724608.1713545266678@mail.yahoo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

G H <uothrawn@yahoo.com> wrote:
>  On early versions of Linux, I could use ebtables to rewrite the ARP packet using the below command. This ensures that the switch would only see MAC address 00:50:56:96:12:5e, not aa:18:f0:55:79:1e.
> 
> ebtables -t nat -I POSTROUTING --logical-out br0 --src aa:18:f0:55:79:1e \
>       -j snat --to-src 00:50:56:96:12:5e --snat-arp --snat-target ACCEPT
>       
> I can get close to recreating this with nftables, but it is missing the functionality provided by the --snat-arp argument.
> 
> table bridge filter {
>     chain POSTROUTING {
>         type filter hook postrouting priority 0; policy accept;
>         ether saddr aa:18:f0:55:79:1e ether saddr set 00:50:56:96:12:5e
>     }
> }
> 
> My outgoing ARP packet has its source MAC address rewritten successfully, but the "is-at" still points to the original MAC address. How do I alter the outbound ARP response to set "is-at" to point to 00:50:56:96:12:5e?

No idea, but you might want to look at the "arp" payload expression.

Maybe:
arp operation reply arp daddr ether set ...

