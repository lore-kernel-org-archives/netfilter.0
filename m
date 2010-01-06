From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Squid Redirection
Date: Wed, 06 Jan 2010 11:12:27 +0100
Message-ID: <4B44620B.4040903@chello.at>
References: <8ec0428d1001041031t5362a011ie9c19ff589cb38c@mail.gmail.com>	 <4B4235A3.2010409@wow-ia.net> <8ec0428d1001051445j60c7a32q25d34e8b0db7560a@mail.gmail.com> <4B43CA2B.40309@wow-ia.net> <4B445AAE.2060501@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B445AAE.2060501@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 06.01.2010 10:41, Mart Frauenlob wrote:
> On 06.01.2010 00:24, Kenneth Sande wrote:
>> Aaron Clausen wrote:
>>> On Mon, Jan 4, 2010 at 10:38, Kenneth Sande <sandekt@wow-ia.net> wrote:
>>>  
>>>> I do it this way for my one internal subnet. There may be more and
>>>> better
>>>> options, but this works for me.
>>>>
>>>> "iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s ${INT_NETWORK}
>>>> -p tcp
>>>> --dport 80 --sport 1024:65535 -m state --state
>>>> NEW,ESTABLISHED,RELATED -j
>>>> REDIRECT --to-port 3128"
>>>>
>>>> Squid must also be set up to accept transparent connections.
>>>>     
>>>
>>> Thanks.  Now for another question.  I have about a dozen workstations
>>> that I want to bypass squid (they are in the same subnet as the
>>> workstations that I want traffic sent through squid).  Reading squid's
>>> documentation, they recommend that this be done at the client end or
>>> via iptables.  What's the rule to allow these hosts to bypass squid?
>>>
>>>   
>> What I do is have a special portion of my subnet set aside for
>> "unfiltered" access, and I just put an ACCEPT chain in for that portion
>> before the REDIRECT for the whole subnet.
>> So it looks similar to this:
>>
>> "iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s
>> ${INT_NOSQUID-NETWORK} -p tcp
>> --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED
>> -j ACCEPT"
>>
>> "iptables -t nat -A PREROUTING -i ${INT_INTERFACE} -s ${INT_NETWORK} -p tcp
>> --dport 80 --sport 1024:65535 -m state --state NEW,ESTABLISHED,RELATED -j
>> REDIRECT --to-port 3128"
>>
> 
> nat table rules 'see' only state 'NEW' packets.
> Better do filtering in the filter table.
> 
> You could use the 'iprange' if the hosts are not in a complete subnet.
> If that does not match, you could use ipset and the set match.
> 
> ipset -N no_squid ipmap
> 
> ...add hosts to ipset: ipset --add no_squid ...
> 
> iptables -t nat -A PREROUTING -i ... -m set ! --match-set no_squid -j
> REDIRECT ...
> 

sorry, forgot the set flag :/
iptables -t nat -A PREROUTING -i ... -m set ! --match-set no_squid src
-j REDIRECT ...

