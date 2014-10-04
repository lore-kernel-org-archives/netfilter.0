From: John Smithee <for-gmane@mutluit.com>
Subject: Re: Basic routing
Date: Sat, 04 Oct 2014 13:06:41 +0200
Message-ID: <m0okc1$g5m$1@ger.gmane.org>
References: <m0nhf2$oqq$1@ger.gmane.org> <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org> <542F9BEE.9070802@kickstone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <542F9BEE.9070802@kickstone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

John Lister wrote, On 10/04/2014 09:04 AM:
>
> On 04/10/2014 03:52, John Smithee wrote:
>> Neal Murphy wrote, On 10/04/2014 03:34 AM:
>>> On Friday, October 03, 2014 09:10:58 PM John Smithee wrote:
>>>> Hi,
>>>>
>>>> I've 2 NICs on a machine, both attached to seperate networks
>>>> (192.168.68.0/24 and 192.168.69.0/24). I'm trying to set up a
>>>> basic gateway (or routing?) between the two networks.
>>>>
>>>> Is this a classical routing issue or has this to be done via iptables?
>>>
>>> Standard networking, standard routing. Netfilter doesn't enter the equation.
>>>
>>> The prime directive: every router must have explicit routes to all networks it
>>> can reach, except that the default route can eliminate many explicit routes.
>>> In other words, "These routes specify how to reach these LANs; packets for all
>>> other networks will be sent via the default route if it exists. Packets for
>>> which there is no route will be dribbled into the bit bucket." Note the phrase
>>> "every router"; it include all of your internal routers as well as your
>>> perimeter (default) gateway.
>>>
>>> For a router to transmit a packet it must know *where* to send it. Your
>>> machine must have explicit routes to networks reachable via 192.168.68.X and
>>> explicit routes to networks reachable via 192.168.69.Y, where the X and Y
>>> addresses are the addresses of the routers that are gateways to those other
>>> LANs.
>>> ----
>>>    ip route add 10.20.30.0/24 via 192.168.69.34
>>>    ip route add 192.168.128.0/17 via 192.168.68.200
>>>    etc.
>>> ----
>>>
>>> If your 'internetwork' includes the universe (the Internet), you need a
>>> default route (send all packets I don't have a route for to this address).
>>> ----
>>>    ip route add default via 192.168.68.254
>>> ----
>>
>> Thx, yes this is indeed standard IP networking stuff, but unfortunately
>> it still isn't working; there must be something more to it.
>>
>> I think the ping error text is perhaps misleading: I guess the ping request
>> does reach the destination, but the answer packet from the ping reply
>> gets not forwarded to the originating second interface eth1 (192.168.69.*).
>>
>> Ie. the the request from eth1 correctly goes out thru the eth0 interface
>> and the reply comes as well over the same eth0 interface,
>> but there is on the return path something missing to forward it from
>> eth0 to eth1. Isn't it?
>>
> You are trying to ping an address on eth0 using eth1, in otherwords you are
> saying the traffic MUST leave on eth1 and somehow find its way to eth0. The
> destination host unreachable is the return packet saying that this is
> impossible. You probably have no route setup to direct traffic from 69.x to
> 68.x and I suspect even with one it would fail as by using -I with ping you
> are forcing the output network device. Generally you would use -I if there
> were 2 routes to an external device to test both are working, in this instance
> the routing is internal but you are telling ping it needs to transmit the packet.
>
> If you really want to do this, you could add some ip tables rules to intercept
> traffic on eth1 going to 68.x and switch the source interface/address
>
> John

Ok, I admit using "ping -I" was a bad example. The whole point I tried
to make is, that the second net (69.0) cannot reach any other IP outside its 
own net.
The goal is to let 69.0 reach the world via this gateway machine 68.22/69.22.
Is some iptables needed in this case?


