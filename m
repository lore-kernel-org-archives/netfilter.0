From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: DNAT and promiscuous mode
Date: Mon, 26 Apr 2004 16:27:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16525.28827.98470.297348@saint.heaven.net>
References: <408D40DC.2010201@ida.net>
	<1083000628.1795.4.camel@anduril.intranet.cartel-securite.net>
	<408D4875.2030407@ida.net>
	<1083001435.1795.8.camel@anduril.intranet.cartel-securite.net>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083001435.1795.8.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Cedric Blancher writes:
> Le lun 26/04/2004 =E0 19:35, Travis Johnson a =E9crit :
> > I am looking to re-direct my customers that are past due to a
> > different web page.
>=20
> Then transparent proxying is what you need and do not require
> promiscuous mode.

If the context is local users (such as dialup customers) accessing the
internet, it's not necessary to run a proxy to divert them to a
different web page.  I do this with a combination of policy routing
and DNAT.

First, set aside a small block of IP addresses to be assigned only to
overdue customers.  RADIUS does this easily.  Then route all web
queries from these addresses to the overdue site using policy routing.
I do this in a Cisco because it's there, but most any modern router,
including a Linux box, will do.  Then on the overdue site box, DNAT
all packets from those sources to the IP address and port of the
overdue site.

This works like a charm and completely ignores traffic to/from other
users.

--
Dick St.Peters, stpeters@NetHeaven.com=20

