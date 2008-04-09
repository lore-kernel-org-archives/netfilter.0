From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Success routing mark'ed packets - but still confused why it
 didn't work the first time....
Date: Wed, 9 Apr 2008 23:14:07 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804092310390.17930@fbirervta.pbzchgretzou.qr>
References: <ftgq9j$mf$1@ger.gmane.org> <alpine.LNX.1.10.0804090612580.2229@fbirervta.pbzchgretzou.qr> <ftj951$3cv$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ftj951$3cv$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-09 22:32, Eric B. wrote:
>>
>> Make sure you do not set a mark in an input/prerouting
>> chain so that it accidentally hits the routing rule
>> because that would mean incoming packets are diverted
>> before they reach the machine.
>
>But isn't that exactly what you are doing in your NF-Cookbook.txt?  You 
>have:
>-t mangle -A PREROUTING -j CONNMARK --restore-mark
>Isn't that setting the mark in the prerouting table?

Yes...

>Or do you do it that 
>way since the local routing table is the first table, and any packets 
>destined for this machine will be accepted anyhow?

On the very first packet, the incoming interface (or some other kind
of parameter perhaps) is recorded by setting a connection mark. This
connection mark is then copied to all packets in a given direction so
as to route them into the interface they first one came from, for
example. Because the connection mark is only set once, it can be
assured that all packets will get the same mark.

>> The mark is maintained during the life of the packet (until you change it
>> of course).
>>
>>> including the machine's response to that
>>>packet?
>>
>> Response is a new packet. Only the ctmark (connection mark)
>> can "survive" here.
>
>Do the ip rules based on the fwmark work on the individual packet's mark 
>value or the conntrack mark, or both?

routing rules work on packet mark ("nfmark" "fwmark"), whch is
why --restore-mark is needed.
