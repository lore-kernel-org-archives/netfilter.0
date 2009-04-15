From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: need help on *nat filter for multiple source IP
Date: Wed, 15 Apr 2009 22:59:49 +0200
Message-ID: <49E64AC5.4050400@chello.at>
References: <5a7ba2310904122005k6606f6falba0b74b118f42090@mail.gmail.com>	 <49E2C80C.1030406@chello.at> <5a7ba2310904151200m29b7c633g5f5326f00bc825b1@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5a7ba2310904151200m29b7c633g5f5326f00bc825b1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: hell.no.doubt@gmail.com

no doubt wrote:
> Hello Mart,
>
> Thanks for the guide. It now works.
>
> -khairul
>
> On Mon, Apr 13, 2009 at 1:05 PM, Mart Frauenlob
> <mart.frauenlob@chello.at> wrote:
>   
>> no doubt wrote:
>>     
>>> Hi,
>>>
>>> Currently Im running a gw firewall for internal soho network.
>>>
>>> I would like to achieve that for all IP's in 192.168.4.0/24 that are
>>> accessing outside internet address port 80, will be directed to
>>> 192.168.3.10 port 80 EXCEPT for few IPs namely 192.168.4.10,
>>> 192.168.4.100 and 192.168.4.20
>>>
>>> my rules in nat filter read like this.
>>> *nat
>>> :PREROUTING ACCEPT [4314:569235]
>>> :POSTROUTING ACCEPT [42:12421]
>>> :OUTPUT ACCEPT [2807:264498]
>>>
>>> iptables -A PREROUTING -s ! 192.168.4.10/32 -d ! 192.168.0.0/16 -i
>>> eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
>>> iptables -A PREROUTING -s ! 192.168.4.20/32 -d ! 192.168.0.0/16 -i
>>> eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
>>> iptables -A PREROUTING -s ! 192.168.4.100/32 -d ! 192.168.0.0/16 -i
>>> eth2 -p tcp -m tcp --dport 80 -j DNAT --to-destination 192.168.3.10
>>>
>>> -A POSTROUTING -o ppp+ -j MASQUERADE
>>> COMMIT
>>>
>>> somehoe it doesnt work. but if I left only 1st line, it works.
>>>
>>> is there anything i can modify the rules ?
>>>
>>>       
>> try this:
>>
>> iptables -t nat -N my_dnat
>> iptables -t nat -A PREROUTING -i eth2 -s 192.168.4.10 -p tcp --dport 80 -j
>> my_dnat
>> [...]
>>
>> iptables -t nat -A my_dnat -j DNAT --to-destination 192.168.3.10
>>
>> -A POSTROUTING -o ppp+ -j MASQUERADE
>>
>>     
Hello,

now as i read this again, i had misread your request.

guess you figured it out yourself in the meantime.
actually i think something like that would be a solution:

iptables -t nat -N my_dnat

iptables -t nat -A my_dnat -s 192.168.4.10  -j RETURN
iptables -t nat -A my_dnat -s 192.168.4.20  -j RETURN
iptables -t nat -A my_dnat -s 192.168.4.100 -j RETURN
iptables -t nat -A my_dnat -j DNAT --to-destination 192.168.13.10

iptables -t nat -A PREROUTING -i eth2 -s 192.168.4.0/24 -p tcp --dport 
80 -j my_dnat

iptables -A POSTROUTING -o ppp+ -j MASQUERADE

how did you work it out?

