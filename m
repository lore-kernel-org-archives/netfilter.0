From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 16 May 2011 09:23:22 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105160911240.4397@frira.zrqbmnf.qr>
References: <4DC7F632.9020105@wildgooses.com>  <4DC8775D.1080007@wildgooses.com>  <1305365024.1921.475.camel@andybev-desktop>  <4DCE8540.4060909@wildgooses.com>  <1305390543.1921.705.camel@andybev-desktop>  <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
  <1305444212.1921.714.camel@andybev-desktop>  <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr> <1305528208.2041.8.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305528208.2041.8.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Ed W <lists@wildgooses.com>, Netfilter <netfilter@vger.kernel.org>


On Monday 2011-05-16 08:43, Andrew Beverley wrote:
>> >
>> >Yes, it shows the outgoing packets:
>> >
>> >udp      17 23 src=10.0.10.206 dst=212.110.185.119 sport=35259 dport=53
>> >packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
>> >sport=53 dport=35259 packets=0 bytes=0 mark=0 secmark=0 use=2
>> >
>> >But it doesn't show the "ICMP port unreachable" packets that are sent in
>> >reply. The question is: should it show them?
>
>Sorry, when I say it doesn't show them, I mean they are not counted.

They are:

>The ones in this case are coming in as RELATED.
>> 
>> Monitor with conntrack -E for details.
>> 
>conntrack -E -d 212.110.185.119 gives:
>
>    [NEW] udp      17 30 src=10.0.10.206 dst=212.110.185.119 sport=35676 dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53 dport=35676

Since it is a new/related CT (with sport=35676), the packets won't be counted
towards the original ct (sport=35259).

>[DESTROY] udp      17 src=10.0.10.206 dst=212.110.185.119 sport=35676 dport=53 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206 sport=53 dport=35676

I observe that only UNREPLIED ones carry no counters - and that such is a
minority of CT events - probably hinting to nonresponsive servers.
 
>But conntrack -E -s 212.110.185.119 gives nothing

No connection was initiated (=packet first seen) from 212.110.185.119.
Note that -s filters on an NFCT tuple's address, not packet address.

