From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: MASQUERADE and ACCEPT targets
Date: Thu, 25 Feb 2010 10:59:03 +0100
Message-ID: <4B8649E7.20401@chello.at>
References: <cfeab66d1002240645i632227ccpbe8f3e55cebaf947@mail.gmail.com>	 <4B853E69.9040402@chello.at> <cfeab66d1002242001m6f3d4367m171577b852d8a590@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1002242001m6f3d4367m171577b852d8a590@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 25.02.2010 05:01, netfilter-owner@vger.kernel.org wrote:
>>>>>>>>>>>>> The nat table only sees state NEW packets.
> 
> my default policy for FORWARD chain is ACCEPT .i failed to describe my
> question .Sorry for my bad english .
> 
> 
> 
>                                        machine "B"
>                                     ------------------------------------------
>                                     |                                        |
>                                     |                                        |
> machine "A"   ------> eth0 |
>                                     |
>       eth1----------------------------------------> internet
>                                     |                                        |
>                                     |                                        |
>                                     ------------------------------------------
> 
> 
> 
> Suppose i browse "yahoo.com" from machine A. First sync packet is sent
> from machine A to Gateway machine "B"
> Packet state is NEW and masqueraded to eth1 . when a packet comes from
> internet back , state of packet is set as ESTABLISHED . After the
> state is truned to ESTABLISHED , do we really require MASQURADE rule
> for next packets ?
> 
> without this MASQUERADE target also , will the connection continue to work ?
> 
> Thanks,
> Ratheesh
> 
> 
> 
> 
> 
> 
> 
> On Wed, Feb 24, 2010 at 8:27 PM, Mart Frauenlob
> <mart.frauenlob@chello.at> wrote:
>> On 24.02.2010 15:45, netfilter-owner@vger.kernel.org wrote:
>>> All ,
>>>
>>>      R1)   iptables -t nat -I POSTROUTING -o eth0 -m state --state
>>> ESTABLISHED,RELATED -j ACCEPT
>>>      R2)   iptables -t nat -A POSTROUTING   -o eth0 -j MASQERADE
>>>
>>>
>>>                                         machine "B"
>>>                                      ------------------------------------------
>>>                                      |                                        |
>>>                                      |                                        |
>>> machine "A"   ------> eth0 |
>>> |eth1----------------------------------------> internet
>>>                                      |                                        |
>>>                                      |                                        |
>>>                                      ------------------------------------------
>>>
>>>  I applied rules R2 and i am able to browse internet from machine A .
>>>
>>>  1. Is there any problem if i apply R1 ?
>>>  2. if packet state become ESTABLISHED ( not a new packet ) , do we
>>> need MASQERADE target for remaing packets ???
>>>
>>> Thanks,
>>> Ratheesh
>>
>> The nat table only sees state NEW packets.
>> A rule with state "ESTABLISHED,RELATED" will never match there.
>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE is good (without
>> the typo).
>>
>> Do filtering (ACCEPT/DROP/REJECT) in the filter table.
>> iptables -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>> same for OUTPUT maybe.
>>
>> Best regards

Do you read the reply?
Did you understand it?
Does not look so.
Please go and learn netfilter basics. (netfilter.org,
http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html)

A simple g00gle search will give you ~ 120.000 results about masquerading:
http://www.google.at/search?q=iptables+nat+masquerade&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a

P.S. why CC me if i explicitly set the reply addr. to netfilter@....???

Bye bye

Mart

