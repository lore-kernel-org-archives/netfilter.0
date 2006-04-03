From: Johnny Casey <emailwastefilter-listnetfilter@yahoo.com>
Subject: Re: Lost packets - strange problem
Date: Mon, 03 Apr 2006 04:45:23 -0500
Message-ID: <4430EEB3.7040700@yahoo.com>
References: <1143483717.776638.226080@u72g2000cwu.googlegroups.com>	<b9800b70603271128h7d0372b9ie7abf79780420042@mail.gmail.com>
	<b9800b70603271233p2507e071k317dde92dc72448d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b9800b70603271233p2507e071k317dde92dc72448d@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Mart=EDn_Ferrari?= <martin.ferrari@gmail.com>
Cc: netfilter@lists.netfilter.org

Mart=EDn Ferrari wrote:
> (x-posted in linux-net mailing list)
>=20
> Hi!
>=20
> I'm having a very strange problem. I have already tested a *lot* of
> things before asking, and I still have no clue of what's happening.
>=20
> I have 6 linux boxes acting as firewalls/routers. They have been using
> similar configurations and netfilter rules for 4 years, when I
> installed the first of these. Some of them route more than 10 Mbps
> between interfaces, 50000+ connections tracked with netfilter, traffic
> shaping, NAT, and stuff, and they don't even blink.
>=20
> BUT, two of them started giving headaches, they don't have the highest
> usage, but they lose packets (in any interface) up to 80%, sometimes
> softirqd eats all the cpu, and you cannot even connect to the boxes.
> This does not happen from the very first day, and not all the time!
>=20
> The NICs are mostly 3c905*(a mix of them), also some e100 and 3c940
> (sk98lin). The troublesome computers have 3c905 and 3c940, but I do
> not find any pattern on hardware.

I think the 3c940s are the problem.  I have a desktop box which works
for a while and then the interface degrades for no apparent reason.  No
errors appear in the log, or in ifconfig.  Bringing down the interface,
removing the module works, but not reliably.  Sometimes I just reboot.
This started happening around kernel 2.6.14-2.6.15 or some such.

Maybe we can track it down?

The hard to test bit is that it takes a while before the problem starts.

> Also, the error count is 0 in the internet interface of the host which
> fails the most.

same here.

...

> Any help would be greatly appreciated!
>=20
> --
> Mart=EDn Ferrari

Maybe we can try narrowing the kernel search.  Unfortunately I'm also
using the Promise-SATA-PATA git from jgarzik...

HTH,
Johnny

