Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0B61C5D76
	for <netfilter@vger.kernel.org>; Mon,  3 Mar 2025 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039418; cv=none; b=PtxO3umTpbKYKvp/idXDTn3vjUULvfVOzUAI16WoOh9hxN1j+7eKRPuM5Hn7byYExS8Vd5To0WcqGGCBP6KclZvGFsLQxzF6UgsCJRC4Q0JHpEaN8iMaTh33QleWmPjnYav5xoXrgiv7vRooNy5Rude7THZ0ODXedDQTb6voMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039418; c=relaxed/simple;
	bh=C9xYHHg8aEX2PeIXde8NYuwptGMV/eYi2ksF+zGuslA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i94wtcM63iMeSkoa1hMy5CuWOhUIVin9oMAJs+cP0vWvdqGDUWU4ZmX48R3XHCNcJDIFDebZMnLJYJx9NsTb1+Uri5w+SJ1CiLijAV6y1U4CJpmddstXhW2OJ/1VQQ6gocI0Y117glU8fW3jh89IP1tv1S3vgQ54foGHyK+r02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tpDss-0005Ks-Ac; Mon, 03 Mar 2025 23:03:34 +0100
Date: Mon, 3 Mar 2025 23:03:34 +0100
From: Florian Westphal <fw@strlen.de>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Log ARP headers
Message-ID: <20250303220334.GA19712@breakpoint.cc>
References: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
 <20250303193533.GA16225@breakpoint.cc>
 <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88D0D02C-9C84-428F-B62B-EBA5E359D325@slavino.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Slavko <linux@slavino.sk> wrote:
> >I think this is missing support in ulogd2.
> >
> >Untested, to give you some starting point:
> >(3 is NFPROTO_ARP).
> >
> >--- a/filter/raw2packet/ulogd_raw2packet_BASE.c
> >+++ b/filter/raw2packet/ulogd_raw2packet_BASE.c
> >@@ -959,6 +959,8 @@ static int _interp_pkt(struct ulogd_pluginstance *pi)
> >                return _interp_ipv6hdr(pi, len);
> >        case AF_BRIDGE:
> >                return _interp_bridge(pi, len);
> >+       case 3:
> >+               return _interp_arp(pi, len);
> >        }
> >        return ULOGD_IRET_OK;
> > }
> 
> Unfortunately, i don't speak C ;-) I understand this change,
> but i cannot see all consequence,
> 
> Any chance that it will go to ulogd itself? Or i have to maintain
> this patch locally only? (I mean for future versions)

Can you test and report back if this works?
I have no idea what I am doing as I don't use ulogd.
