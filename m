From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Sun, 15 May 2011 08:23:32 +0100
Message-ID: <1305444212.1921.714.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <4DC8775D.1080007@wildgooses.com>
	 <1305365024.1921.475.camel@andybev-desktop>
	 <4DCE8540.4060909@wildgooses.com>
	 <1305390543.1921.705.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305444212; bh=SDAzI9n2MEcSy5AJ+5IgNP/nrZYBReAb8KViL
	H0xkdk=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=VFWf0vOe
	0iU3FX98g/hWFbu0McdtbPkuCGH6vfIC/U5CZnEdTVd6LxmAaRIbDWqg2IRZm3Kgwdd
	UNwDyPcNNzUOaCsSrHBGjsGlFxiF8wPyJfplMwCrXweiCa7cQOTx8XszIOMsiTeJaBE
	uCuyQ8oF9/3Eebhyehk3EiAru6evM=
In-Reply-To: <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ed W <lists@wildgooses.com>, Netfilter <netfilter@vger.kernel.org>

On Sun, 2011-05-15 at 00:33 +0200, Jan Engelhardt wrote:
> On Saturday 2011-05-14 18:29, Andrew Beverley wrote:
> 
> >On Sat, 2011-05-14 at 14:36 +0100, Ed W wrote:
> >
> >Okay, I've played around with this myself using a similar scenario. It
> >looks to me like the packets *are* making it into the conntrack system.
> >
> >I tried setting a LOG target to match those packets with a ctstate of
> >RELATED:
> >
> >iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG
> >
> >And they were indeed logged. But there was no visibility of them using
> >the conntrack userspace program.
> 
> Does `conntrack -L` show anything for you at all? 

Yes, it shows the outgoing packets:

udp      17 23 src=10.0.10.206 dst=212.110.185.119 sport=35259 dport=53
packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
sport=53 dport=35259 packets=0 bytes=0 mark=0 secmark=0 use=2

But it doesn't show the "ICMP port unreachable" packets that are sent in
reply. The question is: should it show them?

> There is/was a 
> short intermediate time when it would not return anything.

Do you mean there was a time when a particular version of conntrack
would not return anything?

Andy


