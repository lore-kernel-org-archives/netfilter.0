From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: nft rule to redirect multiple ports using maps
Date: Fri, 9 Oct 2015 14:09:09 -0400
Message-ID: <20151009140909.77221e5d@playground>
References: <5616CE2E.1070200@arcor.de>
	<20151009105621.GA2624@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU t99I9CPk007761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
	t=1444414152; i=@wpi.edu;
	bh=qMSQn670/h1kAtCIHT/3skLjDeUf76nbA4me+mstk8w=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=PjUnkBa2Rz6fMx/rUNwDqnXWHDPCrdthVB/OqxEmgSUGN3TVjAYsOKsDFHs+ndEiU
	 Hf+vXLU3Uj0FT7v95Xb1uWWTIn24C05q3LAyLUDIdQDhDzQa4lIqaYsIfpAQf6rEVo
	 6uavE7HGWF0aiMHUpZ4Hg8BLuzUmmD1JvB+u9lng=
In-Reply-To: <20151009105621.GA2624@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, 9 Oct 2015 12:56:21 +0200
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> On Thu, Oct 08, 2015 at 10:12:30PM +0200, Giorgio wrote:

> > <cmdline>:1:37-74: Error: transport protocol mapping is only valid after
> > transport protocol match

> That is telling that protocol context is missing, try with this:
> 
>  nft add rule nat prerouting ip protocol tcp \
>         redirect to tcp dport map { 22 : 2222, 23 : 2323 }

The words, while technically correct, probably should convey more information. Perhaps something like:

"... Error: You must specify a transport protocol (TCP/UDP/etc.) before you can map it"

Neal
