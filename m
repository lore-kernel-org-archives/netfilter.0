From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: [Bulk] Re: a missing rule / incomplete routing
Date: Mon, 18 Aug 2014 09:01:38 +0530
Message-ID: <53F1739A.6040503@atc.tcs.com>
References: <53E8946F.2070403@yahoo.co.uk> <53E8AEE0.60800@atc.tcs.com> <53EB3C1B.60702@yahoo.co.uk> <53EB480F.30103@atc.tcs.com> <53EDEF36.2020805@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53EDEF36.2020805@yahoo.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lejeczek <peljasz@yahoo.co.uk>
Cc: netfilter <netfilter@vger.kernel.org>

On 08/15/2014 04:59 PM, lejeczek wrote:
> yes, 172.17.166.199 replies,
> to sort of narrow it down a bit
> I on box B do
> ping -I 172.25.12.101 172.17.166.199 = replies
> ping -I 192.168.2.100 172.17.166.199 = does not
>
> on a box behind B's 192.168.2.65, eg  on 192.168.2.81 (winbox)
> ping 172.17.167.41 = replies
>
> feels like B's local routing, but where exactly?? no idea I have

You can try the following to debug the problem:

While the "ping -I 192.168.2.100 172.17.166.199" is in progress, please 
run tcpdump on Box A (172.17.166.199) and observe.

1. If you are seeing the ICMP request with source IP 192.168.2.100, 
however no ICMP reply seen on Box A, then either Box A doesn't have 
route to 192.168.2.100, or Box A's iptables may block the reply.

2. If you are seeing both ICMP request and reply on Box A, but the reply 
is not reaching Box B, most probably the intermediate machines don't 
have route to 192.168.2.0/24.
In that case, one possible solution would be creating tunnel between Box 
A and Box B to reach 192.168.2.0/24 network.

> my routing tables:
>
>         main:
>
> default dev em3  scope link
> $publicNet.0/24 dev em3  proto kernel  scope link  src $publicNet.75
> 172.25.12.0/24 dev em2  proto kernel  scope link  src 172.25.12.203
> 192.168.2.0/24 dev em1  proto kernel  scope link  src 192.168.2.100
> 192.168.2.10 dev ppp0  proto kernel  scope link  src 192.168.2.100
> 192.168.2.64/27 dev br0  proto kernel  scope link  src 192.168.2.65
>
>         private:
>
>
>         internal:
>
> 172.0.0.0/8 dev em2  scope link
> 192.168.4.0/24 via 172.25.12.215 dev em2
>
>         external:
>
> default via $publicNet.62 dev em3
> $publicNet.0/24 dev em3  scope link
> 172.25.12.214 dev em2  scope link
> 192.168.2.64/27 dev br0  scope link
>
> 0:      from all lookup local
> 32763:  from 172.0.0.0/8 lookup internal
> 32764:  from $publicNet.0/24 lookup external
> 32766:  from all lookup main
> 32767:  from all lookup default
>
> interfaces:
> em1 192.168.2.100
> em2 172.25.12.203
> em3 $publicIP
> br0 192.168.2.65
>
> geee...

I couldn't find anything wrong/inconsistent in the above routing 
configuration.


Regards,
Vignesh


>
> On 13/08/14 12:12, Vigneswaran R wrote:
>> When you say "a 192.168.2.81 from behind box B can 
>> ping172.17.166.199" (in your first mail), do you mean both the 
>> following happen?
>>
>> 1) the icmp request from 192.168.2.81 is able to reach 
>> 172.17.166.199, and
>> 2) the icmp reply from 172.17.166.199 is able to reach 192.168.2.81
>>
>> In case, the 2nd is not happening, most probably the routers in 
>> between (which are not in your control) not having route for 
>> 192.168.x.x network. In that case, you may have to create a tunnel 
>> (or use VPN) between Box A and Box B to connect to 192.168.x.x network.
>>
>>
>> Regards,
>> Vignesh
>>
>> On 08/13/2014 03:51 PM, lejeczek wrote:
>>> I have had:
>>> -A FORWARD -i em1 -o em2 -m state --state NEW -j ACCEPT
>>> -A FORWARD -i em2 -o em1 -m state --state NEW -j ACCEPT
>>> besides, also usual
>>> -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>>> -A FORWARD -p icmp -j ACCEPT
>>>
>>> one strange thing is that when I tracepath on box B I see traffic 
>>> (to box A 172.17.167.x) wants to go out via em3(another psyh interface)
>>>
>>> if it might be routing, then
>>> I have 3 man made routing tables, one for each interface
>>> private 192.xxxx
>>> internal 172.xxx
>>> external a public IP
>>>
>>> I've left out private (empty, no rules no routes) for I thought 
>>> kernel would take care of it,
>>> which it does (well, to certain extent) eg. 172.25.12.x net get to 
>>> box B's 192.168.2.100 and behind (this is internal table route rules)
>>> but eg. 172.17.x.x  which essentially goes through the same phys0 
>>> cannot get to box B's 192.168.2.100 (but can to box B's 172.25.12.101)
>>>
>>> there are router(s) between 172.x.x.x (not mine) but then as above 
>>> they all can get to box B's psyh0 172.25.12.101
>>>
>>> it's all a bit weird to me
>>>
>>>
>>> On 11/08/14 12:54, Vigneswaran R wrote:
>>>> On 08/11/2014 03:31 PM, lejeczek wrote:
>>>>> dear experts
>>>>>
>>>>> I'm looking for ideas/suggestion why the following does not work
>>>>>
>>>>> there is a:
>>>>> * box A - 172.17.166.199 --  then there is 172./8 net -- box B - 
>>>>> 172.25.12.101 (phys0), 192.168.2.100 (phys1) -- and one more net 
>>>>> behind 192.168.2.100
>>>>>
>>>>> a 192.168.2.81 from behind box B can ping172.17.166.199
>>>>> but not the other way around, box A cannot get to box B's phys1 
>>>>> but it does get to phys0
>>>>>
>>>>> I can control box A but have no control over the nets between it 
>>>>> and box B's phys0
>>>>> I can control box B
>>>>>
>>>>> I thought my route rules on box B are complete, box A is a winbox
>>>>> I though box B' firewall is ready
>>>>> but I obviously miss something
>>>>>
>>>>> there is no masquerading for phys0 nor phys1 one box B
>>>>
>>>> It looks like  the firewall (FORWARD chain) in B is not allowing 
>>>> NEW connections from phys0 to phys1; only allowing ESTABLISHED 
>>>> connections, which made the ICMP reply packets through.
>>>>
>>>>
>>>> Regards,
>>>> Vignesh
>>>>
>>>>
>>>
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

