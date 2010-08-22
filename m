From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Sun, 22 Aug 2010 19:28:11 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008221927430.3855@obet.zrqbmnf.qr>
References: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr> <4C715667.9070008@pandora.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C715667.9070008@pandora.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bart De Schuymer <bdschuym@pandora.be>
Cc: netfilter@vger.kernel.org


On Sunday 2010-08-22 18:55, Bart De Schuymer wrote:
>> # brctl addbr br0
>> # brctl addif br0 tap1
>> # brctl addif br0 tap2
>> # ip a
>> 196: tap1: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>>    link/ether 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>> 197: tap2: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 500
>>    link/ether ce:61:28:5a:b7:93 brd ff:ff:ff:ff:ff:ff
>> 198: br0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN     link/ether
>> 9a:17:c4:65:e9:76 brd ff:ff:ff:ff:ff:ff
>>
>> Is this behavior normal that the lladdrs of all but the first brport
>> remain unchanged? If so, what is the purpose of changing the lladdr on the
>> first brport?
>>  
> I don't understand your question, but the Linux bridge code assigns the MAC
> address of its first-added port to the virtual bridge device.

1. Why does it do that,
2. Why only the first port?
