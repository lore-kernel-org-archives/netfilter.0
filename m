From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: ipset: stops working after a while
Date: Thu, 7 Jun 2012 17:22:41 -0400
Message-ID: <201206071722.41790.neal.p.murphy@alum.wpi.edu>
References: <4FD03AE5.9000509@gmc.lt> <alpine.DEB.2.00.1206070856221.11710@blackhole.kfki.hu> <4FD0E83D.7030806@gmc.lt>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4FD0E83D.7030806@gmc.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="windows-1252"
To: netfilter@vger.kernel.org

On Thursday 07 June 2012 13:43:25 Aidas Kasparas wrote:
> On 2012.06.07 09:59, Jozsef Kadlecsik wrote:
> > Maybe your given set gets full. From the manpage:
> >=20
> > "When  entries  added  by the SET target of iptables/ip6tables, the=
n the
> > hash size is fixed and the set won't be duplicated,  even  if  the =
 new
> > entry cannot be added to the set."
>=20
> Ok. But if set is full, and I list it, it should show at least some
> members present. When it stops working, it shows no members at all.
>=20
> On the other hand, I create sets with timeout 10. So, every 3 secs th=
ere
> should be expiration process which trows ~ 1/3 of entries from each
> chain. And this should make place for some new entries.

I'll address *your* problem, not the problem you observed with the ipse=
t code=20
(which may be a real problem).

How many entres are in the set when it is 'full'? Have you tried settin=
g the=20
initial size of the hash to the maximum (64ki?)?

Utilization of a set ought to be non-deterministic because you can't kn=
ow how=20
many 'new' addresses will arrive in any given time interval. In other w=
ords (a=20
contrived example), suppose at time T you had 64ki addresses in the has=
h with=20
20,000 set to expire in 3=E2=85=93 seconds (the rest later). In the nex=
t 3333ms, 2000=20
new addresses arrive but can't fitin the set. At T+3333ms, 20k addresse=
s=20
expire. In the next 2000ms, 21k new addresses arrive; 1000 of them won'=
t fit=20
in the set. 80Mb/s allows for a lot of packets; even slow consumer-grad=
e=20
switches can exceed 64ki addresses in 10 seconds via SYN packets.

Given all that, can you redesign your sets so you don't (maybe can't) f=
ill=20
them?
