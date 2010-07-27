From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: match streaming traffic in iptable rule
Date: Tue, 27 Jul 2010 19:28:27 +0200
Message-ID: <4C4F173B.9090606@chello.at>
References: <AANLkTinp9zca5i20tPmdYsieWr4uOj6KS2TAqREajno4@mail.gmail.com>	<alpine.LSU.2.01.1007271315290.2777@obet.zrqbmnf.qr> <AANLkTimharrKrfxKJNFrTJDpa4h8ADsYJvu1HfB1bHRM@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimharrKrfxKJNFrTJDpa4h8ADsYJvu1HfB1bHRM@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: =?UTF-8?B?TWFtYWRvdSBUb3Vyw6k=?= <e2ia.ci@gmail.com>

On 27.07.2010 18:34, Mamadou Tour=C3=A9 wrote:
[top posting fixed]

> 2010/7/27 Jan Engelhardt<jengelh@medozas.de>:
>> On Tuesday 2010-07-27 11:52, Mamadou Tour=C3=A9 wrote:
>>
>>> Hi, all
>>> how could i match all streaming protocole in my iptable rule.
>>
>> If you define what a streaming protocol is, you can transform this
>> definition into iptables rules.
>>
 > Can you tell me How.


The answer 42 - what is the question? :)

http://en.wikipedia.org/wiki/Stream_%28computing%29

--> http://en.wikipedia.org/wiki/Streaming_media#Protocol_issues


What protocol(s)?
man iptables --> -p|--protocol [--sport|--dport]

Unicast, Multicast?
man iptables --> addrtype

http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html
for the basics...


regards

Mart

P.S. it's called 'iptables' not 'iptable'.

