From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 19:39:44 +0100
Message-ID: <1325788784.2606.18.camel@kushiel.sterenborg.info>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
	 <1325748924.2270.334.camel@andybev-desktop>
	 <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, 2012-01-05 at 09:15 +0100, Anton Melser wrote:
> I was thinking that when the packets *arrive* on the router they could
> be marked for ToS or fwmark from their source IPs. The ToS or fwmark

You could mark them with a TOS value, but since (I understand that) you
want to NAT private subnets using 1600 public IP's, you'd need to be
able to check 1600 different TOS values otherwise I don't see how you
would be able to differentiate. That's not possible as the TOS field is
8 bit according to 'man iptables' (F15's 1.4.10, yes I have to look it
up too :-))..

There's also DSCP; the man page it has superseded TOS, and that there
can be 64 DSCP values (0-63), so that would also be a no-go AFAICS.

IIRC fwmark only exists on the localhost, not in the header of the IP
packet, so if I'm right then keep in mind that you can only use it at
the localhost. The man page says that the mark value is 32bits wide
which would make it usable here.

But I don't think all of this is going to help you.

> could then be used for routing decisions. On the surface of it there
> is no benefit - if you can use source address for routing decisions
> then why bother adding a step for marking? ToS and fwmark looked a
> little simpler in the examples, but I'm a noob, so don't really know!
> In any case, source IP seemed to be the best option, so it looks like
> you are confirming my original suspicions.

Since it seems you want to map private subnets to 1 public IP and do
that 1600 or so times, I don't see a way to do it easier then matching
the source address and SNAT it accordingly.
Yes, that would mean a lot of rules to create and maintain but I just
don't see any other way.


--
Rob


