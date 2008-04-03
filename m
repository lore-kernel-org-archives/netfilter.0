From: Bgs <bgs@bgs.hu>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 03 Apr 2008 15:39:53 +0200
Message-ID: <47F4DE29.5000206@bgs.hu>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

My problem is that it doesn't seem to work with the merged version:

iptables -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -m 
connlimit --connlimit-above 20 --connlimit-mask 32 -j DROP
iptables: Invalid argument

connlimit is compiled in:
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y


Jan Engelhardt wrote:
> 
> On Thursday 2008-04-03 14:08, Bgs wrote:
> 
>>
>> Greetings,
>>
>> I tried to compile the above setup but the compilation fails. I've 
>> seen this error with 2.6.23/2.6.24 kernels before but used 2.6.22.X in 
>> production. Has anything changed in the way to patch it?
> 
> pom is pretty much an ancient blob of code, being replaced by 
> xtables-addons. connlimit has been merged into mainline, btw.
> 
