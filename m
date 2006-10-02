From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT problem
Date: Mon, 02 Oct 2006 12:42:29 +0200
Message-ID: <4520ED15.5090205@plouf.fr.eu.org>
References: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl>
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
To: netfilter@lists.netfilter.org

Hello,

Marco Berizzi a =E9crit :
>=20
> In Kernels up to 2.6.10 you can add several --to-destination options.
> For those kernels, if you specify more than one destination address,
> either via an address range or multiple --to-destination options, a
> simple round-robin (one after another in cycle)  load  balancing
> takes place between these addresses.  Later Kernels (>=3D 2.6.11-rc1)
> don't have the ability to NAT to multiple ranges anymore.

OK, SNAT and DNAT do not support multiple --to any more in kernels above=20
2.6.10. But it is unclear to me whether they still support one IP=20
address *range* (with round robin) or only one single IP address.

> Maybe the SAME target extension will help you.

The SAME target won't do round robin for the same source address. It=20
will only do round robin for separate source addresses.

What about the BALANCE target ? It's in the man page, but I had never=20
heard of it.

