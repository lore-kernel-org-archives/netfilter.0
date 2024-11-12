Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B40213154
	for <netfilter@vger.kernel.org>; Tue, 12 Nov 2024 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435893; cv=none; b=Eld40BAzr2HAWByKK12s3khPWcPhiAOOtBwAT20E/6YCH7/Ru5FWDtMvwqCjNElQZ5OLMfIL+FN4rss8VSYZwpOLU2MKDKNVpBD0sz7bOMeLWp6efRZsvvk9wRU6X+t0SBN7n5j5k9o+sWsFmUrSGFm7lnONQta3f1Yr5fUXAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435893; c=relaxed/simple;
	bh=WqNYn0JKvX7ikSCFbDQdkeJsLJ0gCmtnYyseSc+CfR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iv3vNWrs69JuEgerd5aGKfOlN8+goQquTuJCS+NFSx7q3owf0GiRoaGK4HWgb5ITdt0U7lu+H0uJNRj4c8PSidIyGYmjOT33WUmTkN54hxXvyhRpMMXDqfpM8DB867rF3pmXn3j4OV718arrz2Ql69Q1HjvLgSe3+krR7i1Ct2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=33622 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1tAvZG-009Juf-FI; Tue, 12 Nov 2024 19:24:48 +0100
Date: Tue, 12 Nov 2024 19:24:45 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Thomas =?utf-8?Q?K=C3=B6ller?= <thomas@koeller.dyndns.org>
Cc: netfilter@vger.kernel.org
Subject: Re: connection tracking state in rules
Message-ID: <ZzOdbYay4hhiwqbZ@calendula>
References: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7d037d9-2261-4627-8e46-bd960f1ab6d3@koeller.dyndns.org>
X-Spam-Score: -1.9 (-)

On Tue, Nov 12, 2024 at 06:56:30PM +0100, Thomas Köller wrote:
> Hi,
> 
> tried to create a rule using the conntrack state of a packet:
> 
> [root@sarkovy nftables]# cat ruleset-own.txt
> create table netdev world
> add set netdev world blacklist { type ipv4_addr; flags dynamic,timeout;
> timeout 1h; gc-interval 6h; size 256; }
> create chain netdev world ingress { type filter hook ingress device
> "eth_cable" priority filter; policy drop; }
> add rule netdev world ingress ip protocol tcp ip saddr @blacklist counter
> drop
> add rule netdev world ingress ct state established,related counter accept
> [root@sarkovy nftables]# nft -cf ruleset-own.txt
> ruleset-own.txt:5:31-38: Error: Could not process rule: Protocol error
> add rule netdev world ingress ct state established,related counter accept
>                               ^^^^^^^^
> This is rejected, but why?

Because there is currently no support for connection tracking at
ingress.

> And, btw., which one is correct, 'ct state established,related' or 'ct state
> { established,related }'?

Use of { } implies a set instance.

# nft describe ct state
ct expression, datatype ct_state (conntrack state) (basetype bitmask, integer), 32 bits

pre-defined symbolic constants (in hexadecimal):
        invalid                         0x00000001
        new                             0x00000008
        established                     0x00000002
        related                         0x00000004
        untracked                       0x00000040

Use of:

        ct state established,related

(just like in iptables --m --state) is perfectly fine for this
particular case.
