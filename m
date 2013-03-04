From: Dovydas Sankauskas <laisve@gmail.com>
Subject: Re: brouting different VLANs
Date: Mon, 4 Mar 2013 12:38:38 +0200
Message-ID: <CAB_DuvCOyACnPxUAPY_j287BpjixZ9OmFP5y1Y+63AG8+TaeUQ@mail.gmail.com>
References: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
	<5133379A.7060803@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=C3SWaajYJohT7CQU2YTk4Mx368rok3WlBoPobBjxM7Q=;
        b=t5hmzSQM7IJsBaZYikRoGSqhwijMrwRMEqTdLy2O364sGFvkv6NmwNDzqP8/eQcI/W
         fkeHOT0rfrOJxISCbMRptbrloJGq7DiHd+JH3c7MvftpISIS37iIt4Q+8qXy4JQjjJoH
         n06mlgmi0VUpERe+S7U3wQMwN2uJBYGxQTcZViMFY4tz+YQmZNi3cacGk0v5FgAWjMsl
         UtvAAuNwK87i0Nsov8DcnXhmR0XzF5R0wGdBkg8d3Kd47zn80v1pnbTBMbhopXWwuiUT
         9nAv70JId1WVdlXWnGGsKOHMoMjc4UpC0owuqzLMBoptfyY/nEzMmcuBWJ8EbPqxOYot
         bhlw==
In-Reply-To: <5133379A.7060803@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

2013/3/3 Pascal Hambourg <pascal@plouf.fr.eu.org>:
> Hello,
>
> Dovydas Sankauskas a =C3=A9crit :
>> Hi,
>>
>> I am having some troubles with brouter setup.
>
> Why are you using brouting in this setup ?
>
>> I have customers on different VLANS but on the same subnet. I want t=
o
>> allow access between customers and to allow access to internet.
>> Unfortunatelly I can't make customers on VLAN 10 to ping customers o=
n
>> VLAN 20. Both VLANS 10 and 20 are on the _same_subnet_ 10.0.0.0/24.
>>
>> Here is my current setup:
>>
>>                 INTERNET
>>                     |
>>   +-----------+------------+----------+
>>   |           |    eth2    |          |
>>   |           | 1.2.3.4/30 |          |
>>   |           +------------+          |
>>   |                                   |
>>   |   +---------------------------+   |
>>   |   |            br0            |   |
>>   |   |        10.0.0.1/24        |   |
>>   |   +-------------+-------------+   |
>>   |   |   bond0.10  |  bond0.20   |   |
>>   |   |   vlan 10   |  vlan 20    |   |
>>   +---+-------------+-------------+---+
>>            |                 |
>>          10.0.0.10     10.0.0.20
>>
>>
>> I have eth0 and eth1 bonded into bond0. On bond0 I have VLAN
>> interfaces bond0.10 and bond0.20 for VLAN 10 and VLAN 20 respectivel=
y.
>> These bond0.10 and bond0.20 interfaces are bridged into interface br=
0.
>> br0 address 10.0.0.1 is default gateway IP for customer1 10.0.0.10/2=
4
>> on VLAN 10 and for customer2 10.0.0.20/24 on VLAN 20.
>> eth2 is my internet facing interface. There is no NAT.
>>
>> Internet access for both customers is working just fine with the
>> following ebtables rules:
>> ebtables -A FORWARD -i bond0.10 -j DROP
>> ebtables -A FORWARD -i bond0.20 -j DROP
>> ebtables -t broute -A BROUTING -p ! arp -i bond0.10 -j DROP
>> ebtables -t broute -A BROUTING -p ! arp -i bond0.20 -j DROP
>>
>> However I am struggling to enable access between customer 10.0.0.10
>> and customer 10.0.0.20.
>> Please can you advise?
>
> According to your ebtables rules, your drop all bridged traffic on
> bond0.10 and bond0.20 and you force routing of all traffic except ARP=
 on
> these interfaces. Why is that so, and can you explain how local direc=
t
> communication between these VLANs would be possible ?

I am trying to avoid bridging between VLAN 10 and VLAN 20 because I
have a pair of redundant identical Linux boxes sharing a common IP via
VRRP. I have blocked bridging because I want to avoid a Layer2 loop
and a broadcast storm.

I have a C class network for assigning IP addresses to my customers
however the customers are connected via different VLANs. I don't own
part of my Layer2 network, so Vlan numbers are assigned by my Layer2
transport providers. I want customers on VLAN 10 to access customers
on VLAN 20 and also to access internet. And to avoid Layer2 loop I
want to use routing, not bridging. I believe this should be possible
with proxy arp enabled on br0.

My current commands allow customer1 and customer2 to access internet
and also to access the gateway itself.

Please can you help with the brouting logic to enable access between
the customers?

--=20
Dovydas Sankauskas
