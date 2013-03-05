From: Dovydas Sankauskas <laisve@gmail.com>
Subject: Re: brouting different VLANs
Date: Tue, 5 Mar 2013 14:27:48 +0200
Message-ID: <CAB_DuvBbGwn4u_it9awTRv0fwfw3nOz8aqhp5JtRBgLjnsQwvQ@mail.gmail.com>
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
        bh=pwVdDTdlyqLHba3eWCU85N0IXCKlf82rkRy7ld4fY6o=;
        b=yAlKUe2b6HMQrafVSWoog46c2P+91qRwuNY/V4Hr8kwiYiYbiV4amR/WhceoOAtRHa
         qMitWeGF3/qC1pstM/EQs7kDNTCYVuwPTTzVcWsQWOnKV/gGsPdjfyKrsyJB9SssLNop
         ZffVkebF0rUJPNxEnU06BCyWFR48o/dRqgrmjw8Wox9P8yK09rbXd1W7NbgVGgM1y8kn
         K5Uvv0BS+uT/eNGNoAuc6+Xvi6FbNRP2z8xKOOAKqPXj719Oa9ofJV3Vhlu/GFrVI5DZ
         MEdCRMDzVfgduqB1bPjifH+fxJnPAid8RQax2tTIAy5UPNkLre4unKsZIYmoanXXuBGb
         1b7Q==
In-Reply-To: <CAB_DuvCOyACnPxUAPY_j287BpjixZ9OmFP5y1Y+63AG8+TaeUQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

2013/3/4 Dovydas Sankauskas <laisve@gmail.com>:
> 2013/3/3 Pascal Hambourg <pascal@plouf.fr.eu.org>:
>> Hello,
>>
>> Dovydas Sankauskas a =C3=A9crit :
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

Hi,

Just for the record.
Here is the final config that worked for me:

ebtables -A FORWARD -i bond0.10 -j DROP
ebtables -A FORWARD -i bond0.20 -j DROP
ebtables -t broute -A BROUTING -p arp --arp-ip-dst ! 10.0.0.1 -i
bond0.10 -j DROP
ebtables -t broute -A BROUTING -p arp --arp-ip-dst ! 10.0.0.1 -i
bond0.20 -j DROP

Now customer1 in vlan 10 can ping customer2 in vlan 20 (via proxy_arp).
Also they can access the internet and the Linux router itself.

Thank you for your time.


--=20
Dovydas Sankauskas
