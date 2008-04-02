From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: ip6tables icmp conntracking on 2.6.18 vs 2.6.24
Date: Wed, 2 Apr 2008 23:57:20 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804022357090.26216@fbirervta.pbzchgretzou.qr>
References: <20080402212653.GC11325@piper.oerlikon.madduck.net> <slrnfv7vhg.46d.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrnfv7vhg.46d.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Petr Pisar <petr.pisar@atlas.cz>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-02 23:44, Petr Pisar wrote:
>> I have two IPv6 hosts and while one can ping other hosts fine, the
>> other cannot. I use the simplest ip6tables configuration on both:
>>
>>   -P INPUT DROP
>>   -P FORWARD DROP
>>   -P OUTPUT ACCEPT
>>
>>   -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>>   -A INPUT -j LOG --log-prefix "[INPUT6]: "
>>
>> On a Debian sid host with 2.6.24, this works fine and my ping6
>> packets get answered.
>>
>> On the host running Debian etch with 2.6.18, the ping6's leave, are
>> answered, but the firewall then catches them:
>>
> ICMPv6 is used for neighborhood discovery (similar to ARP in IPv4).
> Therefore droping all new packets is bad idea because it will drop ND
> requestes from other link local stations.

Even so, it should not be INVALID but NEW.
