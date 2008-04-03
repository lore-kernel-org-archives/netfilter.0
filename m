From: Bgs <bgs@bgs.hu>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 03 Apr 2008 16:40:42 +0200
Message-ID: <47F4EC6A.1080604@bgs.hu>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr> <47F4DE29.5000206@bgs.hu> <47F4DFF6.5000107@bgs.hu> <alpine.LNX.1.10.0804031613590.1301@fbirervta.pbzchgretzou.qr> <47F4EA96.1010004@bgs.hu> <alpine.LNX.1.10.0804031635250.1301@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804031635250.1301@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org


I have this in the kernel:

CONFIG_NF_CONNTRACK_ENABLED=y
CONFIG_NF_CONNTRACK=y


Jan Engelhardt wrote:
> 
> On Thursday 2008-04-03 16:32, Bgs wrote:
> 
>> Just recompiled the latest iptables (1.4.0) from vanilla source:
>>
>> root@db05:/usr/src/iptables# iptables -A INPUT -p tcp -m tcp 
>> --tcp-flags FIN,SYN,RST,ACK SYN -m connlimit --connlimit-above 20 
>> --connlimit-mask 32 -j DROP
>> iptables: Invalid argument
>> root@db05:/usr/src/iptables/root# dmesg
>> cannot load conntrack support for address family 2
> 
> Fix your kernel, you need connection tracking enabled. :D
> 
> 
> 
