From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Thu, 27 Oct 2011 07:24:23 +0100
Message-ID: <1319696663.26402.6931.camel@andybev-desktop>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	 <1319669075.26402.6892.camel@andybev-desktop>
	 <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319696664;
	bh=IYdgAhH97PV50Wzskq4lrx283jZ4JuVIY/YaI26zWYU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=n1SqDYf/YYfteqxDQJGFcLOt4kNnMnfqVmQMcPr2J091culAOUn7VUHG93XybcUsl
	 zUuGfDn7esabs7bVcJDqEWNjXuHAXN+/sXv0hh5Z5MCpv2i2y04LxZvNg0DQCZbfkQ
	 7wMaK7fcs9t159iCTxVYZgjaMXG3v6N5NrbJlx9o=
In-Reply-To: <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronald <ronald645@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2011-10-27 at 06:16 +0200, Ronald wrote:
> > Is there any way you can you try it without IPSEC?
> 
> Good idea, I'll try without IPSEC and see what happens. I suppose I
> can just use nc for this.
> 
> > Okay, so if it's running in a VPN, do you really need to "secure" it by
> > changing the port number? Am I missing something?
> 
> It's not running in the VPN, it's running the VPN.

Ah, got you, so I was missing something :)

> > I assume that you have the relevant rules for the returning packets?
> 
> What you see above is the entire iptables configuration that is
> relevant for port redirection. I made these based on examples from the
> internet. In order to redirect a port, you have to apply 1 rule to the
> client and 1 rule to the server.

For packets going in one direction, yes. But surely you need similar
rules from the server back to the client? That said, it's probably
working (with the cable connection) because you're not doing it at
either end, so the packets are using the default ports.

> > then your answer is a problem with the bearer in between.
> 
> Thinking of it, I suppose that is a valid conclusion. Totally agree,
> bothers me why this is happening though.
> 

Hmmm, I'm still not convinced you've got the iptables rules correct, as
per my post above, but I've not got time to re-read them right now.

Andy


