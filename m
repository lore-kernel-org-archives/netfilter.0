From: Andrew Beverley <andy@andybev.com>
Subject: Re: Problem with log which are corrupted and need help with
 hitcount and FORWARD rules
Date: Sat, 22 Oct 2011 17:01:47 +0100
Message-ID: <1319299307.26402.6352.camel@andybev-desktop>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	 <1319289600.26402.6260.camel@andybev-desktop>
	 <CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
	 <1319293517.26402.6312.camel@andybev-desktop>
	 <CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
	 <1319297250.26402.6316.camel@andybev-desktop>
	 <CACMGiwb3tXniJNt5vn6nBVqZjy8VUYWQkwg0GV=gVta5qzoaQw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319299305;
	bh=jFV38lAKTEs1qwWnJOvx4Bjyyyu8TEvcyPh6K25wHPs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=nQf7/WlqrsQoKoA2tCdxTDEBYgQhgNdI/abxxgVYuQgTD+O6/uNACYhbXYNVhjXT+
	 9CA0YJnGqVXYfX3tLiaa/G9lg/inLOX7rYil1DG8GEU+gDJOh6OImcR2fELTrYG7HO
	 dBJ2zdZSadebqklQjFnRmnMj4LepRmtk/gxmEE8U=
In-Reply-To: <CACMGiwb3tXniJNt5vn6nBVqZjy8VUYWQkwg0GV=gVta5qzoaQw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Azerty Ytreza <007liamg007@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2011-10-22 at 17:33 +0200, Azerty Ytreza wrote:
> **********************************************************************************************
> > Just mean gateway/firewall server that all the traffic passes through.
> >
> > No doesn't work ... The port is blocked when I try these rules (copy
> > of the INPUT rules) :
> >
> > iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> > NEW -m recent --set
> > iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> > NEW -m recent --update --seconds 600 --hitcount 1 -j DROP
> 
> You've got a hitcount of 1. Don't you mean 10 as you had in your first
> set of rules?

> Yes it's for test. The first time should work, the second request
> should be blocked for 600sec.

Hitcount matches when the number of packets is greater than or *equal*,
so defining a number of "1" will always match.

Also, hitcount refers to number of packets, so you'll need a rule in
there to only apply the DROP to NEW connections, otherwise you'll block
a successful connection as soon as that number of packets has been sent.

This website is quite good:

http://thiemonagel.de/2006/02/preventing-brute-force-attacks-using-iptables-recent-matching/

Although you'll have to change INPUT to FORWARD.

Andy


