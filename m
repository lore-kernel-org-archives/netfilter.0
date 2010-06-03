From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Advanced Logging
Date: Thu, 03 Jun 2010 22:17:15 +0200
Message-ID: <4C080DCB.9020507@chello.at>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>	<AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com> <AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On 03.06.2010 20:15, ratheesh k wrote:
> 2010/5/30 Tom=C3=A1=C5=A1 Vl=C4=8Dek <tomasvlcek@gmail.com>:


>>>           I have implemented  firewall  in my linux machine using
>>> iptables . It is able to prevent attacks and LOG just before droppi=
ng
>>> packets . Since i know a little about iptables , i could go thru
>>> /var/log/messages and find out information about attacks . Is there
>>> any application which will analyze logs and  give a brief informati=
on
>>> to user about the attacks  ?
>>>
>>> For example , suppose there was a syn flood attack ,the application
>>> should analyse the /var/log/messages or by some means should know
>>> about the attack and let the user know about that .If there is no
>>> application ,  could you give some hints on how to develop an
>>> application .Any comment is  appreciated .


>> Maybe psad (Port Scan Attack Detector) is that what are you looking
>> for. Check http://cipherdyne.org/psad/index.html.
>
> I gone through the link . It seems to be heavy for my embedded
application .
>
> My embedded box is a router with two inerfaces - wan0 and lan0 . I
> should get information regarding various attacks tried on lan clients
> .I have some implementation in mind .(see below )
>
> 1  Is there any tool fit my requirement or  there any tool , i can do
> a little  modification in code   and use .
> 2 . Is my idea feasible to implement ? . Is it worth implementing ,
> because it is run as part of softirq_rx kernel thread . Will it dampe=
n
> performance ?
> 3 . Could i do this as part of connection tracking module . If , coul=
d
> you guide  a little ?
>
snort (snort.org) comes into my mind here.
afaik it has the ability to create inline iptables rules.
maybe worth a look?


best regards

mart
