From: Bgs <bgs@bgs.hu>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 03 Apr 2008 16:32:54 +0200
Message-ID: <47F4EA96.1010004@bgs.hu>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr> <47F4DE29.5000206@bgs.hu> <47F4DFF6.5000107@bgs.hu> <alpine.LNX.1.10.0804031613590.1301@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804031613590.1301@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

Just recompiled the latest iptables (1.4.0) from vanilla source:

root@db05:/usr/src/iptables# iptables -A INPUT -p tcp -m tcp --tcp-flags 
FIN,SYN,RST,ACK SYN -m connlimit --connlimit-above 20 --connlimit-mask 
32 -j DROP
iptables: Invalid argument
root@db05:/usr/src/iptables/root# dmesg
cannot load conntrack support for address family 2


Jan Engelhardt wrote:
> 
> (please keep the mailing list in Cc)
> 
> On Thursday 2008-04-03 15:47, Bgs wrote:
>>
>> Sorry for spamming, but forgot this from my previous mail:
>>
>> ip_tables: connlimit match: invalid size 32 != 16
>>
>> This is the error I get since 2.6.23 if I try the merged connlimit.
>>
> 
> Fix your iptables package, it still runs with the old connlimit.
> 
