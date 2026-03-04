Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739462AD10
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584965; cv=none; b=bQEgc298qwcX1HQpdMjW+U5G4A1tM+1CY2hbMXEfTdibZYTXpGZ/EYZR2mZHPp5z6ABjhPlYuW4CBWq5yBzt8SNzksj1eWgsgKekyXJQOuoPX2ariJeFJyMVPSV9kOSFHggd3O8k17Melxcjs04GFDN/gtObGFrdaAi2ZzteUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584965; c=relaxed/simple;
	bh=d3UUgGdv56HnYiQhUcYYTZlSNFsMw8DwX8+AGqa7OYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itzqNxkmwXxJTXY7XbKAlfAcNWlPrbK3gg2RVRwWttDqDTZWUbvNVUzSs+yfA+rOCStP6loK6shCb/CZAN59WoyfWUEWwSt3i/ZCXDeGQmd9PmD0AumhNvVrDYgaBEr54uGvaTTd/cJjv/wLwdDgrW7WloVSQ4vdjbDtgDmHndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=SnHMCijM; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="SnHMCijM"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 3734A60179;
	Wed,  4 Mar 2026 01:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1772584962;
	bh=0AWjUcDTbebM9p8AiNizPAaT5FVL9uNztg9x2vo/K5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SnHMCijMxBrNqe5xJyI3eY9bAb+N95rpF+skQnK0jXDdfshmVArY2NxnaKYEOhkiA
	 cb/vRG978TGkKHetOixhU5TeYAMlR+wVHzeu7APd0iOG76hBwHjiD8LZrDDN9mR2mk
	 WtbccrYZl8KqT1qHYgAu/HUPjIuiDgarRaZkD/8SIoGimcCJGQYbG8MuPVGKzMLfzy
	 0c+hC5T4qikv9NWeouTvHc8AQqfT3mf0C7x8lqR6+tMjnP7T0cfvs3WvpOoHaRroHC
	 T62vJfv+joo//BRGfzHJqOVqglUhEFbEVSfmUrmJRzNgvQ1xtUx0PRM5uwhN8EP/Mf
	 lQwpMxm/kL7fw==
Date: Wed, 4 Mar 2026 01:42:39 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: netfilter@vger.kernel.org
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer
 space available
Message-ID: <aad__3J15t9kzkYd@chamomile>
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile>
 <aad5_mnW4D4JR8ZQ@chamomile>
 <a282917a-107d-4f70-82e5-df9564d5172d@crc.id.au>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a282917a-107d-4f70-82e5-df9564d5172d@crc.id.au>

On Wed, Mar 04, 2026 at 11:34:39AM +1100, Steven Haigh wrote:
> On 4/3/26 11:17, Pablo Neira Ayuso wrote:
> > On Wed, Mar 04, 2026 at 01:02:14AM +0100, Pablo Neira Ayuso wrote:
> > > Hi,
> > > 
> > > On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
> > > > Hi all,
> > > > 
> > > > Firstly, please CC me in replies as I'm not subscribed to the list.
> > > > 
> > > > I am currently loading some named sets into nftables using the following
> > > > configuration:
> > > > 
> > > > set au-ipv4 {
> > > >          type ipv4_addr
> > > >          flags interval
> > > >          auto-merge
> > > >          elements = { $AU.ipv4 }
> > > > }
> > > > 
> > > > set au-ipv6 {
> > > >          type ipv6_addr
> > > >          flags interval
> > > >          auto-merge
> > > >          elements = { $AU.ipv6 }
> > > > }
> > > > 
> > > > These sets are loaded in the config via:
> > > > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
> > > > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
> > > > 
> > > > The files are created using the geo-nft.sh script here:
> > > > https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
> > > > 
> > > > When loading these, I get the following fatal error:
> > > > netlink: Error: Could not process rule: No buffer space available
> > 
> > Just to be sure and discard something simple.
> > 
> > Maybe you made a mistake in your ruleset in the aarch64 box? With lots
> > of errors coming from the kernel, older userspace nftables versions
> > report ENOBUFS.
> > 
> > Try loading AU.ipv4 and AU.ipv6 with only one element to see if
> > userspace reports a different error.
> > 
> > commit 47e9aaf0227daf16f43a7442e1dceae8851817a5
> > Author: Pablo Neira Ayuso <pablo@netfilter.org>
> > Date:   Tue Aug 26 10:09:13 2025 +0200
> >      mnl: continue on ENOBUFS errors when processing batch
> >      A user reports that:
> >        nft -f ruleset.nft
> >      fails with:
> >        netlink: Error: Could not process rule: No buffer space available
> >      This was triggered by:
> >      table ip6 fule {
> >        set domestic_ip6 {
> >          type ipv6_addr
> >          flags dynamic,interval
> >          elements = $domestic_ip6
> >        }
> >        chain prerouting {
> >          type filter hook prerouting priority 0;
> >          ip6 daddr @domestic_ip6 counter
> >        }
> >      }
> >      where $domestic_ip6 contains a large number of IPv6 addresses.
> >      This set declaration is not supported currently, because dynamic sets
> >      with intervals are not supported, then every IPv6 address that is added
> >      triggers an error, overruning the userspace socket buffer with lots of
> >      NLMSG_ERROR messages (or too big NLMSG_ERROR message to fit into the
> >      socket buffer)
> 
> --snip--
> 
> Interesting.
> 
> I have noticed that if I split the set into multiple 'chunks', then the set
> can be populated properly.
> 
> As an example, this crude claude code authored script here does function as
> expected and the entire set is loaded successfully:
> 	https://lamp.crc.id.au/paste/e0e9DD01E48E46e27F5ad1bc0e/

Unfortunately, I cannot reach this link.

> It does take some time, but it does work:
> 
> $ time ./load-countrysets.sh
> Loaded 8480 elements into au-ipv4
> Loaded 11577 elements into au-ipv6
> 
> real    0m22.202s
> user    0m20.335s
> sys     0m1.798s

Even with ASAN enabled I can load such a small ruleset a lot faster,
not sure what this script is doing.
