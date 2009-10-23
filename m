From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Disabling conntrack for local net
Date: Fri, 23 Oct 2009 08:22:22 +0200
Message-ID: <4AE14B9E.9050705@chello.at>
References: <034DEBCAE934A74991E6E76B8DA72D14185DD509DA@HSSBS.holdstead.local> <4AE13AA6.5080509@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AE13AA6.5080509@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> Gary Smith wrote:
>> We have several IP's NAT'd in from public interface.  Even with that 
>> we noticed that 80% or so of the connection entries appear to be 
>> local to local traffic.
>>
>> We have the following subnets
>>
>> 10.40.16.0/24 (NAT'd public)
>> 10.40.17.0/24 (internal data)
>> 10.40.18.0/24 (internal data)
>> 10.40.19.0/24 (internal data)
>> 10.40.20.0/24 (NAT'd public)
>>
>> Public internface NAT's mostly to 10.40.16.0/24 IP's, and a couple on 
>> the 10.40.20.0/24 IP's.  We have data/internal services on the 
>> 10.40.17.0/24 and 10.40.18.0/24.  We see lots of connections from the 
>> 10.40.16.0/24 to the data/internal getting entered into the conntrack 
>> (as you would normally expect). 
>> So, is there any benefit of not conntracking these?  Is so, how do I 
>> do that without breaking the NAT.
>>
>> I know I did this years ago, I just can't remember how.
>>   
>
> Benefit = No resources used on connection tracking
>
> -t raw -m -s x.x.x.x/zz -d y.y.y.y/zz -j NOTRACK
>
sorry, missed that:
or the RAWNAT target from the xtables addon if you used NAT.
