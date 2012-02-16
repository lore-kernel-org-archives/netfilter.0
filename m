From: Andrew Beverley <andy@andybev.com>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 18:33:43 +0000
Message-ID: <1329417223.18690.471.camel@andrew-desktop>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <1329411784.18690.463.camel@andrew-desktop>
	 <1329415217.2595.3.camel@kushiel.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1329415217.2595.3.camel@kushiel.sterenborg.info>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329417226;
	bh=pig5cIe447JlYMaqI1e/7fO0AXLszXbzy52TChpd8hc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=ijyqnji8qNbYm/QFHFoYTihtkU3xTXDl0qJS3CoqgfBEkPgXJLAV83bTY5Rq1aY7B
	 RQ62j3tlqh1KBCngHg5+lHKLZnLe+4MnymLcZfbrEalZOL+IpSXflEJdFCS2ELlPWI
	 EjEokKpslukJay8HZ1Lel+vOut3LTLHbAr3VTZdI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Cc: netfilter@vger.kernel.org

On Thu, 2012-02-16 at 19:00 +0100, Rob Sterenborg (Lists) wrote:
> On Thu, 2012-02-16 at 17:03 +0000, Andrew Beverley wrote:
> > On Thu, 2012-02-16 at 13:01 +0100, Rob Sterenborg (lists) wrote:
> > > I think
> > > 
> > > # man xtables-addons, Section ipp2p
> > 
> > I believe that ipp2p is no longer maintained; their website recommends
> > openDPI instead. I've never tried it myself, but it looks promising.
> > 
> Yes, I read it too.
> However, I wasn't referring to the ipp2p project that is no longer
> maintained. I was referring to how to use the ipp2p match that comes
> with xtables-addons, and that is what man xtables-addons is writing
> about. (Correct me if I'm wrong..)

Fair point: you will at least get a version that's maintained. However,
I don't think the module is updated regularly for changes (or additions)
to protocols. It's a constant battle keeping up with current
definitions, as they change all the time, hence the reason I just used
connlimit instead.

Andy


