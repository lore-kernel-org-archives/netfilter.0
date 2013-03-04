From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: brouting different VLANs
Date: Mon, 4 Mar 2013 07:41:32 -0400
Message-ID: <CACuyg24Rs7e=8yG7z9kmcEntHGBOG0ch7uMppUH_h-nBEcKg8Q@mail.gmail.com>
References: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
	<5133379A.7060803@plouf.fr.eu.org>
	<CAB_DuvCOyACnPxUAPY_j287BpjixZ9OmFP5y1Y+63AG8+TaeUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=f8Dw+I9KD25+9ziZwVZ4et94h7+4lerZJchY4SVNsAM=;
        b=vE2UzqK/QJ8v/VUp9ntboPFJduSCBWMAkJcYRX0uxu5lxQU9t+ZB4BOc6h76MTqwlN
         ON3zbnZMzhTdDTISp/Z6QDoX8B42k1dqkli5ma1ms4gmpMnPnx/G9e2pl/HqNLp/HziA
         OP1l+qBTif2O9Jl1OwPd7ocBRkEe7CYyQbsNAjQaQRoYhCBqvjRnKDeIR+zKJGPbRjJ9
         A58eneUs+5YreYWtFA24QEPjbdO/491KqXLbAZPLDX38xQyKYzR20oXcRibvjxohFFa9
         Zc7YyTRIl0bJp05I1B16F192ah2T5dbsx6aIOwTgIf18zDJnTT53WXZyfwn2re2KUEAM
         0ozA==
In-Reply-To: <CAB_DuvCOyACnPxUAPY_j287BpjixZ9OmFP5y1Y+63AG8+TaeUQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dovydas Sankauskas <laisve@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

I'm not sure if I understand right.
This configuration is not very common and I've never tried something li=
ke this.
The arp traffic by bridge will not work because the VLANs are
different, but with proxy-arp your firewall becomes arp router - can
it work.

ebtables -t broute -A BROUTING -i bond0.10 -j DROP
ebtables -t broute -A BROUTING -i bond0.20 -j DROP

echo 0 > /proc/sys/net/ipv4/conf/bond0.10/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/bond0.20/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/br0/rp_filter

echo 1 > /proc/sys/net/ipv4/conf/br0/proxy_arp

I chose the br0 interface (proxy_arp), because the logical
configuration of the network is defined in br0.
I don't know if works!


2013/3/4 Dovydas Sankauskas <laisve@gmail.com>:
> 2013/3/3 Pascal Hambourg <pascal@plouf.fr.eu.org>:
>> Hello,
>>
>> Dovydas Sankauskas a =E9crit :
>>> Hi,
>>>
>>> I am having some troubles with brouter setup.
>>
>> Why are you using brouting in this setup ?
>>
>>> I have customers on different VLANS but on the same subnet. I want =
to
>>> allow access between customers and to allow access to internet.
>>> Unfortunatelly I can't make customers on VLAN 10 to ping customers =
on
>>> VLAN 20. Both VLANS 10 and 20 are on the _same_subnet_ 10.0.0.0/24.
>>>
>>> Here is my current setup:
>>>
>>>                 INTERNET
>>>                     |
>>>   +-----------+------------+----------+
>>>   |           |    eth2    |          |
>>>   |           | 1.2.3.4/30 |          |
>>>   |           +------------+          |
>>>   |                                   |
>>>   |   +---------------------------+   |
>>>   |   |            br0            |   |
>>>   |   |        10.0.0.1/24        |   |
>>>   |   +-------------+-------------+   |
>>>   |   |   bond0.10  |  bond0.20   |   |
>>>   |   |   vlan 10   |  vlan 20    |   |
>>>   +---+-------------+-------------+---+
>>>            |                 |
>>>          10.0.0.10     10.0.0.20
>>>
>>>
>>> I have eth0 and eth1 bonded into bond0. On bond0 I have VLAN
>>> interfaces bond0.10 and bond0.20 for VLAN 10 and VLAN 20 respective=
ly.
>>> These bond0.10 and bond0.20 interfaces are bridged into interface b=
r0.
>>> br0 address 10.0.0.1 is default gateway IP for customer1 10.0.0.10/=
24
>>> on VLAN 10 and for customer2 10.0.0.20/24 on VLAN 20.
>>> eth2 is my internet facing interface. There is no NAT.
>>>
>>> Internet access for both customers is working just fine with the
>>> following ebtables rules:
>>> ebtables -A FORWARD -i bond0.10 -j DROP
>>> ebtables -A FORWARD -i bond0.20 -j DROP
>>> ebtables -t broute -A BROUTING -p ! arp -i bond0.10 -j DROP
>>> ebtables -t broute -A BROUTING -p ! arp -i bond0.20 -j DROP
>>>
>>> However I am struggling to enable access between customer 10.0.0.10
>>> and customer 10.0.0.20.
>>> Please can you advise?
>>
>> According to your ebtables rules, your drop all bridged traffic on
>> bond0.10 and bond0.20 and you force routing of all traffic except AR=
P on
>> these interfaces. Why is that so, and can you explain how local dire=
ct
>> communication between these VLANs would be possible ?
>
> I am trying to avoid bridging between VLAN 10 and VLAN 20 because I
> have a pair of redundant identical Linux boxes sharing a common IP vi=
a
> VRRP. I have blocked bridging because I want to avoid a Layer2 loop
> and a broadcast storm.
>
> I have a C class network for assigning IP addresses to my customers
> however the customers are connected via different VLANs. I don't own
> part of my Layer2 network, so Vlan numbers are assigned by my Layer2
> transport providers. I want customers on VLAN 10 to access customers
> on VLAN 20 and also to access internet. And to avoid Layer2 loop I
> want to use routing, not bridging. I believe this should be possible
> with proxy arp enabled on br0.
>
> My current commands allow customer1 and customer2 to access internet
> and also to access the gateway itself.
>
> Please can you help with the brouting logic to enable access between
> the customers?
>
> --
> Dovydas Sankauskas
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
