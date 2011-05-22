From: Andrew Beverley <andy@andybev.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Sun, 22 May 2011 22:22:18 +0100
Message-ID: <1306099338.2741.317.camel@andybev-desktop>
References: <4DC7F632.9020105@wildgooses.com>
	 <4DC8775D.1080007@wildgooses.com>
	 <1305365024.1921.475.camel@andybev-desktop>
	 <4DCE8540.4060909@wildgooses.com>
	 <1305390543.1921.705.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
	 <1305444212.1921.714.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr>
	 <1305528208.2041.8.camel@andybev-desktop>
	 <alpine.LNX.2.01.1105160911240.4397@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1306099342; bh=e5X/omBudkjYbdyaEAXfJo7ryTzhN7nE14go2
	r4X/jk=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=kd9pgLRO
	xS2SMMxzHv0D7ph4j+MX9wEpP44kRjlUAwmcswCYaWLYk9ezNLfr2Tu4kWm+nhvX50u
	BOoBGN+TTVU7EGiFl5Qtps988kHwAht7iVWXQXmF71p7Rnx4+QQwBU8srGdPEUKLjOd
	AK32YRym3PDXZNsdNl0dFh+b3G7Ns=
In-Reply-To: <alpine.LNX.2.01.1105160911240.4397@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ed W <lists@wildgooses.com>, Netfilter <netfilter@vger.kernel.org>

Sorry, a bit late replying...

On Mon, 2011-05-16 at 09:23 +0200, Jan Engelhardt wrote: 
> On Monday 2011-05-16 08:43, Andrew Beverley wrote:
> >> >
> >> >Yes, it shows the outgoing packets:
> >> >
> >> >udp      17 23 src=10.0.10.206 dst=212.110.185.119 sport=35259 dport=53
> >> >packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
> >> >sport=53 dport=35259 packets=0 bytes=0 mark=0 secmark=0 use=2
> >> >
> >> >But it doesn't show the "ICMP port unreachable" packets that are sent in
> >> >reply. The question is: should it show them?
> >
> >Sorry, when I say it doesn't show them, I mean they are not counted.
> 
> They are:
> 
> >The ones in this case are coming in as RELATED.
> >> 
> >> Monitor with conntrack -E for details.
> >> 
> >conntrack -E -d 212.110.185.119 gives:
> >
> >    [NEW] udp      17 30 src=10.0.10.206 dst=212.110.185.119 sport=35676 dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53 dport=35676
> 
> Since it is a new/related CT (with sport=35676), the packets won't be counted
> towards the original ct (sport=35259).

I didn't make myself clear. The 2 different connections (and 2 different
source ports) were 2 separate tests, but exhibiting the same results. 

> 
> >[DESTROY] udp      17 src=10.0.10.206 dst=212.110.185.119 sport=35676 dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53 dport=35676
> 
> I observe that only UNREPLIED ones carry no counters - and that such is a
> minority of CT events - probably hinting to nonresponsive servers.
>  

The server responds, but with "ICMP port unreachable".

> >But conntrack -E -s 212.110.185.119 gives nothing
> 
> No connection was initiated (=packet first seen) from 212.110.185.119.

Correct, but an "ICMP port unreachable" was sent from 212.110.185.119.

To repeat the test:

iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG

dig google.com @212.110.185.119

Logged in the system logger:

[354578.512848] IN=wlan0 OUT= MAC=... SRC=212.110.185.119
DST=10.0.10.206 LEN=84 TOS=0x00 PREC=0x00 TTL=54 ID=36992 PROTO=ICMP
TYPE=3 CODE=3 [SRC=10.0.10.206 DST=212.110.185.119 LEN=56 TOS=0x00
PREC=0x00 TTL=53 ID=17592 PROTO=UDP SPT=53163 DPT=53 LEN=36 ] 

The only thing shown in conntrack -E is:

[NEW] udp      17 30 src=10.0.10.206 dst=212.110.185.119 sport=53163
dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53
dport=53163

And conntrack -L | grep 212.110.185.119 shows (in completion):

udp      17 22 src=10.0.10.206 dst=212.110.185.119 sport=53163 dport=53
packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
sport=53 dport=53163 packets=0 bytes=0 mark=0 use=1

So, the ICMP packets arrive as RELATED, but are not accounted for
looking at the conntrack accounting.

Andy


