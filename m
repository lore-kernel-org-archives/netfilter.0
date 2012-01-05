From: Andrew Beverley <andy@andybev.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 17:06:24 +0000
Message-ID: <1325783184.2270.344.camel@andybev-desktop>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
	 <1325748924.2270.334.camel@andybev-desktop>
	 <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325783187;
	bh=LWPwVVOhHQ2RqrFwjbvp3MaPH1S4KjMjNV8ddqu8jgA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=WY8kbBdV+7GpChH4Oqnxbt5+yzDoNbAR51lkKzOPgCF08w4h3SgIq294C5Ryd0zBJ
	 qxijUc8sPc3R1HSBBgAt6uquE7j2FSy+GvD/2mltpvMPtub7ukj9PE3XgbDb9SY5AU
	 NCg/vwMWEyUSNBSM9Uzh2oa2R17IjwXm5rLUTSR0=
In-Reply-To: <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Melser <melser.anton@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 2012-01-05 at 09:15 +0100, Anton Melser wrote:
> ...
> > So you have something like:
> >
> > Server A ----|
> >             |
> > Server B ----|
> >             |-----> Linux router ----> Internet
> > Server C ----|
> >             |
> > Server D ----|
> >
> > Correct? And it's the Linux router you're asking about?
> 
> That is exactly right. I thought it might be useful to do part of the
> routing on the servers (A-D) but that has the disadvantage of meaning
> Windows can't be used (Windows doesn't do policy-based routing). Not
> that the idea is to use Windows but I like choice...
> 
> >> AFAICT the best way to do this is with iptables SNAT - is that the
> >> case?
> >
> > I think the main question is: how does the Linux router know which IP
> > address that the mail should be sent from? Server A/B/C/D somehow need
> > to pass this information on. This can't be done with fwmarks, because
> > they aren't retained between on packets between servers.
> 
> My idea was to communicate the external/public IP that should be used
> by the router by associating an internal network to each external IP.
> So if an internal machine presents a packet from their address in
> network X, the router knows that it should use public IP X. What I had
> in mind was just taking the standard case where you have one publicly
> available IP and lots of internal machines that need to access the
> 'net, and multiplying that by all the external IPs. So if we have 1600
> external IPs then we'll have 1600 internal networks, each with N
> hosts.

Okay, I'm still a bit confused. Do the A, B, C, D servers above
represent physical machines, each of which is dedicated to a single
customer with single external IP address? I assume not, but that's how
I've read your statement above.

Surely you want several customers on each server, each of which binds to
a different internal IP address? Each internal IP address is then
individually mapped to an external IP address?

> 
> >>  It's not 1 to 1 so it needs to be stateful, and can't be done
> >> with just iproute2 stuff - am I correct in my understanding?
> >
> > You might be able to do this with iproute2, but depends on answer to
> > above.
> 
> My understanding was that iproute2 doesn't do stateful, and that if we
> have many : 1 then we need stateful. Is that right?

Again, depends on my understanding of your problem, but you could maybe
do stateless NAT using iproute2:

http://linux-ip.net/html/nat-stateless.html

Funnily enough, that website actually uses an SMTP example...

> 
> >>
> >> There seem to be many different ways I could do this in terms of
> >> routing - at least by source IP, TOS, and fwmark.
> >
> > I'm going to guess that source IP is the only option. So can you set the
> > source IP from each server depending on its eventual external IP
> > address?
> 
> I was thinking that when the packets *arrive* on the router they could
> be marked for ToS or fwmark from their source IPs. The ToS or fwmark
> could then be used for routing decisions. On the surface of it there
> is no benefit - if you can use source address for routing decisions
> then why bother adding a step for marking?

Agree. I don't see any reason to add a mark to a packet in this
scenario. Of course, TOS marks will transit between servers, but you're
not going to get 1600 unique ones :)

Andy


