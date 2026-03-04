Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7C347DD
	for <netfilter@vger.kernel.org>; Wed,  4 Mar 2026 00:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772585597; cv=none; b=c1fgolocql3E1mlW6eAmz2kxavF7wsHfuGk8VlDVdoOaUinORx7csuaHHc1hiVaNLDwN7siT3NMJIvpYeOF4e8q49yf40v4/W1dQJ2huv0RJihOC0dWaSzZ+ePCFsQWzXRFi+ctEgId/sqllOm4wnEh3AjjnSEXLHfUzplF3iJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772585597; c=relaxed/simple;
	bh=IrpGLijWWCPZq0ZS+Y0WxZgn0NbK9/NWm8zH4m0S11U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u53rz0OCcOMP3u+y23U2Hv3Gcz7ePd9884+mJxuwNkPYXt+Ux7OmVNSDg5nSsjhd7ErcT1NZyyN6EyaNQJg9Nmpd1hbu/WK2w9nviJwYgte3DhuRGaIaYq3KdBb4KHYi1RfObsdezM4ZUYrUucmCo7h6zx1uxxtzf0l6NQ9mxrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=NcjN7zro; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="NcjN7zro"
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 928DC60177;
	Wed,  4 Mar 2026 01:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1772585594;
	bh=hFEmphH2LZxjl5EwS2j98z1It0dzF1MPcFPsnI828UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcjN7zroOMsxwXgE6vC7y9TkoM/k74CMkD3ZfWAP46a6YfN1V3e+csUy39/BZGxzm
	 w5OkUaCOWu29Bk19xQISOKRNJce9tFNX8sF9MMcQSpf6N7vA3N4AUQtAWy/ypQLR0V
	 C4QpSAQ4Jc+ukMQRAcZ113PorHD5RJsuhrxo/fUOylF8WhH+4TOaG0vl+bmsF3p90j
	 kwGFWO7r508gEXPRBf4uezPPxyf9FFlLpcu8po2K8lk4hM/Go3Xc4JCiwSvN6UdFwi
	 MjsR0TYhYtZME7VWK3Q/TjRMpE6pkFpPoyC0++8IeW3PrSsMslWMM2DpUkXLjmx0Y/
	 Bc+ba1IqMdJeA==
Date: Wed, 4 Mar 2026 01:53:11 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Steven Haigh <netwiz@crc.id.au>
Cc: netfilter@vger.kernel.org
Subject: Re: aarch64 - netlink: Error: Could not process rule: No buffer
 space available
Message-ID: <aaeCd1rZsttYRVBf@chamomile>
References: <c92b85f0-7754-460b-a31a-19c3b268b2f0@crc.id.au>
 <aad2hjmYS6Bcc3xz@chamomile>
 <aad5_mnW4D4JR8ZQ@chamomile>
 <a282917a-107d-4f70-82e5-df9564d5172d@crc.id.au>
 <aad__3J15t9kzkYd@chamomile>
 <5e92cfab-a593-4679-8df2-abb8b9e32bad@crc.id.au>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5e92cfab-a593-4679-8df2-abb8b9e32bad@crc.id.au>

On Wed, Mar 04, 2026 at 11:49:41AM +1100, Steven Haigh wrote:
> On 4/3/26 11:42, Pablo Neira Ayuso wrote:
> > On Wed, Mar 04, 2026 at 11:34:39AM +1100, Steven Haigh wrote:
> > > On 4/3/26 11:17, Pablo Neira Ayuso wrote:
> > > > On Wed, Mar 04, 2026 at 01:02:14AM +0100, Pablo Neira Ayuso wrote:
> > > > > Hi,
> > > > > 
> > > > > On Wed, Mar 04, 2026 at 10:36:20AM +1100, Steven Haigh wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > Firstly, please CC me in replies as I'm not subscribed to the list.
> > > > > > 
> > > > > > I am currently loading some named sets into nftables using the following
> > > > > > configuration:
> > > > > > 
> > > > > > set au-ipv4 {
> > > > > >           type ipv4_addr
> > > > > >           flags interval
> > > > > >           auto-merge
> > > > > >           elements = { $AU.ipv4 }
> > > > > > }
> > > > > > 
> > > > > > set au-ipv6 {
> > > > > >           type ipv6_addr
> > > > > >           flags interval
> > > > > >           auto-merge
> > > > > >           elements = { $AU.ipv6 }
> > > > > > }
> > > > > > 
> > > > > > These sets are loaded in the config via:
> > > > > > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv4";
> > > > > > include "/etc/nftables/firewall/geo-nft/countrysets/AU.ipv6";
> > > > > > 
> > > > > > The files are created using the geo-nft.sh script here:
> > > > > > https://raw.githubusercontent.com/wirefalls/geo-nft/main/geo-nft.sh
> > > > > > 
> > > > > > When loading these, I get the following fatal error:
> > > > > > netlink: Error: Could not process rule: No buffer space available
> > > > 
> > > > Just to be sure and discard something simple.
> > > > 
> > > > Maybe you made a mistake in your ruleset in the aarch64 box? With lots
> > > > of errors coming from the kernel, older userspace nftables versions
> > > > report ENOBUFS.
> > > > 
> > > > Try loading AU.ipv4 and AU.ipv6 with only one element to see if
> > > > userspace reports a different error.
> > > > 
> > > > commit 47e9aaf0227daf16f43a7442e1dceae8851817a5
> > > > Author: Pablo Neira Ayuso <pablo@netfilter.org>
> > > > Date:   Tue Aug 26 10:09:13 2025 +0200
> > > >       mnl: continue on ENOBUFS errors when processing batch
> > > >       A user reports that:
> > > >         nft -f ruleset.nft
> > > >       fails with:
> > > >         netlink: Error: Could not process rule: No buffer space available
> > > >       This was triggered by:
> > > >       table ip6 fule {
> > > >         set domestic_ip6 {
> > > >           type ipv6_addr
> > > >           flags dynamic,interval
> > > >           elements = $domestic_ip6
> > > >         }
> > > >         chain prerouting {
> > > >           type filter hook prerouting priority 0;
> > > >           ip6 daddr @domestic_ip6 counter
> > > >         }
> > > >       }
> > > >       where $domestic_ip6 contains a large number of IPv6 addresses.
> > > >       This set declaration is not supported currently, because dynamic sets
> > > >       with intervals are not supported, then every IPv6 address that is added
> > > >       triggers an error, overruning the userspace socket buffer with lots of
> > > >       NLMSG_ERROR messages (or too big NLMSG_ERROR message to fit into the
> > > >       socket buffer)
> > > 
> > > --snip--
> > > 
> > > Interesting.
> > > 
> > > I have noticed that if I split the set into multiple 'chunks', then the set
> > > can be populated properly.
> > > 
> > > As an example, this crude claude code authored script here does function as
> > > expected and the entire set is loaded successfully:
> > > 	https://lamp.crc.id.au/paste/e0e9DD01E48E46e27F5ad1bc0e/
> > 
> > Unfortunately, I cannot reach this link.
> 
> Apologies - its behind the firewall that I'm debugging :)
> 
> Mirrored here: https://pastebin.com/iTa9XRCb

This is insane:
while IFS= read -r line; do
 ...
 echo "add element $TABLE_FAMILY $TABLE_NAME $set_name { $batch }" | nft -f -

this is one transaction per command.

This is as bad as a shell script with explicit iptables invocations,
one per line. This is an antipattern.
