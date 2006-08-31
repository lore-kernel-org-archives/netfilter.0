From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: diferent ports, diferent routes
Date: Thu, 31 Aug 2006 11:59:11 +0200
Message-ID: <44F6B2EF.6040601@plouf.fr.eu.org>
References: <194721190608300726y132d8718p4fab8c32f1c4efbe@mail.gmail.com>	
	<44F5A8D1.1000400@plouf.fr.eu.org>
	<194721190608310117u29fdd089r976caddc2a99fbcc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <194721190608310117u29fdd089r976caddc2a99fbcc@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

[Please reply on the list]

KNO a =E9crit :
>>
>> The POSTROUTING table is too late, after the final output routing
>> decision is made. You must create this rule in the OUTPUT chain instea=
d.
>=20
> I've try marking in OUTPUT chain and now it doent work at all. The
> packets go out, but they doent return. The rule I've added is:
> iptables -t mangle -A OUTPUT -p tcp --dport 80 -d ! 192.168.2.0/24 -j
> MARK --set-mark 1

You say the packets go out, but how far ? Do they reach the router2 as=20
expected, meaning that the destination MAC address is router2's MAC=20
address ? Do they reach the target host ? Does the target host send a=20
reply packet ?

Does your Linux box perform SNAT or MASQUERADE on the WAN interface ?

By the way, how do things work when you set the box default route via=20
router2 ?

Also, there is something unclear in your addressing scheme. You wrote :

> router1 address 192.168.2.9
> router2 address 192.168.2.10
> linux address 192.168.2.22
> linux default gateway 192.168.2.10
> lan workstations use linux as proxy (squid at port 8080) 192.168.2.22

It seems that both your LAN and WAN networks use the same subnet=20
192.168.2.0/24. And :

> :~# ip route ls
> 192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.252
> default via 192.168.2.9 dev eth0

I understand these are the routes on the WAN interface. Where are the=20
interface and route to the LAN ?

