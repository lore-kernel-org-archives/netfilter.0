From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: PREROUTING to a non local subnet
Date: Tue, 17 Sep 2013 10:10:40 +0530
Message-ID: <5237DD48.5020808@atc.tcs.com>
References: <522DDC72.4000402@club-internet.fr> <5236CDF6.3080802@atc.tcs.com> <5236FAB3.2000401@club-internet.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5236FAB3.2000401@club-internet.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Manu <traqueur@club-internet.fr>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

[seems the mailing list IP is missed. adding it]

On 09/16/2013 06:03 PM, Manu wrote:
> For me the traffic is being dropped in the right place as when I do a=
=20
> netstat on the 192.168.2.100 I see that there is an open connection=20
> with 180.180.180.180 (<-- my server running iptable).
> But the IP of the computer i'm running my test from is 200.200.200.20=
0
> There is the strange point as when I use the same rules for forwardin=
g=20
> a port to a computer on the same subnet than the server i see a=20
> connection from 200.200.200.200 and not 180.180.180.180
> It seem that iptables rewrite the from ip adresse when it does port=20
> forwarding to a computer which is not on the same subnet.

I think, some SNAT rule is doing that (may be as a side effect of your=20
VPN configuration?).

> I hope 'im clear enough. Tell me if it is not the case.

Regards,
Vignesh

> Le 16/09/2013 11:23, Vigneswaran R a =E9crit :
>> On 09/09/2013 08:04 PM, Manu wrote:
>>> Hello
>>>
>>> I'm running iptable v1.4.7 on a linux with two NIC.
>>> One has adress 192.168.1.31 (the lan)
>>> The other has a public IP. Let's say 180.180.180.180
>>>
>>> On the lan, I have a VPN which join two network : 192.168.1.0 and=20
>>> 192.168.2.0
>>>
>>> I'm trying to forward 5900 port (vnc) to a computer which is on the=
=20
>>> second subnet with adress 192.168.2.100
>>> iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT=20
>>> --to-destination 192.168.2.100:5900
>>> iptables -A FORWARD -p tcp -d 192.168.2.100--dport 5900 -j ACCEPT
>>> and it doesn't work
>>
>> Does this machine have route to 192.168.2.0 network? Try to use=20
>> tcpdump and see where the traffic is being dropped.
>>
>> Regards,
>> Vignesh
>>
>>>
>>> I've tried the same on the local network with adress 192.168.1.99
>>> iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT=20
>>> --to-destination 192.168.1.99:5900
>>> iptables -A FORWARD -p tcp -d 192.168.1.99--dport 5900 -j ACCEPT
>>> and it's working like a charm
>>>
>>> I've done my test with another computer with public adress=20
>>> 200.200.200.200
>>>
>>> I've done a netstat one the two computers
>>> on 192.168.2.100 i've seen he's talking to 180.180.180.180 (<-- my=20
>>> server running iptable)
>>> on 192.168.1.99 i've seen he's talking to 200.200.200.200 (<-- the=20
>>> computer on internet which i'm running my test from)
>>>
>>> thanks for your attention
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>

