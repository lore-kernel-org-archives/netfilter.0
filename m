From: Andrew Beverley <andy@andybev.com>
Subject: Re: bandwidth-limiting on LAN interface egress (2)
Date: Sun, 20 Nov 2011 13:38:39 +0000
Message-ID: <1321796319.2382.948.camel@andybev-desktop>
References: <op.v41qaj2hx1lyi3@debiandesk2.net>
	 <1321480803.2382.62.camel@andybev-desktop>
	 <op.v419zu1bx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321796319;
	bh=qucKorl2odQfrB6/n50z4lKnbbsWlMifU1INtr18BWg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=bW1c0uSbDsh1jgZ3ahdqbyZDzSXlkFg9bcFmoFma7dwX3ugRal9E7QaFe5oacLMod
	 YQSo/n7Wnrt1lWn21P+kXOzoNJnZTM5Ez2mkOlKhaG6UPqkcOB+SvvZvkCk1Y2pfEY
	 MbGtsR/uSwpzyYQwiDk4ZOfdhfJVS5Myph8pDJ0s=
In-Reply-To: <op.v419zu1bx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Wed, 2011-11-16 at 16:56 -0600, Lloyd Standish wrote:
> Can I assume from your comments that you think queuing in the router
>  should not cause big latency problems as long as interactive traffic
>  is given highest priority?

My personal opinion is that it should be okay, although depends what you
define as "big latency". I've been running the rules previously
described for a while now, and whilst they're not perfect, the latency
is minimal (I comfortably use SSH whilst the link is saturated).

You might also want to check out some of the "buffer bloat" discussions:

http://netoptimizer.blogspot.com/

http://gettys.wordpress.com/2010/12/03/introducing-the-criminal-mastermind-bufferbloat/

Andy



