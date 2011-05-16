From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 16 May 2011 16:59:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105161655440.8681@frira.zrqbmnf.qr>
References: <4DC7F632.9020105@wildgooses.com>  <4DC8775D.1080007@wildgooses.com>  <1305365024.1921.475.camel@andybev-desktop>  <4DCE8540.4060909@wildgooses.com>  <1305390543.1921.705.camel@andybev-desktop>  <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
 <1305444212.1921.714.camel@andybev-desktop> <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr> <4DD1362D.6010107@wildgooses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DD1362D.6010107@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed W <lists@wildgooses.com>
Cc: Andrew Beverley <andy@andybev.com>, Netfilter <netfilter@vger.kernel.org>


On Monday 2011-05-16 16:35, Ed W wrote:
>> 
>> conntrack -L shows pseudo/NFCT-style connections, not packets. As for 
>> ICMP port unreachable, either its classification is
>> - INVALID, in which case there is no CT to show
>> - a reply, in which case it is part of the shown CT - and the event 
>> monitor will show an UPDATE
>> - RELATED, in which case a new CT is shown - and which may disappear 
>> shortly after due to a short lifetime - the event monitor should show 
>> NEW I think.
>
>I'm using "dnsmasq" with two upstream dns resolvers [...]
>The second answer is met with a 
>(presumably) kernel generated "unreachable" response since the UDP port has already 
>been closed after the faster [first] response is received
>
>So my test is "nslookup www.yahoo.co.uk" and both tcpdump and conntrack -E dumps are
>below:

Modern times - modern tools: host(1).

>For ease of reading, here are the conntrack connections relating to 10.94.230.137:
>
>    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110
[...]
>
>However, I don't see this packet accounted in that list above:
>10:49:54.126855 IP 10.94.230.137 > 8.8.8.8: ICMP 10.94.230.137 udp port 20110 unreachable, length 214

>This feels to me like a packet which has fallen between two
>situations. It's not a new connection so it didn't get logged as
>such. It's also kind of not obviously part of the existing
>connection so it doesn't get logged as such either?

Something like that. Check the state of this ICMP packet with -j
LOGMARK from Xtables-addons. I'd be interested in what it belongs to.
