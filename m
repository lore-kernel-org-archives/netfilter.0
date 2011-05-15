From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: High accuracy bandwidth accounting?
Date: Sun, 15 May 2011 11:08:20 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr>
References: <4DC7F632.9020105@wildgooses.com>  <4DC8775D.1080007@wildgooses.com>  <1305365024.1921.475.camel@andybev-desktop>  <4DCE8540.4060909@wildgooses.com>  <1305390543.1921.705.camel@andybev-desktop>  <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
 <1305444212.1921.714.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305444212.1921.714.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Ed W <lists@wildgooses.com>, Netfilter <netfilter@vger.kernel.org>

On Sunday 2011-05-15 09:23, Andrew Beverley wrote:

>On Sun, 2011-05-15 at 00:33 +0200, Jan Engelhardt wrote:
>> On Saturday 2011-05-14 18:29, Andrew Beverley wrote:
>> 
>> >On Sat, 2011-05-14 at 14:36 +0100, Ed W wrote:
>> >
>> >Okay, I've played around with this myself using a similar scenario. It
>> >looks to me like the packets *are* making it into the conntrack system.
>> >
>> >I tried setting a LOG target to match those packets with a ctstate of
>> >RELATED:
>> >
>> >iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG
>> >
>> >And they were indeed logged. But there was no visibility of them using
>> >the conntrack userspace program.
>> 
>> Does `conntrack -L` show anything for you at all? 
>
>Yes, it shows the outgoing packets:
>
>udp      17 23 src=10.0.10.206 dst=212.110.185.119 sport=35259 dport=53
>packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
>sport=53 dport=35259 packets=0 bytes=0 mark=0 secmark=0 use=2
>
>But it doesn't show the "ICMP port unreachable" packets that are sent in
>reply. The question is: should it show them?

conntrack -L shows pseudo/NFCT-style connections, not packets. As for 
ICMP port unreachable, either its classification is
- INVALID, in which case there is no CT to show
- a reply, in which case it is part of the shown CT - and the event 
monitor will show an UPDATE
- RELATED, in which case a new CT is shown - and which may disappear 
shortly after due to a short lifetime - the event monitor should show 
NEW I think.

Monitor with conntrack -E for details.

>> There is/was a 
>> short intermediate time when it would not return anything.
>
>Do you mean there was a time when a particular version of conntrack
>would not return anything?

Yes, see kernel commit cba85b532e4aabdb97f44c18987d45141fd93faa that 
(the fix) for details.
