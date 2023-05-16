From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 13:17:26 +0200
Message-ID: <d44062c5-afd3-243f-9ba9-11a85c4d5034@thelounge.net>
References: <CAF_hPjN0pV9w+RmO8rkSnNwd-2+ep6vmy-7JaREvUFSyNzuGhg@mail.gmail.com>
 <81765c91-cfc1-cf1a-8d34-c69dea29e2af@thelounge.net>
 <CAF_hPjOsjMJqvgPLSgfzLqaQ21GTvLUXGNmHCCkxHEbvNCo1ZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAF_hPjOsjMJqvgPLSgfzLqaQ21GTvLUXGNmHCCkxHEbvNCo1ZQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Shane Wang <xwang4396@gmail.com>
Cc: netfilter@vger.kernel.org



Am 16.05.23 um 13:07 schrieb Shane Wang:
> Thanks for your reply.
> 
> I think the "--to-destination 10.0.0.1" rule will be matched, and the
> "--to-destination 10.0.0.2" rule will never be matched.
> Does iptables unsupported "full cone" NAT for multiple internal IP addresses?

what you want is simply not possible at all - no matter what software

either you have specific port-forwardings or you need different 
public-ips for a 1:1 mapping of all ports

common sense: when you have only one public IP how do you imagine a 
decision for NEW packets and how do you imageine a ruleset working when 
it can't make decisions?

ESTABLISHED/RELATED are different beasts but they don't need forwarding 
at all - conntrack knows where they belong

but for forwarding of NEW packets you need to make rules based on unique 
criteria which you don't have when you don#t use specific portforwarding 
or don#t have a distinct public IP

> Reindl Harald <h.reindl@thelounge.net> 于2023年5月16日周二 18:15写道：
>>
>> Am 16.05.23 um 11:58 schrieb Shane Wang:
>>> Hi folks,
>>>
>>> I have found a solution on
>>> https://www.joewein.net/info/sw-iptables-full-cone-nat.htm, which
>>> works fine for a single internal IP address. However, I am struggling
>>> to configure "full cone" NAT for multiple internal IP addresses using
>>> iptables.
>>>
>>> I have tried the following rules, but they do not seem to work:
>>>
>>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.170
>>> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
>>> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2
>>
>> how do you imagine two contradicting rules to work?
>> roll a dice between 10.0.0.1 and 10.0.0.2?
