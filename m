From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Sat, 29 Oct 2011 19:23:11 +0100
Message-ID: <1319912591.2993.8.camel@steve-pc>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	 <1319669075.26402.6892.camel@andybev-desktop>
	 <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
	 <1319696663.26402.6931.camel@andybev-desktop>
	 <CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319912595;
	bh=DWyQx+vcFfNnZtAPrEErjoPuGUSQ8RLedPnfWVH50vI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=uNZFApB5nAO/gKyEPJOeSCzHdpwbh+1GPH36T+8VrHUGvaoTzor+iA5BtG94SeDyL
	 p1bjoIv5JQ67lIgmvit8USG6IRBdj5+b1h0A34o/mNNFsMnSrYJog7WlShUoqe4De6
	 mX2keUXBVGYmnylJsCJzxRv3VLtY814VIYD/rg4o=
In-Reply-To: <CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronald <ronald645@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2011-10-27 at 08:45 +0200, Ronald wrote:
> >> > I assume that you have the relevant rules for the returning packets?
> >>
> >> What you see above is the entire iptables configuration that is
> >> relevant for port redirection. I made these based on examples from the
> >> internet. In order to redirect a port, you have to apply 1 rule to the
> >> client and 1 rule to the server.
> >
> > For packets going in one direction, yes. But surely you need similar
> > rules from the server back to the client? That said, it's probably
> > working (with the cable connection) because you're not doing it at
> > either end, so the packets are using the default ports.
> 
> No I don't. If I redirect packets from the client that originally go
> to udp/500 to udp/56301 (for example).

Okay, I don't know VPN, but assuming that the return packets originate
from the server's port 500, then these will not have the port number
changed using your rules.

>  I can even add the following
> line to my server. (This is in the case I use port redirection. Then I
> use this line to make it an effective security enhancement):
> 
> iptables -I PREROUTING -t raw -p udp --dport 500 -j DROP

Yes, but the packets originating from the server will not pass through
the PREROUTING chain.

> If I use a cable, the connection succeeds. If port redirection would
> fail, this rule would catch it and make a connection impossible. So I
> can conclude that port redirection works as expected when using a
> cable.

Maybe your cable connection has a firewall that is only allowing related
packets to return? Thus, if it sees the packets destined to the server
for port 56301 and returning from port 500 then it may not associate
them and thus drop them.

> Besides, I designed my netfilter configuration to not differentiate
> between interfaces. I use the addrtype extension, works better.

I like that, but remember that any packets leaving the server will only
traverse the OUTPUT and POSTROUTING chains. They therefore are not
affected by any of the iptables rules that you previously posted.

Andy


