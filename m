From: =?UTF-8?Q?=c3=98yvind_Kaurstad?= <oyvind@dynator.no>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sun, 2 Jul 2017 17:58:01 +0200
Message-ID: <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
 <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
 <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
Reply-To: oyvind@dynator.no
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Le 02/07/2017 =E0 12:33, Robert White a =E9crit :
>> On 07/02/2017 07:29 AM, Pascal Hambourg wrote:
>>> Le 01/07/2017 =E0 22:26, Robert White a =E9crit :
>>> I think you missed the point and focused on an irrelevant detail in the
>>> OP. This topic is about advanced routing.
>>
>> Read the OP again. Traffic is coming in on ppp0, hitting a server
>> hanging off eth1, and then the replies are supposed to go back to eth1
>> and go out on ppp0.
>>
>> There is literally no simpler task in DNAT.
>>
>> This was not an "advanced routing" question, this was an "introduction
>> to DNAT" level question.
>=20
> Again, you missed the important point : reply packets must go out
> through ppp0 but the default route is through eth0, not ppp0. Without
> advanced routing, reply packets will go out through eth0.

First, let me say I'm very grateful to all of you that has taken the=20
time to answer me, and I will study the rather comprehensive replies in=20
detail. I'm clearly no expert, but I'm trying to learn so the=20
information is appreciated.

To perhaps clarify a few things:

My device is not meant to be a system (or full blown) router per se. It=20
is a specialized custom device that for some cases needs to be able to=20
act as a router. It does not act as a DNS server, and in most cases=20
there will be other routers in the system (at least on the eth0 network,=20
and my device is usually set up as a DHCP client on eth0).

The device behind eth1 is not guaranteed to have my device as it's=20
default route (in fact it will most likely not), which is why I believe=20
I need SNAT/masquerading to have it send the replies back to my device.

But for the sake of argument, let's assume that the device will send the=20
replies back to my device at eth1 even with SNAT off. I'll try to use an=20
example with fictious IP-addresses to clarify:

Assume ppp0 has an address of 10.10.10.10
Assume eth0 has an address of 192.168.10.10
Assume eth1 has an address of 192.168.100.100
Assume the device behind eth1 has an address of 192.168.100.200

Say that I want to forward inbound (UDP or TCP) traffic destined for=20
10.10.10.10:1111 to 192.168.100.200:1111, so I add a DNAT rule for that.

Then when a packet comes in on ppp0 from 100.100.100.100:2222, and my=20
DNAT-rule rewrites the destination address to 192.168.100.200:1111. This=20
packet then leaves eth1 for the device, and the device replies. Without=20
SNAT, the addresses in the reply are:

Dst: 100.100.100.100:2222
Src: 192.168.100.200:1111

The packet is then routed, and after the routing decision the DNAT is=20
reversed, so when the packet actually leaves my device, it has these=20
addresses:

Dst: 100.100.100.100:2222
Src: 10.10.10.10:1111

However, since the routing decision is made *before* the source address=20
has been rewritten, this packet leaves out eth0, where it is lost.

If I have SNAT/masquerading, the reply from the device has these addresses:

Dst: 192.168.100.100:2222
Src: 192.168.100.200:1111

The SNAT is then reversed for the packet:

Dst: 100.100.100.100:2222
Src: 192.168.100.200:1111

And now the routing happens, but again the packet takes the default=20
route out eth0 and is lost.

In none of these cases my source routing rule is hit, because the source=20
address of my ppp0 device is not being rewritten until *after* the=20
routing decision has been made.

I could of course add a explicit source routing rule for any packets=20
coming from the external device to go out ppp0, but that's undesirable,=20
because I also want to allow incoming traffic on eth0 to talk to this=20
device (again using DNAT/port forwarding). In this case the replies will=20
work without any special routing rules, since eth0 is in fact the=20
default route.

Not sure if this clarified anything, but it still seems to me I need to=20
leverage the connection tracking with packet marking to be able to=20
ensure the reply packets that should go back out a non-default route=20
actually does that.

