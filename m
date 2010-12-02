From: "Fred Zwarts" <F.Zwarts@KVI.nl>
Subject: Re: ip6tables redirect
Date: Thu, 2 Dec 2010 15:55:51 +0100
Message-ID: <1F82E3373D994D9B8DECFD9435B37B49@WINDOWS.KVI.NL>
References: <26D8DC6230C54AACAA60179B4D5E132C@WINDOWS.KVI.NL> <alpine.LNX.2.01.1012021433430.5361@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

"Jan Engelhardt" jengelh@medozas.de wrote:
>> On Thursday 2010-12-02 13:15, Fred Zwarts wrote:
>> 
>>> We are moving from an IPv4 only environment to a mixed IPv4/IPv6
>>> environment. 
>>> On this server, we use for iptables a REDIRECT for the nat table.
>>> This does not work for ip6tables. It complains that it does not know
>>> the option --to-port. My question is how to do such a port redirect
>>> with ip6tables. 
>> 
>> Using -j TPROXY and appropriate local routing, I would say.

Thanks for the suggestion, but I cannot find documentation fro TPROXY,
nor for the local routing.

The IPV4 definition is as follows:

iptables -A PREROUTING -t nat -p tcp --dport 8080 -j REDIRECT --to-port 587

For ip6tables I tried:

ip6tables -A PREROUTING -t mangle -p tcp --dport 8080 -j TPROXY --on-port 587

and

ip6tables -A PREROUTING -t mangle -p tcp --dport 8080 -j TPROXY --to-port 587

But then it complains again that it does not know option --to-port or --on-port.
So, how should I specify the port to which the packet should be redirected?



