From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: [Bulk] Re: a missing rule / incomplete routing
Date: Wed, 13 Aug 2014 16:42:15 +0530
Message-ID: <53EB480F.30103@atc.tcs.com>
References: <53E8946F.2070403@yahoo.co.uk> <53E8AEE0.60800@atc.tcs.com> <53EB3C1B.60702@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53EB3C1B.60702@yahoo.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lejeczek <peljasz@yahoo.co.uk>
Cc: netfilter <netfilter@vger.kernel.org>

When you say "a 192.168.2.81 from behind box B can ping172.17.166.199" 
(in your first mail), do you mean both the following happen?

1) the icmp request from 192.168.2.81 is able to reach 172.17.166.199, and
2) the icmp reply from 172.17.166.199 is able to reach 192.168.2.81

In case, the 2nd is not happening, most probably the routers in between 
(which are not in your control) not having route for 192.168.x.x 
network. In that case, you may have to create a tunnel (or use VPN) 
between Box A and Box B to connect to 192.168.x.x network.


Regards,
Vignesh

On 08/13/2014 03:51 PM, lejeczek wrote:
> I have had:
> -A FORWARD -i em1 -o em2 -m state --state NEW -j ACCEPT
> -A FORWARD -i em2 -o em1 -m state --state NEW -j ACCEPT
> besides, also usual
> -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A FORWARD -p icmp -j ACCEPT
>
> one strange thing is that when I tracepath on box B I see traffic (to 
> box A 172.17.167.x) wants to go out via em3(another psyh interface)
>
> if it might be routing, then
> I have 3 man made routing tables, one for each interface
> private 192.xxxx
> internal 172.xxx
> external a public IP
>
> I've left out private (empty, no rules no routes) for I thought kernel 
> would take care of it,
> which it does (well, to certain extent) eg. 172.25.12.x net get to box 
> B's 192.168.2.100 and behind (this is internal table route rules)
> but eg. 172.17.x.x  which essentially goes through the same phys0 
> cannot get to box B's 192.168.2.100 (but can to box B's 172.25.12.101)
>
> there are router(s) between 172.x.x.x (not mine) but then as above 
> they all can get to box B's psyh0 172.25.12.101
>
> it's all a bit weird to me
>
>
> On 11/08/14 12:54, Vigneswaran R wrote:
>> On 08/11/2014 03:31 PM, lejeczek wrote:
>>> dear experts
>>>
>>> I'm looking for ideas/suggestion why the following does not work
>>>
>>> there is a:
>>> * box A - 172.17.166.199 --  then there is 172./8 net -- box B - 
>>> 172.25.12.101 (phys0), 192.168.2.100 (phys1) -- and one more net 
>>> behind 192.168.2.100
>>>
>>> a 192.168.2.81 from behind box B can ping172.17.166.199
>>> but not the other way around, box A cannot get to box B's phys1 but 
>>> it does get to phys0
>>>
>>> I can control box A but have no control over the nets between it and 
>>> box B's phys0
>>> I can control box B
>>>
>>> I thought my route rules on box B are complete, box A is a winbox
>>> I though box B' firewall is ready
>>> but I obviously miss something
>>>
>>> there is no masquerading for phys0 nor phys1 one box B
>>
>> It looks like  the firewall (FORWARD chain) in B is not allowing NEW 
>> connections from phys0 to phys1; only allowing ESTABLISHED 
>> connections, which made the ICMP reply packets through.
>>
>>
>> Regards,
>> Vignesh
>>
>>
>

