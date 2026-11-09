Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.190.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221402;
	b=tjCwhnApL7fLqbbefPil58iWOV4fO952KnS6TfJDDRArYUparyfU7/ZoHXPllOFFOTee
	 6H2t7XfHyJ2z3+l7VxGelFqSBzrJaiGhr2ag/u1zz1wapVJGzj97emxIb3u+Rd07C0PaL
	 ohFYxcMhL7wtpDNFj2JFv+53UvRCZXiM9rfRPLi+4m5n0IZJ/jQV9x922PaVJCjod5TSR
	 BMWhcPqnyt0qho5scmHX/PYxfut1WgAaUEFMm1Zma9DcuYOEgKNyGsXR8L+dIb2NFSVnH
	 32CxTZVZ5F/UhknnriBnSQKOkL5NW/OSCh6yQGdQvA0ErfuhPHrgrP3iP0IZCKQbGFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221402;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Status:X-Spam-Checker-Version;
	bh=Wi3pytPL8CzlLm7oeQjlCtbW3rzOLKoIph3K3VEFcps=;
	b=Wfkc33IM4GvvIa0Rfy6tj2c0a2duXB+Q2bEsXJfquvoHhRyec4fhuO0mKgzXnkoFTorX
	 O6NygaroPAAq+U5BuLRNFtKilWOnU0Gb0QMxkiWrkRC4fdqG2dQDXlgtyUjFSqSGuwKu0
	 YHQ3Wdrd0YyJmykNkzKpYDsHYp4z8GNNPkCa0ofwJysFCyTDddkkseHjZu0Qq3mUXNae3
	 A6ig8d2BAZ8EW/karR9anC/mgr9zzGxbgwbOXuDN6pijFdtOnm21tdPre9FjOkBf/IdyT
	 +QT0YgU+atR3dPGAuDngCQd9zrFVFMiL6DShyqEI0E+R3b22trZNYAFa4Tr5z7/0DHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=netfilter.org;
	spf=pass smtp.mailfrom=netfilter.org;
	dkim=pass header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=EvD6HPqi;
	arc=none smtp.remote-ip=217.70.190.124
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B3164606A321
	for <netfilter@vger.kernel.org>; Mon,  9 Nov 2026 10:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3164606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=EvD6HPqi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1794221399;
	bh=Wi3pytPL8CzlLm7oeQjlCtbW3rzOLKoIph3K3VEFcps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EvD6HPqiGTlw+fhGITil6h7pExVPM4mEXbzK4p2PuUxlZ3Yn+EpfYw6/bmXHflDFs
	 4mSlM5otcbRYuMqey24A1tacakzTxUr/AuR+Y0DELLNr7/VRfs7Mksa1kMXdFRB0WU
	 YDojU5ndh9rB3JSYdNM5ay8+dKVWu17tE8/BcGLszEVFOaV+32XXUT4NEjjFMdF1Yq
	 pQ8i1HHjBCVx9hA5fUlyyI6vOcXT0o3KkaNcDDrglI/RGxRtZ2dX9KFX+34QzKQ0z9
	 g6CSfn1Yq/GQ6+vRItK2tOySaTeOXt7LgwfiPEHzn7R7Vk46ZTZHnsNDSEEUBqzBz+
	 aC83EOg+wU/nQ==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 3560E60056;
	Mon,  9 Nov 2026 11:49:59 +0100 (CET)
Date: Mon, 9 Nov 2026 11:49:57 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: allfox wy <allfoxwy@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: [regression] Completely editing packet should be allowed.
Message-ID: <avGlVRpsRmngaThN@chamomile>
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de>
 <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
 <avGfnpl1U8oFlEZG@chamomile>
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avGfnpl1U8oFlEZG@chamomile>

On Mon, Nov 09, 2026 at 11:25:34AM +0100, Pablo Neira Ayuso wrote:
> On Sat, Nov 07, 2026 at 04:04:49PM +0800, allfox wy wrote:
> > Thank you for explanation. I did a test. It is indeed the protocol
> > number change in homebrew causing the block.
> > 
> > However, calling nf_reset_ct(e->skb) would still result in packet
> > being dropped. I didn't do a precise diagnose to find out where it got
> > dropped. But replacing nf_reset_ct(e->skb) with "return true" would
> > result in a working system.
> > 
> > My deduction: in the system's NAT table there is MASQUERADE in
> > POSTROUTING. As my understanding, MASQUERADE requires CONNTRACK
> > information to work. When the outgoing packet going through MANGLE
> > table and got nf_reset_ct(e->skb), later MASQUERADE in NAT table might
> > dropped it.
> > 
> > Is there a function that recalculate the CONNTRACK info rather than
> > deleting it please?
> 
> That would entirely conntrack lookup.

I meant to say: That would require a mistream conntrack re-lookup.

> I think your software should be doing this packet mangling from the
> prerouting hook *before* the conntrack hook, so you have a chance to
> create a conntrack object that really represents the flows after your
> mangling.
> 
