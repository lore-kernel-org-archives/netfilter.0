Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.245.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233959;
	b=TMJi8TvbycJJTyOkzwSSNBaXWDAbVCiSLUPiUgfOEICNlk1ldcsVlBQ8nDY/5MyUrm35
	 4XQNzBgGyfscv4ekUdSmyVO9vyt274pFMj3GtY6jhbrKsMOzp8Xcsjbfse+VL8S5sNl40
	 SgaugVj7GyfBMh1a2cALizi6eJ6jfNcWarwaJmGMbJ5ZplMPNeGMUplSPeLex1+rlIRBY
	 ofFq1QUnoGrTK5U4voTbOJYcXBhn+pB2JkztQiSfsCod0LrsRi7J5gJMM8iM8i1rvPWiT
	 IXc1S2M59IlOvIBPCnKJmEx+xwmUeeV8FXWPygpM9Yx0oPd2v0cS8UMnInP6tPDGtIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233959;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uXsyOsogBseemmNPffW1YdWxSZQmryNW09HKkY+/wdA=;
	b=BvEXNstUFYC6nga6ovf6LimxMVDvRWS27aMKJ2WsvzsIoEkimF/eDWaKQARazVQpquKS
	 NIz5yV8kU5mWXZs3rVskFmLRc2ZAHYoCzYgNK08qapIpuy2iH+aC/l3YHuJei81w6kauY
	 JWBbMUDL65yny++4i/TZjgTTtI8H0hF1sZu3nzspbmKUx5s9A3RFCx5y6WQyUF1/ggWls
	 IyAmeZPL71xvKkpYp9S10jXF4G5Z68IwDv/TpZxqPt6uJKYbMLdgywogIL7cgbfg4gYwS
	 ghF0l9QfncGXgWaVPMR5RpzVhhhX7z4uSYJ8dCS6al2kYWC6dtI8D2W3zirm3Uf1mig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=strlen.de;
	spf=pass smtp.mailfrom=strlen.de;
	arc=none smtp.remote-ip=91.216.245.30
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB658606A31C
	for <netfilter@vger.kernel.org>; Mon,  9 Nov 2026 14:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB658606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 23A756055A; Mon, 09 Nov 2026 15:19:16 +0100 (CET)
Date: Mon, 9 Nov 2026 15:19:13 +0100
From: Florian Westphal <fw@strlen.de>
To: allfox wy <allfoxwy@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: [regression] Completely editing packet should be allowed.
Message-ID: <avHWYRPcjP0ITv8b@strlen.de>
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de>
 <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>

allfox wy <allfoxwy@gmail.com> wrote:
> Thank you for explanation. I did a test. It is indeed the protocol
> number change in homebrew causing the block.
> 
> However, calling nf_reset_ct(e->skb) would still result in packet
> being dropped. I didn't do a precise diagnose to find out where it got
> dropped. But replacing nf_reset_ct(e->skb) with "return true" would
> result in a working system.

Unfortunately that is the problematic part.

I'm not even sure how this scheme of yours works:

The NAT dispatch uses the l4proto value from the tuple to decide
what to do.

So as far as I can see NAT postrouting will write updated tcp/udp
port to the packet, which is no longer udp/tcp - corrupting
the l4 header.

> My deduction: in the system's NAT table there is MASQUERADE in
> POSTROUTING. As my understanding, MASQUERADE requires CONNTRACK
> information to work. When the outgoing packet going through MANGLE
> table and got nf_reset_ct(e->skb), later MASQUERADE in NAT table might
> dropped it.

The removal of the conntrack info causes the packet to be treated as
INVALID; MASQUERADE / SNAT will not work on it.

> Is there a function that recalculate the CONNTRACK info rather than
> deleting it please?

We would need to make a re-lookup (possibly creating a new conntrack
entry) that reflects the new/updated L4protocol + any other changes to
saddr/daddr.
