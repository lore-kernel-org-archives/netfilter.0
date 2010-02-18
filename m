From: Yavetskiy Yuriy <yavetskiy@kpi.ua>
Subject: Re: Transparent http filtering VLAN traffic without being a member
 of 	tagged VLANs
Date: Thu, 18 Feb 2010 13:28:33 +0200
Message-ID: <4B7D2461.7010703@kpi.ua>
References: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>	 <20100217215518.2944595e@catlap>	 <c4ada2161002172323r477f2b23g3b5ed981275d11ca@mail.gmail.com>	 <20100218113636.6bddb735@catlap> <c4ada2161002180320i373a4931waf29dd22acc5e4db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c4ada2161002180320i373a4931waf29dd22acc5e4db@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: Marek Kierdelewicz <marek@piasta.pl>, netfilter@vger.kernel.org

Hello.

And what is output of

ip ro sho 91.93.179.88/29

?
If route already exist you must delete it before adding to br0.206.

Oguz Yilmaz wrote:
> # ifconfig br0
> br0       Link encap:Ethernet  HWaddr 00:0E:0C:C4:AA:E7
>           inet addr:SOMEIP  Bcast:SOMEBCAST  Mask:255.255.255.252
>           inet6 addr: fe80::20e:cff:fec4:aae7/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:88539199 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:422429 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:457848874 (436.6 MiB)  TX bytes:53152547 (50.6 MiB)
>
>
> br0.206   Link encap:Ethernet  HWaddr 00:0E:0C:C4:AA:E7
>           inet6 addr: fe80::20e:cff:fec4:aae7/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:901504 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:6 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:545628196 (520.3 MiB)  TX bytes:492 (492.0 b)
>
>
> # ip link set up dev br0.206
>
> # ip link show | grep br0.206
> 27: br0.206@br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
>
> # route add -net 91.93.179.88 netmask 255.255.255.248 dev br0.206
> SIOCADDRT: No such device
>
> # ip ro add 91.93.179.88/29 dev br0.206
> RTNETLINK answers: No such device
>
> # ip ro sh dev br0.206
> NO OUTPUT
>
>
> Kernel is Linux 2.6.18 Centos EL5 Kernel.
>
>
>
> On Thu, Feb 18, 2010 at 12:36 PM, Marek Kierdelewicz <marek@piasta.pl> wrote:
>   
>> Hello,
>>
>>     
>>> This may be our problem. However ip route add returns
>>> "SIOCADDRT: No such device"
>>> while I see br0.26 in ifconfig output.
>>>       
>> Strange. It should work. Tested on debian lenny:
>>
>> rt1:/# brctl addbr br0
>> rt1:/# ip link set up dev br0
>> rt1:/# vconfig add br0 26
>> Added VLAN with VID == 26 to IF -:br0:-
>> rt1:/# ip link set up dev br0.26
>> rt1:/# ip ro add 10.100.0.0/30 dev br0.26
>> rt1:/# ip ro sh dev br0.26
>> 10.100.0.0/30  scope link    <- route is there!
>>
>> Post output of your "ip addr sh" and "ip ro show" and steps you take to
>> set things up.
>>
>>     
>>> What about routing into not "dev br0.26" but to "dev br0"?
>>>       
>> In case of routing on br0 and not br0.26 AFAIK bridge would be sending
>> replies untagged on native vlan. Maybe there are some ebtables hacks
>> I don't know about.
>>
>> Best regards,
>> Marek Kierdelewicz
>>
>>     
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   


-- 
WBR
Yavetskiy Yuriy
ULTI-RIPE

