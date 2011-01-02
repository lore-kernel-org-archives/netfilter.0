From: Andrew Beverley <andy@andybev.com>
Subject: Re: limit badwidth not working
Date: Sun, 02 Jan 2011 16:43:20 +0000
Message-ID: <1293986600.1936.46.camel@steve-pc>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl>
	 <BAY145-ds9975844F1691A3B9C49EAF3010@phx.gbl>
	 <1293898085.1601.29.camel@andybev>
	 <BAY145-ds16C678B220343FEE352F61F3060@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1293986603; bh=EEqrnCV3pWRknZ4kEswge1mMShVgazLwzvjG7
	sI7mKc=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=X0R2UOT6
	y6Uh5Ickdd6fDFHlnF4NZi256sM1BF+VZz08lb8UVhgomLaAVpFQ4bjC0NUNwxPB8f7
	gPV7oTURlXyA0+gCF2CyFLN5uPKVxaLcy+Zulv0DYFCKfAghuoUq7255y391eT5SPCg
	oEnlXDjq23vSRiTddkgoiXSMMQH5k=
In-Reply-To: <BAY145-ds16C678B220343FEE352F61F3060@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: J Webster <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

On Sun, 2011-01-02 at 16:18 +0100, J Webster wrote:
> > On Tue, 2010-12-28 at 12:12 +0100, J Webster wrote:
> >> I have a setup where uisers connect by VPN and are given IP addresses in 
> >> the
> >> range 10.8.0.xxx
> >
> > I can't advise on the VPN aspects of this, but see below for some
> > general comments.
> >
> >> I would like to limit their bandwidth to 1.5Mbps per IP address. 

<rant> Please don't top post. Even better, please also use an email
client that does proper quoting </rant>

> Do you know of any tutorials on this with examples? I've looked through the 
> main tc tutorials and they are pretty hard to follow.
> 

I found the following webpage to be really useful:

http://www.opalsoft.net/qos/DS-28.htm

> Re connections, my network is 100Mbps, I want to leave that as unlimited so 
> their is no overall bucket level.
> Users connect to the VPN and each of the IP addresses connected to the VPN 
> should have a limit of 1.5Mbps.
> 

The following is untested, but should give you an idea. $DEV should be
the *outbound* device, on the local network side, not the internet side.

# Add root qdisc
tc qdisc add dev $DEV root handle 1: htb

# Add parent class. The limit here should add up to all the leaf classes
tc class add dev $DEV parent 1: classid 1:1 htb rate 4.5mbit burst 15k

# Add leaf classes, each with 1.5mbit limit
tc class add dev $DEV parent 1:1 classid 1:10 htb rate 1.5mbit ceil 1.5mbit
tc class add dev $DEV parent 1:1 classid 1:20 htb rate 1.5mbit ceil 1.5mbit
tc class add dev $DEV parent 1:1 classid 1:30 htb rate 1.5mbit ceil 1.5mbit
...

# Add a filter to each leaf class to pipe in the traffic for each IP address
U32="tc filter add dev $DEV protocol ip parent 1:0 prio 1 u32"
$U32 match ip dst 10.0.8.1 flowid 1:10
$U32 match ip dst 10.0.8.2 flowid 1:20
$U32 match ip dst 10.0.8.3 flowid 1:30
...


Andy


