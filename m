Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B5244E83
	for <netfilter@vger.kernel.org>; Sat,  8 Feb 2025 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.190.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051393; cv=none; b=YhKw+i7QZRQ93XZCwEQGTt/9WniHC3aaD7Dzcrfh+mPv9sJl+9GJ4QrX2yk2/qZt6/THY6z1IKyT/jROA/feqxu3CrKDImp/t8h5yBuvWl8sfnBUC9fgZmtwgqpwXQjf1hjvWAeXFC1XMzFJ+hjuKu+zSW/rdCGaMQijLZ7MGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051393; c=relaxed/simple;
	bh=/RPjGxIwTe8R4LlPA4yx31FHO9DmcwxA6k5CxQwDWnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYeKhAvhLHZIDsQ6jwqopQvAz6QJcMDOY91P/0UC5KQ0TatZ/juQ1E5QhN+waMZWNpx0m0mn6oPBSpspLpNXYjOVwTM6FyorDTt13CTaawkdL05zAgMlqMh5zl7xvas5JKJya4lup0Ia0u0OZG/T0Nx+kQK85oLma9hFN4MPNns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=XDNgHsLG; dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b=XDNgHsLG; arc=none smtp.client-ip=217.70.190.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="XDNgHsLG";
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.b="XDNgHsLG"
Received: by mail.netfilter.org (Postfix, from userid 109)
	id 9FDDE60564; Sat,  8 Feb 2025 22:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1739051388;
	bh=+8o2joxgaFPPGVi3zSEjCnJcmCJ1WQxkoUxwnEYgZSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDNgHsLGFS4o4YsXEQo3gI0Ru0dqGDi5KUAUZV9Mk73VwKNsNVE/97cVS20pu9/hY
	 3EpG6H1qU1dGEq15ENPfiau7I2eq/QPtKAEO4V8ghu+k45GsfkVZG+IZ/uXtx53rt8
	 h0XRt9VgEX7UhXn4hCpEbf4+Oi3TuIoCb56NKOOG1UOOvw+T/IP+hnPLBi1uy7EOj4
	 Zag9uIeMJc/DKX5viDPL376V/LaN2TIv7Ej/75bps2pC5V3V0bg5v4R+cT30S1s/AY
	 cc1fiJhGUF0nc6lRuy7ywm/AHgq4ugjpkWtFaxt/bQDQay5P6SVM0DNicPEIIVhh/V
	 8dgx4BJLe1IzA==
X-Spam-Level: 
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with ESMTPSA id 0992860564;
	Sat,  8 Feb 2025 22:49:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1739051388;
	bh=+8o2joxgaFPPGVi3zSEjCnJcmCJ1WQxkoUxwnEYgZSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDNgHsLGFS4o4YsXEQo3gI0Ru0dqGDi5KUAUZV9Mk73VwKNsNVE/97cVS20pu9/hY
	 3EpG6H1qU1dGEq15ENPfiau7I2eq/QPtKAEO4V8ghu+k45GsfkVZG+IZ/uXtx53rt8
	 h0XRt9VgEX7UhXn4hCpEbf4+Oi3TuIoCb56NKOOG1UOOvw+T/IP+hnPLBi1uy7EOj4
	 Zag9uIeMJc/DKX5viDPL376V/LaN2TIv7Ej/75bps2pC5V3V0bg5v4R+cT30S1s/AY
	 cc1fiJhGUF0nc6lRuy7ywm/AHgq4ugjpkWtFaxt/bQDQay5P6SVM0DNicPEIIVhh/V
	 8dgx4BJLe1IzA==
Date: Sat, 8 Feb 2025 22:49:45 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Victor Julien <lists@inliniac.net>
Cc: netfilter@vger.kernel.org
Subject: Re: named counters vs flush ruleset
Message-ID: <Z6fRedYWO14e0l7e@calendula>
References: <5f970dae-b21b-4837-9e96-955bedbdf69f@inliniac.net>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f970dae-b21b-4837-9e96-955bedbdf69f@inliniac.net>

Hi Victor,

On Sat, Feb 08, 2025 at 03:35:27PM +0100, Victor Julien wrote:
> Hi all,
> 
> I'm working on finally supporting nftables in Vuurmuur.
> 
> In the iptables support, I have special rules per interface to get per iface
> packets and bytes. Essentially my tool reads the iptables -vnL output and
> parses all the things. When a user applies a ruleset change, Vuurmuur reads
> the most current values, constructs a new input file to `iptables-restore`
> and loads the rules. This works but is tedious, and also lacks some
> precision as we are not counting the packets/bytes while Vuurmuur is
> working.
> 
> In the nftables support, I'm more or less looking at the same logic. The
> ruleset is build as a .nft file that is loaded with `nft -f`.
> 
> Now I found the the named counter feature, and also the json output `nft -j
> list counters`. This combination seems perfect.
> 
> I guess my main question is if we can make these counters persistent
> somehow. As part of the ruleset reload, I issue a `flush ruleset`, which
> also removes the counters.
> 
> So can we make counters survive a `flush ruleset`, or is there a better way
> to load a new ruleset?

Would it work for you to destroy all other existing objects (not the
table and counters) instead?
