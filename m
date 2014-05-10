From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: Losing connection between nat and filter tables
Date: Fri, 09 May 2014 21:31:49 -0300
Message-ID: <536D7375.9090909@riosoft.com.br>
References: <536CECA8.1000604@riosoft.com.br>	<CAEzD07JLeCTxUT_rR3H6QDv6_jVH2mFH1q8B2T4EvtJsDGqF1g@mail.gmail.com>	<536CFE75.90005@riosoft.com.br> <CAEzD07LqPgQiftaS6831c2-7Kw0XM=3i84+4WX6XN2GSX0k6Qw@mail.gmail.com> <536D3E84.5020102@riosoft.com.br> <536D4983.8040105@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <536D4983.8040105@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mart.frauenlob@chello.at, Anton Danilov <littlesmilingcloud@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Wow, thank you Mart! I didn't really think that the rp_filter would have 
anything to do with it, but in fact it had! Even though I had disabled 
for "all" interfaces, it seems that the rp_filter files for each 
interface overlaps "all".
So,

echo 0 > /proc/sys/net/ipv4/conf/eth2/rp_filter

solved the problem of disappearing packets.

But unlike the eth1 interface, the RELATED state isn't allowing (or 
recognizing) the data channel. After doing a DNAT from port 49152 to 
65535, the default data ports for MS FTP, I can now successfully connect 
through the second interface. I don't think there's a workaround for 
that, right?
Even so, I'm glad you guys could help me.
Thanks a lot!


Em 09/05/2014 18:32, Mart Frauenlob escreveu:
> On 09.05.2014 23:07, netfilter-owner@vger.kernel.org wrote:
>> No deal yet. After inserting the new routing tables and rules it didn't
>> really change anything.
>> The eth2 doesn't have a gateway set in the config file, only eth1 have
>> it. Plus, these two interfaces are in the same subnet and there's only
>> one gateway on it (180.1.2.1).
>>
>> [root@firewall ~]# ip route show table T1
>> default via 180.1.2.1 dev eth1
>>
>> [root@firewall ~]# ip route show table T2
>> default via 180.1.2.1 dev eth2
>>
>> [root@firewall ~]# ip rule show
>> 0:      from all lookup local
>> 10:     from 180.1.2.11 lookup T1
>> 20:     from 180.1.2.12 lookup T2
>> 32766:  from all lookup main
>> 32767:  from all lookup default
>>
>> (I had to add the tables T1 and T2 in the file /etc/iproute2/rt_tables)
>>
>> Even so, I see it reach the PREROUTING chain in eth2 but it still
>> disappears after that. Connections reaching in the eth1 still works.
>>
>> There's something else to try?
>
> Check values of /proc/sys/net/ipv4/conf/*/rp_filter
> and disable them.
> To use the TRACE target just put a -j TRACE on the desired place.
>
>
>
>
>


