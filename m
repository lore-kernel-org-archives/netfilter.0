Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F236AB55
	for <netfilter@vger.kernel.org>; Mon, 23 Feb 2026 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873793; cv=none; b=GiSHC+OjZEuvvf3EuI5BCxkPtvS+Y30DFe3Ao6bnawI2LtGKDerJkVlCEoW1dITiN80hkPc52BFhM1r4jR33JcVUh1B8rXk7YXcp9jwOkLOoN4bLbtMOiXdqV2rsuNdmFj9hRubh5Nb3nfcpTZiy9Eq2XGQ2Fc/DSH+t/gAZklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873793; c=relaxed/simple;
	bh=wWAp9j5YPgmB+BKOCBwlYRyjWAsBIVnaVrh2Fh3EuEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqeCiZ+sc3N07rh7yYVFiW97jUhL1cVZHRr3JlpdXopiBwOyL4d/cye8xj+lGAYNtOqmdQQ4/tTLxVRzyis20e4HSw2ToCVgYaJoE9A+xGi2yHMnnNMokQTc+BYXBgn/adDmMD5UFXhcIAyt4xd7mmf5KNxtE8w8V8h3GARHQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=YwaUiMH2; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="YwaUiMH2"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id D153A6017E;
	Mon, 23 Feb 2026 20:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1771873782;
	bh=UGd6ae+fbC92VodUjP06u+lKpQzggCQk31cGXNaycrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwaUiMH2l+5muUQL2k2Chasi1JZbRcnPWbdo4bMPe3rpFhlsRTuLNFTY5vIGJKpMv
	 mFASHQkuOzIi2bZhbqyRaIs/p4H5W6u35zx5UGD1XAcZ9jhOgE/T4Lb6tKaX6T6fqm
	 fEOtVCe3wlhLuwEOVNGeq1Fv83OkOGhSqUSt3YE7Gq4VSfEJssikmjb9scZnPKtsJ6
	 9b9GI/0tzXVU1cIh3f3PmBLjlux0z3cWqoDTSZyX36hI61dYpA6lKHkjc7p1NYcErF
	 YvK93U5qgsyHqQcvjh7MZew7luOdYbELX2uc53UpX3OzS5AI5h2MQXb8iHs/PK+311
	 X3DG/ROODd3ZA==
Date: Mon, 23 Feb 2026 20:09:40 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Michal Soltys <msoltyspl@yandex.pl>
Cc: netfilter@vger.kernel.org
Subject: Re: [BUG] "ether type ip" forgotten/implied when listing rules for
 'netdev' family
Message-ID: <aZyl9JUreTr9Bw39@chamomile>
References: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>

Hi,

Would you file a bug to netfilter's bugzilla so it is possible to
follow track of this issue?

Thanks.

On Mon, Feb 23, 2026 at 03:57:28PM +0100, Michal Soltys wrote:
> Hi,
> 
> While testing the behavior of early filtering in netdev / ingress, I noticed
> something that possibly looks like a bug.
> 
> Consider following and interface with one vlan, e.g.
> 
> ip add add 10.0.0.1/24 dev eno1
> ip li add li eno1 name v250 type vlan id 250
> ip add add 10.10.10.1/24 dev v250
> ip li set eno1 up
> ip li set v250 up
> 
> 
> Now consider following simple nft setup:
> 
> nft add table netdev efil
> nft add chain netdev efil edev { hook ingress type filter device eno1
> priority filter; }
> nft add rule netdev efil edev ether type ip icmp type echo-request counter
> nft add rule netdev efil edev ether type vlan icmp type echo-request counter
> nft add rule netdev efil edev icmp type echo-request counter
> 
> These will be listed by nft ruleset list as such:
> table netdev efil {
>         chain edev {
>                 type filter hook ingress device "eno1" priority filter;
> policy accept;
>                 icmp type echo-request counter packets 0 bytes 0
>                 ether type 8021q icmp type echo-request counter packets 0
> bytes 0
>                 icmp type echo-request counter packets 0 bytes 0
>         }
> }
> 
> Note that the first rule omits the "ether type ip" as if it was 'ip' family
> instead of 'netdev'. So the 1st and the 3rd are listed the same - but they
> work differently.
> 
> The first rule will only count plain ip payload, the 2nd rule will count
> only vlan payload, the 3rd will count both. So after 1 ping to 10.10.10.1
> and 1 ping to 10.0.0.1, the effect would be:
> 
> table netdev efil {
>         chain edev {
>                 type filter hook ingress device "eno1" priority filter;
> policy accept;
>                 icmp type echo-request counter packets 1 bytes 84
>                 ether type 8021q icmp type echo-request counter packets 1
> bytes 84
>                 icmp type echo-request counter packets 2 bytes 168
>         }
> }
> 
> Furthermore it seems it's impossible to return to such ruleset via:
> 
> - nft list ruleset >rules
> - flush tables
> - nft -f rules
> 
> As this time the 1st and the 3rd rule actually will be identical both
> visually and functionally, omitting 'ether type ip' check completely.
> 
