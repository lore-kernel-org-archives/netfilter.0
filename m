From: John Smithee <for-gmane@mutluit.com>
Subject: Re: Basic routing
Date: Sat, 04 Oct 2014 19:44:46 +0200
Message-ID: <m0pbme$ifl$1@ger.gmane.org>
References: <m0nhf2$oqq$1@ger.gmane.org> <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org> <542F9BEE.9070802@kickstone.com> <m0okc1$g5m$1@ger.gmane.org> <542FFCA2.3010208@bringe.com> <m0p2g0$clr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m0p2g0$clr$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

John Smithee wrote, On 10/04/2014 05:07 PM:
> Thomas B=E4tzler wrote, On 10/04/2014 03:56 PM:
>> Hi,
>>
>> Am 04.10.2014 um 13:06 schrieb John Smithee:
>>> Ok, I admit using "ping -I" was a bad example. The whole point I tr=
ied
>>> to make is, that the second net (69.0) cannot reach any other IP
>>> outside its own net.
>>> The goal is to let 69.0 reach the world via this gateway machine
>>> 68.22/69.22.
>>> Is some iptables needed in this case?
>>
>> You do have IP forwarding enabled?
>>
>> If not,  enable it using
>>    echo "1" > /proc/sys/net/ipv4/ip_forward
>> and try again.
>>
>>
>> HTH,
>> Thomas
>
>
> Yes, ip frowarding is enabled.
>
> After doing much research on the net and experimenting
> I think (still testing) I finally found a solution,
> but it's unfortunately a little bit complicated.
> I'll summarize later.


I finally managed to get it working with these steps:

IF0=3D"eth0"
NW0=3D"192.168.68.0/24"
ET0=3D"192.168.68.22"
GW0=3D"192.168.68.254"
TAB0=3D"my0"  # must be defined in /etc/iproute2/rt_tables, f.e. 100 my=
0

IF1=3D"eth1"
NW1=3D"192.168.69.0/24"
ET1=3D"192.168.69.22"
GW1=3D"192.168.69.7"
TAB1=3D"my1"  # must be defined in /etc/iproute2/rt_tables, f.e. 101 my=
1

ip route add $NW0 dev $IF0 src $ET0 table $TAB0
ip route add default via $GW0 table $TAB0

ip route add $NW1 dev $IF1 src $ET1 table $TAB1
ip route add default via $GW1 table $TAB1

ip route add $NW0 dev $IF0 src $ET0
ip route add $NW1 dev $IF1 src $ET1

# your preference for default route:
ip route add default via $GW0

ip rule add from $ET0 table $TAB0
ip rule add from $ET1 table $TAB1
ip rule add to   $ET0 table $TAB0
ip rule add to   $ET1 table $TAB1

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


This solution is not that bad, though IMHO complicated.
But one thing is still missing: 69.* cannot ping
the IP 68.22, but other than that it can reach everything else.

If someone knows a simpler solution pls let me know, thx.


Here are some references where I found the above stuff:

http://kindlund.wordpress.com/2007/11/19/configuring-multiple-default-r=
outes-in-linux/
http://www.linuxhorizon.ro/iproute2.html
http://www.lartc.org/howto/lartc.rpdb.html
http://www.lartc.org/howto/lartc.rpdb.multiple-links.html




