From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 16 May 2011 17:53:43 +0100
Message-ID: <4DD15697.4080505@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com>  <4DC8775D.1080007@wildgooses.com>  <1305365024.1921.475.camel@andybev-desktop>  <4DCE8540.4060909@wildgooses.com>  <1305390543.1921.705.camel@andybev-desktop>  <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr> <1305444212.1921.714.camel@andybev-desktop> <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr> <4DD1362D.6010107@wildgooses.com> <alpine.LNX.2.01.1105161655440.8681@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105161655440.8681@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Andrew Beverley <andy@andybev.com>, Netfilter <netfilter@vger.kernel.org>


>> So my test is "nslookup www.yahoo.co.uk" and both tcpdump and conntrack -E dumps are
>> below:
> 
> Modern times - modern tools: host(1).

Busybox...  :-(


>> This feels to me like a packet which has fallen between two
>> situations. It's not a new connection so it didn't get logged as
>> such. It's also kind of not obviously part of the existing
>> connection so it doesn't get logged as such either?
> 
> Something like that. Check the state of this ICMP packet with -j
> LOGMARK from Xtables-addons. I'd be interested in what it belongs to.

Because this is an embedded device and my build scripts are currently broken at the moment (being rewritten...), adding xtables-addons to the device is slightly tricky right now...

(I think I need some more linux development machines here...  All the other linux machines here are "production" servers... Hmm)


After some thought, this command line *seems* to reproduce the problem - would someone with LOGMARK available be kind enough to reproduce this:

	nslookup www.yahoo.co.uk & sleep 0.01 && killall nslookup


16:45:02.034285 IP 10.94.230.137.38407 > 8.8.8.8.domain: 2+ PTR? 8.8.8.8.in-addr.arpa. (38)
16:45:02.316397 IP 8.8.8.8.domain > 10.94.230.137.38407: 2 1/0/0 PTR google-public-dns-a.google.com. (82)
16:45:02.316522 IP 10.94.230.137 > 8.8.8.8: ICMP 10.94.230.137 udp port 38407 unreachable, length 118

[NEW] udp      17 30 src=10.94.230.137 dst=8.8.8.8 sport=38407 dport=53 [UNREPLIED] src=8.8.8.8 dst=10.94.230.137 sport=53 dport=38407
[UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.8.8 sport=38407 dport=53 src=8.8.8.8 dst=10.94.230.137 sport=53 dport=38407
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.8.8 sport=38407 dport=53 packets=1 bytes=66 src=8.8.8.8 dst=10.94.230.137 sport=53 dport=38407 packets=1 bytes=110

(Obviously s/nslookup/host/ as appropriate...)

This seems like a smaller reproducible test case?  The only caveat is that the "sleep x" be smaller than the RTT to the DNS server - using a real DNS server on the internet makes this straightforward.

Thanks

Ed W
