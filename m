Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CE29ACDD
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583428; cv=none; b=iFBUE24maDhzBjoG4/GQmRN6O2aRD1TKiUSo68hzPZgLmi5pqyzqLVBYUz299qC3cHuX/oUJYiA1XsNOopwJInIibR6sfbZ3bWGsPJkCjdDGHVXgA+dowTUzq9932KA4+KDlSXsYsl8JuT5SRPn29z8nkhAy04CFq7xOEn3MNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583428; c=relaxed/simple;
	bh=mjgYiNtUiy92r4AOiGj8XW5lGVEcr7KPh/LB15Hy4Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+a60wNpxpJFUNXhy5+DkTKlauXonTkHzAP1tj/lazwbbdKV/lJlPrazivAseDSrLW9L9VEeAE13zZmtH7QlXvFkcuFLphrP2JsuMw4WTQig58vg6CG6apTfLOfLdoEdwy2Ri6q4NH39UHT81NCS6V1oIZkEjOzDZeg17hRb3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=m0YS3fZy; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="m0YS3fZy"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 3DE49600B5;
	Wed,  4 Mar 2026 01:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1772583425;
	bh=gyZ/eYiB7dTohVz9OA5RUMmGIvhtDNaHHdluuAf9WDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0YS3fZy+3VUb0RCbKfbAr3IpLnoGP/W0ZR2iH9JFLsxtIJwPlsh5eMWvj0dUxOZB
	 ML9M/TnI7ZbAtmembod27Fm1r033o3A/cGdDI/JBEkC9TxjFXpCb+GeToW5ojtOnIU
	 Q8YeJTJzNY3vtMdikadgfmN1ve8ZD7PW60efHdUJAf8ZogShKZlGQjtAlnddlCSask
	 dPT2UK2iGhucuzggac7YNbuNOUCtG6/LoQpk7/Vhq/LSbDicIvLG/rHYcBXTD1IU+d
	 n/LA5zW8ko3suHijopSP/2IE0H5O/pM0ImhfFOOzk+2kYIrZueq5l9az3OKeVE40W1
	 HLGFlSa+pV3Lg==
Date: Wed, 4 Mar 2026 01:17:02 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: netfilter@vger.kernel.org
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer
 space available
Message-ID: <aad5_mnW4D4JR8ZQ@chamomile>
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aad2hjmYS6Bcc3xz@chamomile>

On Wed, Mar 04, 2026 at 01:02:14AM +0100, Pablo Neira Ayuso wrote:
> Hi,
> 
> On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
> > Hi all,
> > 
> > Firstly, please CC me in replies as I'm not subscribed to the list.
> > 
> > I am currently loading some named sets into nftables using the following
> > configuration:
> > 
> > set au-ipv4 {
> >         type ipv4_addr
> >         flags interval
> >         auto-merge
> >         elements = { $AU.ipv4 }
> > }
> > 
> > set au-ipv6 {
> >         type ipv6_addr
> >         flags interval
> >         auto-merge
> >         elements = { $AU.ipv6 }
> > }
> > 
> > These sets are loaded in the config via:
> > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
> > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
> > 
> > The files are created using the geo-nft.sh script here:
> > https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
> > 
> > When loading these, I get the following fatal error:
> > netlink: Error: Could not process rule: No buffer space available

Just to be sure and discard something simple.

Maybe you made a mistake in your ruleset in the aarch64 box? With lots
of errors coming from the kernel, older userspace nftables versions
report ENOBUFS.

Try loading AU.ipv4 and AU.ipv6 with only one element to see if
userspace reports a different error.

commit 47e9aaf0227daf16f43a7442e1dceae8851817a5
Author: Pablo Neira Ayuso <pablo@netfilter.org>
Date:   Tue Aug 26 10:09:13 2025 +0200
 
    mnl: continue on ENOBUFS errors when processing batch
    
    A user reports that:
    
      nft -f ruleset.nft
    
    fails with:
    
      netlink: Error: Could not process rule: No buffer space available
    
    This was triggered by:
    
    table ip6 fule {
      set domestic_ip6 {
        type ipv6_addr
        flags dynamic,interval
        elements = $domestic_ip6
      }
      chain prerouting {
        type filter hook prerouting priority 0;
        ip6 daddr @domestic_ip6 counter
      }
    }
    
    where $domestic_ip6 contains a large number of IPv6 addresses.
    
    This set declaration is not supported currently, because dynamic sets
    with intervals are not supported, then every IPv6 address that is added
    triggers an error, overruning the userspace socket buffer with lots of
    NLMSG_ERROR messages (or too big NLMSG_ERROR message to fit into the
    socket buffer)

> > This only seems to happen on the aarch64 installs. The same kernel version +
> > tools version on x86_64 architecture seems to load just fine.
> > 
> > $ cat /proc/version
> > Linux version 6.18.15-200.fc43.aarch64
> > (mockbuild@835a9c7eeabc46d3b99996c22f20c9cf) (gcc (GCC) 15.2.1 20260123 (Red
> > Hat 15.2.1-7), GNU ld version 2.45.1-4.fc43) #1 SMP PREEMPT_DYNAMIC Fri Feb
> > 27 22:55:30 UTC 2026
> > 
> > $ nft --version
> > nftables v1.1.3 (Commodore Bullmoose #4)
> 
> Can you try latest nftables version to confirm this bug on aarch64 is
> current? Otherwise, try nftables git HEAD snapshot?
> 
> > I've had no success in hunting for why this would be the case.
> > 
> > I've found that I can batch-load the sets in ~500 rules at a time, and the
> > entire set will load - but including them at the nftables service level
> > always fails.
> > 
> > How should I fix this?
> > 
> > -- 
> > Steven Haigh
> > 
> > 📧 netwiz@crc.id.au
> > 💻 https://crc.id.au
> > 
> > 
> > 
> 
