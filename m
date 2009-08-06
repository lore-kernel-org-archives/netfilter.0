From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: Re: Building network
Date: Thu, 6 Aug 2009 13:18:09 +0200
Message-ID: <a72d2cfe2db630c3ff5a4ddb83062fc2.squirrel@webmail.vp44.net>
References: <ca067d757753e0893cbebd61d2c90c8c.squirrel@webmail.vp44.net>
    <b4a3339c0908060310p1314e793q8cd3a183cb8f59e3@mail.gmail.com>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b4a3339c0908060310p1314e793q8cd3a183cb8f59e3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Makara <chanmakara@gmail.com>
Cc: netfilter@vger.kernel.org, debian-firewall@lists.debian.org

On Thu, August 6, 2009 12:10 pm, Makara wrote:
> Hi Jack,
>
> Would you mind to draw out your idea and network diagram so that we can
> understand it well ?.
>
> Example:
>
>  {ISP}----------(eth0)-{Debain}-(eth1)--{Switch}----{server2}
>                                                         |        \
>                                                     {server 2} {LAN}
> you would like ......
>
>
>
> On Thu, Aug 6, 2009 at 2:55 PM, Jack Knowlton <jknowlton@vp44.com> wrote:
>
>> Hi all.
>> I have just switched to a new DSL provider and I need some serious help
>> re-building my iptables/routing setup for the new connection.
>> The ISP now provides me with a /29 subnet that I want to use for some of
>> the computers on my LAN.
>>
>> The access device, a DSL bridge, is attached to the debian routing box
>> (currently with 2 interfaces). According to the ISP tech department
>> (they
>> are referring to a standard soho router) I have to set the internal
>> (LAN)
>> interface to xxx.xxx.xxx.153 and the outside interface (WAN) will get
>> the
>> IP assigned by their DHCP. I then have 5 more IPs that I want to assign
>> to
>> different computers (static addressing - no internal DHCP needed).
>>
>> Since I want to host various servers, all of the computers that get
>> public
>> IPs will have to be accessible on whatever service they're hosting. In
>> the
>> case of the mailserver, the outgoing IP has to be the real one (and not
>> the routing box's) because of rdns and dnsbl issues.
>> Basically I think I do not need NAT. Unfortunately I have no idea how to
>> implement that..
>>
>> Next: there's a bunch of wifi clients that connect to an internal AP. To
>> be on the safe side I decided to keep the AP in a local LAN
>> (10.0.1.0/24)
>> and have the debian box to do NAT for them.
>> My idea would be to add a third network interface to the routing box and
>> give it a local LAN address, then use a basic iptables setup to have it
>> NAT for any local client that requests it.
>>
>> If someone has had some experience with this I would really appreciate
>> some guidence with what I'm trying to set-up.
>> Regards,
>>
>> -JK
>>
>>


Right :D
                                            {server4}
                                                |
{ISP}--{DSL-brige}--(eth0)-{Debian}-(eth1)--{Switch}-(eth0)-{server2}-(eth1)
                              |                 |                      |
                           (eth2)             (eth0)-{server3}-(eth1)  |
                              |                                   |    |
                              \---------{switch2}----------------/----/
                                            |
                                           {AP}


{Debian}
ppp0: bridge interface (PPPoE via eth0)
eth1: LAN with public IP interface (xxx.xxx.xxx.153)
eth2: LAN with private IP interface (10.0.1.2)

{server2}
eth0: LAN with public IP (in /29 subnet)
eth1: LAN with private IP (10.0.1.3)

{server3}
same as server2

{AP}
eth0: LAN with private IP (10.0.1.5)


What I want is that {Debian} does not do NAT on the LAN with public
addressing (just route the connections to the appropriate servers) but do
it for the LAN with private adresses, so that wifi clients can stay
secure.

Hope the diagram helps

-JK

