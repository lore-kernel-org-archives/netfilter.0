From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: [iptables] Effect of negating multiple source or dest IPs (-s  or -d)
Date: Wed, 09 Nov 2011 11:18:26 +1300
Message-ID: <5de257ed7b3f8c47dac2cea61ac84951@treenet.co.nz>
References: <j9bjgb$v1f$1@dough.gmane.org>
 <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch>
 <j9bkr5$a5f$1@dough.gmane.org>
 <alpine.LNX.2.01.1111081740580.18080@frira.zrqbmnf.qr>
 <j9bnrd$372$1@dough.gmane.org>
 <alpine.DEB.2.00.1111082112340.31624@blackhole.kfki.hu>
 <j9c8o9$3rp$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j9c8o9$3rp$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

 On Tue, 08 Nov 2011 22:59:37 +0100, U.Mutlu wrote:
> Jozsef Kadlecsik wrote, On 2011-11-08 21:22:
>> On Tue, 8 Nov 2011, U.Mutlu wrote:
>>
>>> Jan Engelhardt wrote, On 2011-11-08 17:44:
>>>> On Tuesday 2011-11-08 17:19, U.Mutlu wrote:
>>>>
>>>>> sim@netmess.org wrote, On 2011-11-08 17:16:
>>>>>>> What's the effect of this rule on a multihomed box
>>>>>>> (the IPs below are just some examples, not real):
>>>>>>>
>>>>>>>      iptables -A INPUT ! -d 1.2.3.4,2.3.4.5 -p all -j DROP
>>>>>>>
>>>>>>
>>>>>> the newest version of iptables says:
>>>>>>
>>>>>> iptables v1.4.12.1: ! not allowed with multiple source or 
>>>>>> destination IP
>>>>>> addresses
>>>>>
>>>>> Oh, one wonders why they did so...
>>>>
>>>> Because it leads to a confusing result.
>>>>
>>>> 	! -d a,b,c
>>>>
>>>> could be reasonably interpreted as
>>>>
>>>> 	! -d a&&   ! -d b&&   ! -d c
>>>>
>>>> but because using "," in -s/-d means a simple rule expansion, it
>>>> actually generates an equivalent of
>>>>
>>>> 	! -d a || ! -d b || ! -d c
>>>
>>> But OR'ing them IMHO doesn't make much sense, just think about it.
>>> I would suggest to AND them.
>>> Look, a normal rule like this one
>>>    iptables -A INPUT -m state --state NEW -p tcp --dport  80 -j 
>>> ACCEPT
>>> matches only if every single part of it matches (ie. AND).
>>> Then in our negation case above it should behave similar,
>>> and not switch to OR.
>>
>> The matches are AND-ed. However the individual matches may generate 
>> OR
>> conditions, like multiport.
>>
>> What you suggest means that while
>>
>> 	-d a,b
>>
>> is interpreted as "a" OR "b", then
>>
>> 	! -d a,b
>>
>> should be interpeted as NOT "a" AND NOT "b".
>>
>> I think that'd be pretty confusing.

 As opposed to interpreting both as "any of this set":

  (a OR b)
 versus
   NOT (a OR b)

 Which can be stated in the docs.

 Confusion and clarity is just a matter of having the right description. 
 A technical reason should be the only blocker here.

 AYJ
