From: Pieter Smit <mlist2010@vigor.co.za>
Subject: Re: VLAN et iptables
Date: Mon, 5 Apr 2010 08:02:40 +0200
Message-ID: <t2o23731b2b1004042302ie27e3da9hfadcc4413303f5c1@mail.gmail.com>
References: <201004030927.53528.jeetu.golani@gmail.com>
	 <20100403080147.04d1add3@catlap>
	 <201004031328.16411.jeetu.golani@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:received:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=p25X+ACCDc7xeg0UJpkhIo8LdJS2cqGgMxfRg2+61Qg=;
        b=gN7wEHDbyDjalIQVrOUZ+bMPHUfTbiKr9HCkN8ElCnVwzXDDTXBsaNyPIHiEifCd6u
         6AXP9Rx/I1aZ2nXrW9tF4/wO3eFA9a1hUru+NoOwL39tVE+3FB4MCK82v6r4jYUKKL84
         knpCtXKFnCn9Giwah8UIsW/j6i8TLqRNEjFC8=
In-Reply-To: <201004031328.16411.jeetu.golani@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeetu Golani <jeetu.golani@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Jeetu,

My suggestion, simplify your rules a little.

1. Start with a single rule to allow established connections.
2. You seem to have a extra [-m] in the subnet rules. (Could add -m
state --state NEW)
3. Adding a log rule to the end of the Forward table and looking at
non matched packets could help you see what the problem might be.


# for all subnets
 iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
 iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

# for Matunga subnet 192.168.0.0/24
 iptables -A FORWARD -i $INTIF1 -o $EXTIF -s 192.168.0.0/24 -j ACCEPT

 # for Silvassa subnet 172.16.0.0/16
 iptables -A FORWARD -i $INTIF2 -o $EXTIF -s 172.16.0.0/16  -j ACCEPT

# for Colaba subnet 192.168.1.0/24
 iptables -A FORWARD -i $INTIF2 -o $EXTIF -s 192.168.1.0/24 -j ACCEPT

Regards,
Pieter

On Sat, Apr 3, 2010 at 9:58 AM, Jeetu Golani <jeetu.golani@gmail.com> w=
rote:
> Hi Elko / Marek,
>
> Thank you so much for replying back.
>
> I've pasted down below the ifconfig output and the routing table at t=
he router
> in the head office.
>
> The routers can ping each other, they can also ping their respective =
PE's. The
> router at the head office, where we have the iptables script, can pin=
g both
> the VPN PE and the gateway for the public IP.
>
> Furthermore if all we have are the following rules, the HO LAN 192.16=
8.0.0
> can reach the public gateway and surf the internet, the remote locati=
ons
> can't:
>
> iptables -A FORWARD -i $EXTIF -o $INTIF1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i $INTIF1 -o $EXTIF -j ACCEPT
> iptables -A FORWARD -i $EXTIF -o $INTIF2 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i $INTIF2 -o $EXTIF -j ACCEPT
>
> iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>
> With the script I had posted earlier none of the locations can reach =
the
> public gateway.
>
> Truly appreciate all the help.
>
> Regards,
> Jeetu
> http://www.ebrain.in
> - An open (GPL) platform to discover and run software off someone in =
the
> meshed network pool and use it on your own device.
>
> twitter: =A0@0topcat0 and @ebrainpool
>
>
>
> --------------------------------
> ifconfig output:
>
> eth0 =A0 =A0 =A0Link encap:Ethernet =A0HWaddr 00:27:0e:16:e1:a5
> =A0 =A0 =A0 =A0 =A0inet addr:192.168.0.1 =A0Bcast:192.168.0.255 =A0Ma=
sk:255.255.255.0
> =A0 =A0 =A0 =A0 =A0inet6 addr: fe80::227:eff:fe16:e1a5/64 Scope:Link
> =A0 =A0 =A0 =A0 =A0UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Metr=
ic:1
> =A0 =A0 =A0 =A0 =A0RX packets:482754 errors:0 dropped:0 overruns:0 fr=
ame:0
> =A0 =A0 =A0 =A0 =A0TX packets:743399 errors:0 dropped:0 overruns:0 ca=
rrier:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:1000
> =A0 =A0 =A0 =A0 =A0RX bytes:38759551 (36.9 MiB) =A0TX bytes:102470105=
5 (977.2 MiB)
> =A0 =A0 =A0 =A0 =A0Interrupt:27 Base address:0xe000
>
> eth1 =A0 =A0 =A0Link encap:Ethernet =A0HWaddr 00:e0:1c:3b:a0:c1
> =A0 =A0 =A0 =A0 =A0inet6 addr: fe80::2e0:1cff:fe3b:a0c1/64 Scope:Link
> =A0 =A0 =A0 =A0 =A0UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Metr=
ic:1
> =A0 =A0 =A0 =A0 =A0RX packets:1750085 errors:0 dropped:0 overruns:0 f=
rame:0
> =A0 =A0 =A0 =A0 =A0TX packets:623003 errors:0 dropped:0 overruns:0 ca=
rrier:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:1000
> =A0 =A0 =A0 =A0 =A0RX bytes:1103786909 (1.0 GiB) =A0TX bytes:48633230=
 (46.3 MiB)
> =A0 =A0 =A0 =A0 =A0Interrupt:21 Base address:0x6000
>
> lo =A0 =A0 =A0 =A0Link encap:Local Loopback
> =A0 =A0 =A0 =A0 =A0inet addr:127.0.0.1 =A0Mask:255.0.0.0
> =A0 =A0 =A0 =A0 =A0inet6 addr: ::1/128 Scope:Host
> =A0 =A0 =A0 =A0 =A0UP LOOPBACK RUNNING =A0MTU:16436 =A0Metric:1
> =A0 =A0 =A0 =A0 =A0RX packets:157 errors:0 dropped:0 overruns:0 frame=
:0
> =A0 =A0 =A0 =A0 =A0TX packets:157 errors:0 dropped:0 overruns:0 carri=
er:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:0
> =A0 =A0 =A0 =A0 =A0RX bytes:17134 (16.7 KiB) =A0TX bytes:17134 (16.7 =
KiB)
>
> vlan105 =A0 Link encap:Ethernet =A0HWaddr 00:e0:1c:3b:a0:c1
> =A0 =A0 =A0 =A0 =A0inet addr:10.235.122.158 =A0Bcast:10.235.122.159
> Mask:255.255.255.252
> =A0 =A0 =A0 =A0 =A0inet6 addr: fe80::2e0:1cff:fe3b:a0c1/64 Scope:Link
> =A0 =A0 =A0 =A0 =A0UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Metr=
ic:1
> =A0 =A0 =A0 =A0 =A0RX packets:68906 errors:0 dropped:0 overruns:0 fra=
me:0
> =A0 =A0 =A0 =A0 =A0TX packets:68917 errors:0 dropped:0 overruns:0 car=
rier:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:0
> =A0 =A0 =A0 =A0 =A0RX bytes:3445300 (3.2 MiB) =A0TX bytes:3170595 (3.=
0 MiB)
>
> #public IP
> vlan689 =A0 Link encap:Ethernet =A0HWaddr 00:e0:1c:3b:a0:c1
> =A0 =A0 =A0 =A0 =A0inet addr: a.b.c.d =A0Bcast:a.b.c.(d+1) =A0Mask:25=
5.255.255.252
> =A0 =A0 =A0 =A0 =A0inet6 addr: fe80::2e0:1cff:fe3b:a0c1/64 Scope:Link
> =A0 =A0 =A0 =A0 =A0UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Metr=
ic:1
> =A0 =A0 =A0 =A0 =A0RX packets:826133 errors:0 dropped:0 overruns:0 fr=
ame:0
> =A0 =A0 =A0 =A0 =A0TX packets:554080 errors:0 dropped:0 overruns:0 ca=
rrier:0
> =A0 =A0 =A0 =A0 =A0collisions:0 txqueuelen:0
> =A0 =A0 =A0 =A0 =A0RX bytes:1022440202 (975.0 MiB) =A0TX bytes:428423=
59 (40.8 MiB)
> ------------------------------------------------------------------
>
> Kernel IP routing table:
>
> Destination =A0 =A0 Gateway =A0 =A0 =A0 =A0 Genmask =A0 =A0 =A0 =A0 F=
lags Metric Ref =A0 =A0Use Iface
> 10.235.122.186 =A00.0.0.0 =A0 =A0 =A0 =A0 255.255.255.255 UH =A0 =A00=
 =A0 =A0 =A00 =A0 =A0 =A0 =A00
> vlan105
> 10.235.122.94 =A0 0.0.0.0 =A0 =A0 =A0 =A0 255.255.255.255 UH =A0 =A00=
 =A0 =A0 =A00 =A0 =A0 =A0 =A00
> vlan105
> a.b.c.16 =A00.0.0.0 =A0 =A0 =A0 =A0 255.255.255.252 U =A0 =A0 0 =A0 =A0=
 =A00 =A0 =A0 =A0 =A00 vlan689
> 10.235.122.156 =A00.0.0.0 =A0 =A0 =A0 =A0 255.255.255.252 U =A0 =A0 0=
 =A0 =A0 =A00 =A0 =A0 =A0 =A00
> vlan105
> 192.168.1.0 =A0 =A0 10.235.122.94 =A0 255.255.255.0 =A0 UG =A0 =A00 =A0=
 =A0 =A00 =A0 =A0 =A0 =A00
> vlan105
> 192.168.0.0 =A0 =A0 0.0.0.0 =A0 =A0 =A0 =A0 255.255.255.0 =A0 U =A0 =A0=
 0 =A0 =A0 =A00 =A0 =A0 =A0 =A00 eth0
> 172.16.0.0 =A0 =A0 =A010.235.122.186 =A0255.255.0.0 =A0 =A0 UG =A0 =A0=
0 =A0 =A0 =A00 =A0 =A0 =A0 =A00
> vlan105
> 0.0.0.0 =A0 =A0 =A0 =A0 a.b.c.17 =A00.0.0.0 =A0 =A0 =A0 =A0 UG =A0 =A0=
0 =A0 =A0 =A00 =A0 =A0 =A0 =A00 vlan689
>
>
>
> On Saturday 03 April 2010, Marek Kierdelewicz wrote:
>> > Hi,
>>
>> Hi Jeetu,
>>
>> >I have a Debian system that I am trying to configure as a router fo=
r a
>> >Network Description:
>> >At the head office, the ISP facing router has two physical NICs (et=
h0
>> >and eth1).
>>
>> Your script looks good. It's probably on purpose but in current setu=
p
>> you won't be able to reach one private subnet from another.
>>
>> Just to be sure - if you want the box to act as a router for subnets
>> 192.168.1.0/24 and 172.16.0.0/16 then you need ip addresses from the=
se
>> subnets on vlan105 interface.
>>
>> Regards,
>> Marek
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
