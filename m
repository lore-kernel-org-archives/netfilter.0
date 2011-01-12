From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Best way to kill a live TCP connection?
Date: Wed, 12 Jan 2011 01:20:29 +0100
Message-ID: <4D2CF3CD.1030704@netfilter.org>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C8374.70408@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org, support@iptables.info, Jan Engelhardt <jengelh@medozas.de>

On 11/01/11 17:21, Alessandro Vesely wrote:
> On 11/Jan/11 15:41, Jan Engelhardt wrote:
>> On Tuesday 2011-01-11 13:35, Alessandro Vesely wrote:
>>
>>> Hi all,
>>> this is clearly an overworked topic.  However, I haven't been able to
>>> find definitive info about it.  Please help providing more insight.
>>> In particular, if it is possible/convenient to design an RST injector
>>> and how to attach it to iptables?
>>
>> If you use a ruleset that emits RST for NEW connections that are picked 
>> up rather than SYN-new,
>>
>> -m conntrack --ctstate NEW -p tcp ! --syn --dport 22 -j REJECT 
>> --reject-with tcp-reset
>>
>> .. makes it possible to RST-kill connections using `conntrack -D`.
> 
> That's the most elegant method I've seen thus far.  Thanks a lot!
> 
> A generic rule like that (i.e. without --dport) is mentioned in the
> tutorial http://www.iptables.info/en/iptables-problems.html#NEWNOTSYN
> but I never realized it can be used this way.  (I CC this there.)

I'll try to add this to the conntrack-tools manual, it's indeed good.
