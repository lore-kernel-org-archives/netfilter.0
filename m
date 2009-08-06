From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: Re: Building network
Date: Thu, 6 Aug 2009 14:10:46 +0200
Message-ID: <3b57141ce673ae6fbf76d2146fd24926.squirrel@webmail.vp44.net>
References: <ca067d757753e0893cbebd61d2c90c8c.squirrel@webmail.vp44.net>
    <b4a3339c0908060310p1314e793q8cd3a183cb8f59e3@mail.gmail.com>
    <a72d2cfe2db630c3ff5a4ddb83062fc2.squirrel@webmail.vp44.net>
    <cfd8acdc0908060433g30297806oeb9d2a7cde7dcfbf@mail.gmail.com>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfd8acdc0908060433g30297806oeb9d2a7cde7dcfbf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: lesley.binks@gmail.com
Cc: netfilter@vger.kernel.org, debian-firewall@lists.debian.org

On Thu, August 6, 2009 1:33 pm, Lesley Binks wrote:
> 2009/8/6 Jack Knowlton <jknowlton@vp44.com>:
>> On Thu, August 6, 2009 12:10 pm, Makara wrote:
>>> Hi Jack,
>>>
>>> Would you mind to draw out your idea and network diagram so that we=
 can
>>> understand it well ?.
>>>
>>> Example:
>>>
>>> =C2=A0{ISP}----------(eth0)-{Debain}-(eth1)--{Switch}----{server2}
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
>>> =C2=A0 =C2=A0 {server 2} {LAN}
>>> you would like ......
>>>
>>>
>>>
>>> On Thu, Aug 6, 2009 at 2:55 PM, Jack Knowlton <jknowlton@vp44.com>
>>> wrote:
>>>
>>>> Hi all.
>>>> I have just switched to a new DSL provider and I need some serious
>>>> help
>>>> re-building my iptables/routing setup for the new connection.
>>>> The ISP now provides me with a /29 subnet that I want to use for s=
ome
>>>> of
>>>> the computers on my LAN.
>>>>
>>>> The access device, a DSL bridge, is attached to the debian routing=
 box
>>>> (currently with 2 interfaces). According to the ISP tech departmen=
t
>>>> (they
>>>> are referring to a standard soho router) I have to set the interna=
l
>>>> (LAN)
>>>> interface to xxx.xxx.xxx.153 and the outside interface (WAN) will =
get
>>>> the
>>>> IP assigned by their DHCP. I then have 5 more IPs that I want to
>>>> assign
>>>> to
>>>> different computers (static addressing - no internal DHCP needed).
>>>>
>>>> Since I want to host various servers, all of the computers that ge=
t
>>>> public
>>>> IPs will have to be accessible on whatever service they're hosting=
=2E In
>>>> the
>>>> case of the mailserver, the outgoing IP has to be the real one (an=
d
>>>> not
>>>> the routing box's) because of rdns and dnsbl issues.
>>>> Basically I think I do not need NAT. Unfortunately I have no idea =
how
>>>> to
>>>> implement that..
>>>>
>>>> Next: there's a bunch of wifi clients that connect to an internal =
AP.
>>>> To
>>>> be on the safe side I decided to keep the AP in a local LAN
>>>> (10.0.1.0/24)
>>>> and have the debian box to do NAT for them.
>>>> My idea would be to add a third network interface to the routing b=
ox
>>>> and
>>>> give it a local LAN address, then use a basic iptables setup to ha=
ve
>>>> it
>>>> NAT for any local client that requests it.
>>>>
>>>> If someone has had some experience with this I would really apprec=
iate
>>>> some guidence with what I'm trying to set-up.
>>>> Regards,
>>>>
>>>> -JK
>>>>
>>>>
>>
>>
>> Right :D
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
>> =C2=A0{server4}
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|
>> {ISP}--{DSL-brige}--(eth0)-{Debian}-(eth1)--{Switch}-(eth0)-{server2=
}-(eth1)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (eth2) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>> (eth0)-{server3}-(eth1) =C2=A0|
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A0|
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>> =C2=A0\---------{switch2}----------------/----/
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 {AP}
>>
>>
>> {Debian}
>> ppp0: bridge interface (PPPoE via eth0)
>> eth1: LAN with public IP interface (xxx.xxx.xxx.153)
>> eth2: LAN with private IP interface (10.0.1.2)
>>
>> {server2}
>> eth0: LAN with public IP (in /29 subnet)
>> eth1: LAN with private IP (10.0.1.3)
>>
>> {server3}
>> same as server2
>>
>> {AP}
>> eth0: LAN with private IP (10.0.1.5)
>>
> This is a bit confusing to me .... you have multiple instances of eth=
n
> where n=3D0,1.
> You also appear to have more than one route to a subnet and claim at
> least two interfaces with the same IP address i.e. is server 2 really
> the same as server 3 ?
>
> Your IP addresses should be passed into your Debian box - you shonuld
> then provide routes to the external facing IP addresses - is server 3
> on a NIC from the Debian box ?
> If so where is eth3 on the Debian box and what address does that have=
?
>  Likewise server 4 -- how do you route to that?
>
> <snip>
>
> Regards
>
> L.
>

My bad, I was being to simplistic.
What I meant is that {server2} and {server3} have the same setup (but
different addresses): each has two network interfaces, one connected to
the LAN with private IPs and the other connected to the LAN with public
IPs.

*The default gateway for both {server2} and {server3} should be
xxx.xxx.xxx.153 (that is interface eth1 on {Debian}).

*{server3} is connected to {Debian} via {Switch} on the LAN with PUBLIC
IPs and via {switch2} on the LAN with PRIVATE addressing.

*{server4} has only one network interface with a public IP.

I guess the first problem to solve would be routing the public IPs to t=
he
right servers. How do I do that?

-JK

