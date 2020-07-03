From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time
 yet?
Date: Fri, 3 Jul 2020 08:04:03 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=Cc:Date:From:From:In-Reply-To:Message-ID
        :MIME-Version:References:Reply-To:Subject:To:User-Agent; s=uk;
         bh=zWEs7BTT/Ec0OasrHBY2UjX1zxP+Kv8st0c9MnWkaGw=; b=T1t3a6CgAiQ3
        LTVgt4PnuCW143BYeinL7ttAm2k5RaDgjw6Irdz3Nd0dvxspqQYPE35Nv03N+5Q3
        +HP999UQ2drSRdTPjnlIFcwy55fns1P2qE+hTvL2zPJJE/Pq5cEw6nabVIboqtZF
        Zsu9KCEGpK8iiOCf+nw1Sl19QZlnBs+BpQJiMLQxyQY21Y6XuHbxhCn/15r2bono
        1CofEBKndIEk+BZqSkUAGahorApaULBBSDGqp83sfF8JWeHjrX2BCu7ZCWzXJV4H
        ivGFA33lq9hr8mHMfwX7SeNx6OVIG4wjDc+jv5wdEW/BmKJORhQkEE1DGueELckm
        Pv2XWemz7g==
In-Reply-To: <20200702231812.E43146C80D34@dd34104.kasserver.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Fri, 3 Jul 2020, Timo Sigurdsson wrote:

> ... I use ipsets for blacklisting.
>     I fetch blacklists from various sources
> ... This approach has worked for me for quite some time.
> ... some of my blacklists may contain the same addresses or ranges,
>     I use ipsets' -exist switch when loading
> ... I don't think that the use case is that extraordinary ...

+6

FWIW I'll be following this thread very closely.

-- 

73,
Ged.
