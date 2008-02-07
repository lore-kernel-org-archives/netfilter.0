From: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Subject: Re: connlimit timeout average
Date: Thu, 07 Feb 2008 19:55:51 -0200
Message-ID: <47AB7E67.1010101@bspu.unibel.by>
References: <2301.5897-15286-1144045463-1202227021@seznam.cz> <47AB6847.4000405@bspu.unibel.by> <47AB7BD8.8040103@bspu.unibel.by>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47AB7BD8.8040103@bspu.unibel.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dzianis Kahanovich wrote:
> Something like this (average (TOO average) timeout, untested!)
   ^^^^^^^^^
Sorry, "10*60*HZ" = 10 min ;)). 10*HZ = 10 sec.


> 
> Dzianis Kahanovich wrote:
> 
>>> i would like to use connlimit module, but i don't know which version 
>>> of patch-o-matic should i use on which version of kernel and 
>>> iptables. Could someone help me?
>>> Thanks a lot
> 
>> Latest kernel & iptables. Connlimit now inside of kernel.
> 
>> PS But I lazy think about patch of connlimit to bound timeout. While 
>> users using keep-alive connections - there are too abstract 
>> classification (I use slowdown "abusers"). IMHO it is easy (in entry 
>> listing add one "if" with existing "timeout" field, but I use proxy 
>> too and first timout need for proxy, then I do not do nothing while - 
>> I do not know how to do it in squid).
>>
> 
> 


-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
