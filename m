From: John Lister <john.lister@kickstone.com>
Subject: Re: Basic routing
Date: Sun, 05 Oct 2014 16:41:25 +0100
Message-ID: <543166A5.5090808@kickstone.com>
References: <m0nhf2$oqq$1@ger.gmane.org> <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org> <542F9BEE.9070802@kickstone.com> <m0okc1$g5m$1@ger.gmane.org> <542FFCA2.3010208@bringe.com> <m0p2g0$clr$1@ger.gmane.org> <m0pbme$ifl$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kickstone.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:references:subject:subject:to:mime-version:user-agent:from:from
	:date:date:message-id; s=dkim; t=1412523670; x=1413387671; bh=6a
	UvbHJ9PoiuTOCgfPOQIAMMrJB9ZE54P4qmObzEuOg=; b=br8AingizwVz4pdu6U
	lbZ6nks3hbd4+5zhs8op4SBmuoZty9iMGEPy7rBALhYkT/Fz5f+VvHAJHwsErzvW
	eajLjPLH4fKAuqUqmqZxGFFeAFXJW30lEetbz3BCTWkFs4Gf8gbNjB0it2lwi3I8
	KNG8tKCoyzuo6oIFCQkZb9zLk=
In-Reply-To: <m0pbme$ifl$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: John Smithee <for-gmane@mutluit.com>, netfilter@vger.kernel.org


On 04/10/2014 18:44, John Smithee wrote:
> John Smithee wrote, On 10/04/2014 05:07 PM:
>> Thomas B=E4tzler wrote, On 10/04/2014 03:56 PM:
>>> Hi,
>>>
>>> Am 04.10.2014 um 13:06 schrieb John Smithee:
>>>> Ok, I admit using "ping -I" was a bad example. The whole point I t=
ried
>>>> to make is, that the second net (69.0) cannot reach any other IP
>>>> outside its own net.
>>>> The goal is to let 69.0 reach the world via this gateway machine
>>>> 68.22/69.22.
>>>> Is some iptables needed in this case?
>>>
>>> You do have IP forwarding enabled?
>>>
>>> If not,  enable it using
>>>    echo "1" > /proc/sys/net/ipv4/ip_forward
>>> and try again.
>>>
>>>
>>> HTH,
>>> Thomas
>>
>>
>> Yes, ip frowarding is enabled.
>>
>> After doing much research on the net and experimenting
>> I think (still testing) I finally found a solution,
>> but it's unfortunately a little bit complicated.
>> I'll summarize later.
>
>
> I finally managed to get it working with these steps:
>
> IF0=3D"eth0"
> NW0=3D"192.168.68.0/24"
> ET0=3D"192.168.68.22"
> GW0=3D"192.168.68.254"
> TAB0=3D"my0"  # must be defined in /etc/iproute2/rt_tables, f.e. 100 =
my0
>
> IF1=3D"eth1"
> NW1=3D"192.168.69.0/24"
> ET1=3D"192.168.69.22"
> GW1=3D"192.168.69.7"
> TAB1=3D"my1"  # must be defined in /etc/iproute2/rt_tables, f.e. 101 =
my1
>
> ip route add $NW0 dev $IF0 src $ET0 table $TAB0
> ip route add default via $GW0 table $TAB0
>
> ip route add $NW1 dev $IF1 src $ET1 table $TAB1
> ip route add default via $GW1 table $TAB1
>
> ip route add $NW0 dev $IF0 src $ET0
> ip route add $NW1 dev $IF1 src $ET1
>
> # your preference for default route:
> ip route add default via $GW0
>
> ip rule add from $ET0 table $TAB0
> ip rule add from $ET1 table $TAB1
> ip rule add to   $ET0 table $TAB0
> ip rule add to   $ET1 table $TAB1
>
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
>
> This solution is not that bad, though IMHO complicated.
> But one thing is still missing: 69.* cannot ping
> the IP 68.22, but other than that it can reach everything else.
>
> If someone knows a simpler solution pls let me know, thx.
>
>
> Here are some references where I found the above stuff:
>
> http://kindlund.wordpress.com/2007/11/19/configuring-multiple-default=
-routes-in-linux/=20
>
> http://www.linuxhorizon.ro/iproute2.html
> http://www.lartc.org/howto/lartc.rpdb.html
> http://www.lartc.org/howto/lartc.rpdb.multiple-links.html
>

This seems overly complicated for what sounds like a simple routing=20
solution. I'm guessing there must be something slightly out of the=20
ordinary about your setup or I'm mising something. I'm assuming=20
something like this


MACHINE1-x.69.7  ---->  .69.22 - MACHINE2 - .68.22 ----> .68.254 -=20
DEFAULT ROUTER --> internet


the routing table for machine1 should be
default 192.168.69.22 0.0.0.0 eth0
192.168.69.0 * 255.255.255.0 eth0

and for machine2 is should be
default 192.168.68.254 0.0.0.0 eth0
192.168.68.0 * 255.255.255.0 eth0
192.168.69.0 * 255.255.255.0 eth1


The only issue you have is that there either needs to be a route on you=
r=20
external router to 192.68.69.0/24 via 192.168.68.22 or as you have it=20
above an iptables rule to masquerade any address on the 192.168.69=20
domain to the eth0 address so that the replies from outside your networ=
k=20
know how to get back to your private subnet.

John

>
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

