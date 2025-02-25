Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0D1A8F6E
	for <netfilter@vger.kernel.org>; Tue, 25 Feb 2025 23:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740527258; cv=none; b=baGI2LLcU7SwwW8teoe7DPjqry2OJkl8WqP4RUxRVJJAzKy9fFj7kq23LJZpMANcYThw5QKYRnuiIy1zvurPMa2kbhj1J3CuSiVql1MoWE5CFxu7bAKtnIK0AL20wtco57uQawvwTBMssBwrAgEYMoE5p1yJgna3SYYWYGdiXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740527258; c=relaxed/simple;
	bh=KP0FKQ+Csffh5wADnkqdsEMt8ff1EadCCggQU61F+WA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf4h4I+Fxa7AXeoIVNRNZ7RoE3sQOllGXlhBqbHHKgQzT7e2B8uRI9mm/GCEdMeW/MjneU/yyt9TdB1Dnq6qbEaM7YltQ2sDRA6Tk2MQryd7VyZjidrCeFRUxSxbDtLwK8ssYRtR8KYH/UjDhi68krPI7nbF7XRb93A9uzjfxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=MxEXfPH+; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=CxSpW8ko; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="MxEXfPH+";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="CxSpW8ko"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 9E00860292; Wed, 26 Feb 2025 00:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1740527253;
	bh=eNZi8ngSFYBapVM7jpr+CVMzKdIAZmZrym9qh0a582w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxEXfPH+oEsApX/5gxeHPgwgENkYyVfmp1d8a+3GauF/nbvlzqpS1qJNI2NXIvyVl
	 pw46ND0JvRmdXtPtGrbBTNNJ4Psj+f9XE2c/Vs8RLIdNYPxLCqb38fhhAUYQ3aSB78
	 TaRDh6xan1V6QYKo38a228UfXkfcJBTnYTO1209KXzzS88fJwlUigpuo49pcJ1qt8U
	 vq7G+R3yYiAvCxyupx575iWQ2lh0cf+Sc7fl4nTUnn5JP149KitDx976WHAocU6cvv
	 Qtbs1bsrzs4VlqtZyvvCWq8/eebZAj5L/ZqUvk+QinylNOfMbSh4ZKmkzkx2Jm0Se6
	 920oqVNutuJjQ==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id C46A360292;
	Wed, 26 Feb 2025 00:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1740527252;
	bh=eNZi8ngSFYBapVM7jpr+CVMzKdIAZmZrym9qh0a582w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxSpW8koocOJ4D+b0Qes31zYlYcRLvZ3K7EMB0rudKgzXeBLWY9kmBW7cVxLsMd2s
	 5OJ2e4sOnX5EELQquypVHk2QF7c9nyXiBKLhovp3+xuJQFMVzjXbvCMG5fFi8ee4US
	 IPlaLGayMKAmQtKfCKOHQC2HP0yE/hvnf/bwnJ8Ing2US2XvV8g3Do/fniLmiTdgtv
	 /FWggOcsO9dSInIhniFa3fLDDaYc7iZkvwIcDkIY5pvsXw726wkxK3UDhvyLz4X6FU
	 HwMIuYZ6rZ6jvj47J4nAogZrNOouJi5Y3dEA7I2jdhwDYpRdcRGMs2O2jMtEdrsWFD
	 QgIEdeH5uvyUg==
Date: Wed, 26 Feb 2025 00:47:30 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Victor Julien <lists@inliniac.net>
Cc: netfilter@vger.kernel.org
Subject: Re: named counters vs flush ruleset
Message-ID: <Z75WkjyCSmptettz@calendula>
References: <5f970dae-b21b-4837-9e96-955bedbdf69f@inliniac.net>
 <Z6fRedYWO14e0l7e@calendula>
 <d33b9a31-2e67-4983-b1e2-549647256b3d@inliniac.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d33b9a31-2e67-4983-b1e2-549647256b3d@inliniac.net>

Hi Victor,

On Sun, Feb 09, 2025 at 11:58:56AM +0100, Victor Julien wrote:
> On 08-02-2025 22:49, Pablo Neira Ayuso wrote:
> > On Sat, Feb 08, 2025 at 03:35:27PM +0100, Victor Julien wrote:
> > > Hi all,
> > > 
> > > I'm working on finally supporting nftables in Vuurmuur.
> > > 
> > > In the iptables support, I have special rules per interface to get per iface
> > > packets and bytes. Essentially my tool reads the iptables -vnL output and
> > > parses all the things. When a user applies a ruleset change, Vuurmuur reads
> > > the most current values, constructs a new input file to `iptables-restore`
> > > and loads the rules. This works but is tedious, and also lacks some
> > > precision as we are not counting the packets/bytes while Vuurmuur is
> > > working.
> > > 
> > > In the nftables support, I'm more or less looking at the same logic. The
> > > ruleset is build as a .nft file that is loaded with `nft -f`.
> > > 
> > > Now I found the the named counter feature, and also the json output `nft -j
> > > list counters`. This combination seems perfect.
> > > 
> > > I guess my main question is if we can make these counters persistent
> > > somehow. As part of the ruleset reload, I issue a `flush ruleset`, which
> > > also removes the counters.
> > > 
> > > So can we make counters survive a `flush ruleset`, or is there a better way
> > > to load a new ruleset?
> > 
> > Would it work for you to destroy all other existing objects (not the
> > table and counters) instead?
> 
> Thanks Pablo. Here's what I'm thinking now:
> 
> I create an additional table "vrmr_accounting"
> 
> table ip vrmr_accounting {
>         counter vrmr_enp1s0 {
>                 packets 17546 bytes 3901328
>         }
> 
>         chain INPUT {
>                 type filter hook input priority -100; policy accept;
>                 iifname "enp1s0" counter name "vrmr_enp1s0" comment
> "lan-nic"
>         }
> 
>         chain OUTPUT {
>                 type filter hook output priority dstnat; policy accept;
>                 oifname "enp1s0" counter name "vrmr_enp1s0"
>         }
> 
>         chain FORWARD {
>                 type filter hook forward priority -100; policy accept;
>                 iifname "enp1s0" counter name "vrmr_enp1s0"
>                 oifname "enp1s0" counter name "vrmr_enp1s0"
>         }
> }
> 
> Then I create regular a regular filter table, where the normal rules are
> created. My assumption is that due to the lower priority value the
> `vrmr_accounting` table goes first in the processing.

I see, you are using a table that contains rules for metering only.

> In my reload instead of a `flush ruleset`, I do:
> 
> # clear existing tables/rules
> destroy table ip filter
> ...
> add table ip filter
> add chain ip filter INPUT { type filter hook input priority 0; policy drop;
> }
> add chain ip filter OUTPUT { type filter hook output priority 0; policy
> drop; }
> add chain ip filter FORWARD { type filter hook forward priority 0; policy
> drop; }

Maybe you could use?

  flush table ip filter

to leave the table and chain in place. Similar semantics to
iptables -F.

> ...
> # clear accounting chains (incl rules), but not the counter itself
> add table ip vrmr_accounting
> destroy chain ip vrmr_accounting INPUT
> destroy chain ip vrmr_accounting OUTPUT
> destroy chain ip vrmr_accounting FORWARD
> add chain ip vrmr_accounting INPUT { type filter hook input priority -100;
> policy accept; }
> add chain ip vrmr_accounting OUTPUT { type filter hook output priority -100;
> policy accept; }
> add chain ip vrmr_accounting FORWARD { type filter hook forward priority
> -100; policy accept; }
> ...
> add counter ip vrmr_accounting vrmr_enp1s0
> add rule ip vrmr_accounting INPUT iifname "enp1s0" counter name vrmr_enp1s0
> comment lan-nic
> ...
> 
> This appears to leave the counters intact.
> 
> Does this make sense to you?

I wonder if you could consolidate all in one single table:

  flush table ip filter

leaves table, chain and counters intact.
