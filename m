From: JinHyung Park <jinhyung@gmail.com>
Subject: Re: I wanna make a new target like SNAT..
Date: Thu, 14 Jul 2005 13:26:01 +0900
Message-ID: <9b2a1cff050713212669b7d0e2@mail.gmail.com>
References: <9b2a1cff05071315243f973f68@mail.gmail.com>
	<20050713232042.GA25550@bender.817west.com>
Reply-To: JinHyung Park <jinhyung@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050713232042.GA25550@bender.817west.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

first, thank you for your answer :)
 sorry for my poor English....
 ok.. explain again..
 i'm administrator of our school's computer lab,=20
i have 50 static real ip. and i have 50 computers..
 but some server that we need just allows to connect just 10 static ip.
 so, i wanna use SNAT, it can be possible any 10 seats can use that server.=
=20
 is it clear?
 for example,
 # SNAT pool for remaining IP's
iptables -t nat -A POSTROUTING \
-m iprange --src-range 192.168.0.1-192.168.0.50 \
-j SNAT --to-source 1.1.1.1-1.1.1.10
 and rest of 40 private ip ( any ip, it can be 192.168.0.1<http://192.168.0=
.1>,=20
192.168.0.8 <http://192.168.0.8>, 192.168.0.13-192.168.0.50 )
 are needed to map 1:1 to 1.1.1.10-1.1.1.50..
 but i heard iprange match module, just *match* that rule, so..
it could make NAT to 1.1.1.1:1000 <http://1.1.1.1:1000> from another privat=
e=20
ip although 1.1.1.1 <http://1.1.1.1> is already connected to
192.168.0.1<http://192.168.0.1>... ( port nat.. )
 could you help me?
 i made a new target module is similar with NETMAP target, that module get=
=20
works like this :
 iptables -t nat -A POSTROUTING -d 192.168.0.1-192.168.0.50 -j SNAT --to=20
1.1.1.1-1.1.1.10

but i don know how to move the packets the next rule after all static ip ar=
e=20
used..
if all 1.1.1.1-1.1.1.10 are connected from 10 ip of 192.168.0.1-192.168.0.5=
0
,
another ip's packets are dropped..
 sorry again for my poor English..
 2005/7/14, Jason Opperisano <opie@817west.com>:=20
>=20
> On Thu, Jul 14, 2005 at 07:24:28AM +0900, JinHyung Park wrote:
> > hi..
> > i want to make a new target that works like SNAT, but M:N SNAT..
> > i mean, there are 50 computers and each has a private ip like=20
> 192.168.0.x..
> > 10 computers need a specific ip of my 50 real ip.
> > so, i want that computers to give given range IPs, and another computer=
s
> > follow anoter iptables rule.
> > for example, i have 1.1.1.1~1.1.1.50 ip, and 1.1.1.1~1.1.1.10 is specia=
l
> > IPs..
> > and my 50 computers has a private network, 192.168.0.1~192.168.0.50,
> > some computer that need specific IP assign ( range 1.1.1.1~1.1.1.10 )=
=20
> and
> > another 40 computers just follow other iptables rule..
> > (like,
> > iptables -t nat -A POSTROUTING -d 192.168.0.1-192.168.0.50 -j NEWTARGET=
=20
> --to
> > 1.1.1.1-1.1.1.10
> > and, if all 1.1.1.1-1.1.1.10 are used, other private computer follow
> > another rule.. )
> > i checked ipt_NETMAP.c, just my thought, make a newtarget likes NETMAP=
=20
> with
> > idea like ip pool, but i don know how to pass the next rule if all
> > 1.1.1.1-1.1.1.10 are used. if there is no IP, just return NF_ACCEPT ? ;=
;
> > does I make a sense?
> > please help me...
>=20
> i am surely unclear on what you're trying to do, but if the situation is
> that 192.168.0.1 <http://192.168.0.1> - 192.168.0.10 <http://192.168.0.10=
>need to be statically mapped to=20
> 1.1.1.1 <http://1.1.1.1>
> - 1.1.1.10 <http://1.1.1.10>, and the rest of the network should be mappe=
d=20
> to the
> remaining pool of public addresses, 1.1.1.11 <http://1.1.1.11> - 1.1.1.50=
<http://1.1.1.50>,=20
> you could just
> use SNAT rules:
>=20
> # one-to-one mappings for .1 - .10
> for i in `seq 1 10`; do
> iptables -t nat -A POSTROUTING -s 192.168.0.${i} \
> -j SNAT --to-source 1.1.1.${i}
> done
>=20
> # SNAT pool for remaining IP's
> iptables -t nat -A POSTROUTING \
> -m iprange --src-range 192.168.0.11-192.168.0.254 \
> -j SNAT --to-source 1.1.1.11-1.1.1.50
>=20
> i'm sure i've missed the point, but who knows--maybe not.
>=20
> -j
>=20
> --
> "Stewie: Now look here...Jo-LENE. I have an army to raise and I must
> get to Managua at once. I require a window seat and an in-flight Happy
> Meal. BUT NO PICKLES. OH, GOD HELP YOU IF I FIND PICKLES."
> --Family Guy
>=20
>=20


--=20
-----------------------------
+82-10-3161-0419 (Korea,South)
jinhyung@gmail.com
-----------------------------
