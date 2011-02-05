From: Andrew Beverley <andy@andybev.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 02:08:48 +0000
Message-ID: <1296871728.1616.12.camel@andybev>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus>  <4D4C0B8F.10005@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1296871731; bh=iAZDncmfxRBA5rn8ZTbG5KEwD9q+Hfoqw/4iq
	MPV158=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=Di5SNH2q
	A3iEEq0fJTgYLaEeQ484yN/3Rexe9THRLlZvRM6BdBR6C2WJcftWiaN/n65Z2b+Bdmo
	jY8iAd/OHvLoJi/GUgO6Ao0AAAvmiFaN5c/43SQW8EawlKOpiaVcAEtlQwJCp/Q2GtH
	uBQC8now5GlfFqMYYfkzgRzMzcNHk=
In-Reply-To: <4D4C0B8F.10005@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wilson <wilson@optimumwireless.com>
Cc: Marek Kierdelewicz <marek@piasta.pl>, netfilter@vger.kernel.org, Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>

On Fri, 2011-02-04 at 15:22 +0100, Michele Petrazzo - Unipex wrote:
> Marek Kierdelewicz ha scritto:
> >> Hello.
> >
> > Hi,
> >
> >> I recently wrote a script that adds a new rule for an ip address
> >> each time a new user is added to our network. I've noticed my tc
> >> rules work ... Our network has about 120 users in total not all of
> >>  these get connected Are these rules ok?
> >
> > If you have such linear ruleset (iptables marking+tc filter) for 120
> > users then it's will not work well. If my theory is right, check top
> > when there are more users logged in. You'll probably see hi cpu usage
> > in "si"/"hi" (software/hardware interrupt) fraction.
> >
> 
> I, are you sure about the big difference?
> I agree with you about tc u32 filters are better than iptables +
> marking, but like now I have about 100mbit 1k+ users with
> mangle+classify and tc+htb+egress and I have a load at about 0.2.
> My cpu are xeon 2.6 quad.
> 

I agree. My CPU load is very low for similar setups.

I think the problems that are being experienced are errors in the way
that HTB is being used (as per my last post). Although you might be able
to fix your problems by changing your scripts entirely as above, you
might want to try fixing your original scripts instead.

Andy


