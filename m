Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B6EAFA
	for <netfilter@vger.kernel.org>; Thu,  3 Apr 2025 18:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704724; cv=none; b=Mx1RK88/XxI0rvMqFTkETAzvPUH+n96tikkgYlNNMBy+dC6Q65e3uUd7OhG9eGiU1p+dRuywSD3nOQgluITGA0zgJ4e2bJOoQQwp9Oi4aJmuGPdWkkYfW+qIUdwF+ubaJmb1u3PTaNFmUXMEjvm1+9NG98JSfqgbc4exNb9/G4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704724; c=relaxed/simple;
	bh=1OwNaBEVCa02dzCgDtypszf5Dzw0DpFm4p44WH66c6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Utg8uMQXl5jpDzs/S/FyFaPnionF+Qw1Vc520CCIBu7rXWgfEm5CwSaJfJDV1LuXq6+X/HGbI8bI2Hjr14E+kT1I8TsJDHPtA6Lv0CCz4FNOmlLdYq3fviI6llM0W8bobAK9Sy6ozzI6MB048Z29dVbSoqW5dmx8RDveZlNEHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1u0PFX-00088y-RP; Thu, 03 Apr 2025 20:25:11 +0200
Date: Thu, 3 Apr 2025 20:25:11 +0200
From: Florian Westphal <fw@strlen.de>
To: sontu mazumdar <sontu21@gmail.com>
Cc: Bradley Hook <bhook@kansasdeaf.gov>, netfilter@vger.kernel.org
Subject: Re: Nftables v6 address not matched properly in nftable set
Message-ID: <20250403182511.GA24688@breakpoint.cc>
References: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
 <CAPrh4R6V=4W6VnCowJevFgJTMoT2fWVV1X2eKASKmhD38n_5tA@mail.gmail.com>
 <CANgxkqwR0V3LvEECApmg-d=xZKN35j663VqsUoCZj9JgQ=UKbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANgxkqwR0V3LvEECApmg-d=xZKN35j663VqsUoCZj9JgQ=UKbQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

sontu mazumdar <sontu21@gmail.com> wrote:
> Hence I feel somewhere the logic in nftable/netfilter is incorrect and
> it looks like a bug.

This set type had many bugs, you need to tell us the kernel version you
are testing with.
