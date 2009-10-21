From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Query: Stateful parameters Explicitly and Implicitly defined,
 which is it?
Date: Wed, 21 Oct 2009 12:08:07 +0200
Message-ID: <4ADEDD87.3020203@chello.at>
References: <4ADE2689.4070707@tssg.org> <4ADEBF52.7050602@chello.at> <4ADECA4A.5000907@tssg.org> <4ADED583.1060407@chello.at> <4ADED869.2000200@tssg.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADED869.2000200@tssg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
> Mart Frauenlob wrote:
>>>
>>>> Usually I normalize TCP traffic, even before it hits the rules for 
>>>> the servers, but if i wouldn't do it globally, I'd rather write the 
>>>> rule like this:
>>>> iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -m 
>>>> state --state NEW -j ACCEPT
>>>>
>>> I see your using stateful operators also in the above rule. Why 
>>> would there be a need to use the stateless SYN flag operator given 
>>> the NEW operaror implicitly handles this?
>>>
>>
>> Because NEW to the connection tracker means any new packet, which is 
>> not ESTABLISHED,RELATED, or INVALID.
>> So it's not necessarily a tcp syn packet. Explicitly defining  -m tcp 
>> --syn makes sure it's a valid tcp connection attempt.
> I understand you now, I hope!
>
> Although, given the protocol is TCP we know explicitly its not a UDP 
> new connection attempt. But forcing the syn check ensures that the 
> particular TCP packet is the kind we want.
>
> So in all, its a further set of "checks and balances" that provide 
> additional security, perhaps from various packet crafting situations 
> where a packet may have both the syn and ack for example set.
>
>> That's why I talked about normalizing  the tcp traffic. Many rulesets 
>> place a rule like this (quite on top) to remove bad tcp packets:
>> iptables -N bad_tcp
>> iptables -A bad_tcp -p tcp ! --syn -m state --state NEW -j DROP
>>
>> for c in INPUT FORWARD; do
>>    iptables -A $c -p tcp -j bad_tcp
>> done
>>
Yes another common rule that's on top of the bad_tcp chain is:
 -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -j REJECT 
--reject-with tcp-reset

but you can read that in the tutorials ;-)

>> You might check out the iptables tutorial on frozentux, which may 
>> answer many of your questions:
>> http://www.frozentux.net/documents/iptables-tutorial/
>>
>> and also read this:
>> http://jengelh.medozas.de/documents/Perfect_Ruleset.pdf
>>
> perfect, thanks.

Regards

Mart
