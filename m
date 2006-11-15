From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: how to change ip source address of incoming packets
Date: Wed, 15 Nov 2006 09:13:07 +0100
Message-ID: <455ACC13.2070801@freemail.hu>
References: <20768C3A-7F88-4816-8B52-2DE7A6910C64@borea.si>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20768C3A-7F88-4816-8B52-2DE7A6910C64@borea.si>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Matevz Langus <matevz.langus@borea.si>
Cc: netfilter@lists.netfilter.org



Matevz Langus =EDrta:
> Does anyone know how to change ip source address when entering Linux=20
> interface to something else and when leaving out the same interface=20
> (backwards) changing it back.
>
> The problem is this:
>
> I have 10 devices with the same IP address, 192.168.1.1. They are=20
> connected to ethernet switch, which adds VLAN TAG to packets from each =

> device. Linux box is connected to the switch. It is possible to create =

> 10 VLAN interfaces on the Linux box and only one 192.168.1.1 address=20
> will be seen per interface. In order to establish TCP connections to=20
> all devices at the same time, source address must be altered.
>
> on eth0.10, INPUT SRC 192.168.1.1 -> 192.168.10.1
> on eth0.10, OUTPUT DST 192.168.10.1 -> 192.168.1.1
> on eth0.11, INPUT SRC 192.168.1.1 -> 192.168.11.1
> on eth0.11, OUTPUT DST 192.168.11.1 -> 192.168.1.1
> ...
>
Try this :

iptables -t nat -A POSTROUTING -j SNAT -i eth0.10 -s 192.168.1.1=20
--to-source 192.168.10.1
iptables -t nat -A PREROUTING -j DNAT -o eth0.10 -d 192.168.10.1=20
--to-destination 192.168.1.1
> thanks,
>   Matevz Langus
>
>
Swifty


