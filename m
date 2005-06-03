From: Sertys <sertys@supportivo.org>
Subject: Re: iptables on multiple CPUs (SMP & Hyperthreading question)
Date: Fri, 3 Jun 2005 12:12:08 +0000 (UTC)
Message-ID: <opsruyzzkd76nf2y@xonix>
References: <d6dfb92c05060215211afa98c@mail.gmail.com>
	<429FBD3B.4040007@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Date: Sat, 04 Jun 2005 21:29:49 +0300
In-Reply-To: <429FBD3B.4040007@gmx.co.uk>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

On Thu, 02 Jun 2005 21:15:23 -0500, /dev/rob0 <rob0@gmx.co.uk> wrote:

> Michael Buffer wrote:
>> I'm considering purchasing some firewall machines for my organization,=
 =20
>> and
>> I am trying to decide whether a machine with multiple CPUs is worth th=
e
>> additional expense performance-wise (aside from being able to assign =20
>> CPUs
>
> ??? I cannot believe this is even under consideration. Just how big is =
=20
> your organisation?
>
> I run iptables firewalls on very modest machines, with single and dual =
=20
> T1 lines, and there is never any CPU load from the packet filtering nor=
 =20
> the NAT. I don't have any really large sites, but I strongly suspect =20
> that iptables firewalling of very large sites could easily be handled b=
y =20
> dumpster-grade equipment.
>
> Of course with a budget like yours you'll want something new, which is =
=20
> better (we hope) for the physical reliability of the machine. A fast CP=
U =20
>   is useful for a fast boot time to minimise down time in the event of =
=20
> problems. Otherwise, a waste.
>
> Listen, I ran my home cable, with multiple simultaneous large downloads=
 =20
> and 3-4 busy Web browsers on a 386. It never broke a sweat. This of =20
> course used ISA 10Mbit NIC's. It could have handled many times the load=
 =20
> without problem.
>
> Why did I decommision it? Electricity. I only had so many outlets, and =
I =20
> needed a machine to perform more complex tasks, so the firewall job got=
 =20
> handed off to another machine, and the 386 was retired. Still here in =20
> case I need it again.
>
> I need a new computer ATM. How about I build a firewall machine for you=
, =20
> and you send me that SMP super machine? ;)

This of course seems to me like a stupendous statement. OK? If your =20
firewall is hit by 3000 packets per minute - that's not a great load =20
issue. But imagine you have 30000 clients you need to NAT and route. =20
That's awful lotta power and you don't have to underestimate the chance o=
f =20
you CPU not handling them. I've seen such situations in many ISP's.Their =
=20
routers(x86) just can't handle the traffic. And the dude one step before =
=20
in the thread asked you the right question anyway : Just how big is your =
=20
organisation? Measure your traffic! If it is less than 200-300 mbit/s you=
 =20
should not be worrying. If it's more and you have some intense =20
services(IDS's , slow-rule traversal,because of many rules,multiple =20
servers on each machine), that's when you shall invest your $$$ in BIGGER=
 =20
machines. Indeed linux handles SMP almost perfectly, same for HT, but bot=
h =20
of them is not a good idea(2x2 Xeons for example), because of the =20
inconvinience of the posix threading model and the lack of specialized =20
support for this type of process queuing.

--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

