From: Martijn Lievaart <m@rtij.nl>
Subject: Re: iptables block samba or not?
Date: Thu, 24 Jan 2008 22:37:09 +0100
Message-ID: <47990505.9010209@rtij.nl>
References: <200801242017.m0OKH0lJ011470@indigo.cs.bgu.ac.il> <4798FF72.2020609@netoyen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4798FF72.2020609@netoyen.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mouss <mouss@netoyen.net>
Cc: netfilter@vger.kernel.org

mouss wrote:
> Eial Czerwacki wrote:
>> I've got this too has part of the rules
>>
>> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>>   
>
> but not for output. what if your linux box initiates the connection?

Output policy is accept, so this is no problem. The state match does not 
create contracks, it just tests them. The conntrack is created once the 
first packet is accepted.

>
> Also, as I said before, allow for icmp (echo if you add a stateful 
> accept for output icmp's if you don't have the stateful rule).


This is a matter of taste and has nothing to do with the OPs problems.

M4

