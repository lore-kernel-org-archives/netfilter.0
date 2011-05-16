From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 16 May 2011 07:43:28 +0100
Message-ID: <1305528208.2041.8.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <4DC8775D.1080007@wildgooses.com>
	 <1305365024.1921.475.camel@andybev-desktop>
	 <4DCE8540.4060909@wildgooses.com>
	 <1305390543.1921.705.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
	 <1305444212.1921.714.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305528211; bh=66gNCass9VYl1LLypkdDCfsFn1osg53zMVgNV
	Gka/EU=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=FxSyllV3
	busuX5AnyQVjxHEd4Am06VoAzM02OcXpAsynUnXmVVN2I4fNFzxGbcQVD7jJzngD8Su
	Cs21LYhtvV1ZENdT9nEXCcfTgtaZ1DouQ+ZynM2vkVN0ULGFcLm+Gw/XaB3B1WE0p0R
	dUju3Gf4Fioou/3wgh/5cHdNYWmV8=
In-Reply-To: <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ed W <lists@wildgooses.com>, Netfilter <netfilter@vger.kernel.org>

On Sun, 2011-05-15 at 11:08 +0200, Jan Engelhardt wrote: 
> On Sunday 2011-05-15 09:23, Andrew Beverley wrote:
> 
> >On Sun, 2011-05-15 at 00:33 +0200, Jan Engelhardt wrote:
> >> On Saturday 2011-05-14 18:29, Andrew Beverley wrote:
> >> 
> >> >On Sat, 2011-05-14 at 14:36 +0100, Ed W wrote:
> >> >
> >> >Okay, I've played around with this myself using a similar scenario. It
> >> >looks to me like the packets *are* making it into the conntrack system.
> >> >
> >> >I tried setting a LOG target to match those packets with a ctstate of
> >> >RELATED:
> >> >
> >> >iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG
> >> >
> >> >And they were indeed logged. But there was no visibility of them using
> >> >the conntrack userspace program.
> >> 
> >> Does `conntrack -L` show anything for you at all? 
> >
> >Yes, it shows the outgoing packets:
> >
> >udp      17 23 src=10.0.10.206 dst=212.110.185.119 sport=35259 dport=53
> >packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
> >sport=53 dport=35259 packets=0 bytes=0 mark=0 secmark=0 use=2
> >
> >But it doesn't show the "ICMP port unreachable" packets that are sent in
> >reply. The question is: should it show them?
> 
> conntrack -L shows pseudo/NFCT-style connections, not packets.

Sorry, when I say it doesn't show them, I mean they are not counted. The
conntrack entry for that connection only shows a packet count in one
direction. It shows zero in the other direction.

> As for 
> ICMP port unreachable, either its classification is
> - INVALID, in which case there is no CT to show
> - a reply, in which case it is part of the shown CT - and the event 
> monitor will show an UPDATE
> - RELATED, in which case a new CT is shown - and which may disappear 
> shortly after due to a short lifetime - the event monitor should show 
> NEW I think.

The ones in this case are coming in as RELATED.

> 
> Monitor with conntrack -E for details.
> 

conntrack -E -d 212.110.185.119 gives:

    [NEW] udp      17 30 src=10.0.10.206 dst=212.110.185.119 sport=35676 dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53 dport=35676
[DESTROY] udp      17 src=10.0.10.206 dst=212.110.185.119 sport=35676 dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53 dport=35676

But conntrack -E -s 212.110.185.119 gives nothing

So they do not seem to be counted anywhere.

> >> There is/was a 
> >> short intermediate time when it would not return anything.
> >
> >Do you mean there was a time when a particular version of conntrack
> >would not return anything?
> 
> Yes, see kernel commit cba85b532e4aabdb97f44c18987d45141fd93faa that 
> (the fix) for details.

I upgraded the kernel to 2.6.38.6 just in case, but the same still
happens.

Thanks,

Andy


