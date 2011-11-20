From: Andrew Beverley <andy@andybev.com>
Subject: Re: trouble setting default route for load-balancing routing tables
Date: Sun, 20 Nov 2011 20:32:29 +0000
Message-ID: <1321821149.2382.1042.camel@andybev-desktop>
References: <op.v4721hs0x1lyi3@debiandesk2.net>
	 <1321798603.2382.987.camel@andybev-desktop>
	 <op.v482atdzx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321821149;
	bh=OW6267XoFqEtmqkqZIEMluAPKNprZyg+4gnWsVhFAoI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=irhOgZabiXvd+99sHIRkqgqEh4fGPcNF9Zw3zgCFaTCVehY2iKTyU2k09eBrq5HaR
	 5pFMYVbXPmkXnVPFdTcyHVLaNg2crhtxHI0zEHdJH7Mphdui6vYmGUPhmfnAz2SOww
	 RZXY1gkLdzsIOAjwmvYJC4nlrs58A8DQrlhIWu1g=
In-Reply-To: <op.v482atdzx1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

> > I assume that you have no need to keep the same connection stream on the
> > same interface? If you do, you can use netfilter marks (and netfilter
> > connection tracking) to do the load balancing instead, as described on
> > this page:
> 
> I may have to do that, but from what I've read, rule like the ones I
>  posted above are supposed to be evaluated before the default
>  "nexthopping" route in table main, because of the rules numbering, and
>  that's the way my rules appear:

Correct, they will be evaluated first.

What I meant was that if you have a stream of packets all to do with one
connection (such as an FTP download) and you want all the packets for
that connection to go over the same link, then you will need to use
netfilter connection tracking for your iproute rules.

If your internet links are independent then you will need to do this in
order to not break connection streams.

> My script has to reconfigure the firewall when an uplink fails and
>  again when it recovers connectivity.  I used a program called lsm
>  (link status monitor, http://lsm.foobar.fi/) for this.

Thanks for that. I wish I'd known that earlier, as I have just written
my own basic version!

>   I think this
>  will be useful to others.  When I get it all working I'll post it on
>  my website and post here.

I've been working on a project for something similar. I'll also post it
to this list shortly for the benefit of others.

Andy


