From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: bandwidth monitoring
Date: Thu, 6 Jan 2005 12:28:20 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E3AB@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: "J. Nerius" <jnerius@gmail.com>, Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

J. Nerius wrote:
> How many hosts and how much traffic are you running through it? I've
> wanted to come up with a solution similar to the one you've described
> to replace my current bandwidthd setup but I'm thinking that my
> network may be too large with too much traffic to support something
> like that without building a monster box just to capture the stats.
>=20

If you have a small static number of hosts in/out of your system, you
may want to use netfilter blank rule counters since the penalty of
passing each counter is very very low (entirely kernel side).

To put this in perspective, there've been a lot of performance issues
with people running 10000+ rule sites with adverse effects on their
network setup. Lower than that, and the impact is pretty low. Plus,
blank rules don't do anything but increment the counter, so the actual
CPU utilization of these rules are even lower. This is to give maxumum
accounting of an existing kernel. I'm sure there have been a few
in-kernel accounting packages made, but I can't recall any at the
moment. Maybe someone here can refresh our memory.

Of course the problem with this approach is that you have to know what
IP's that are generating traffic before setting this thing up since the
iptables rules are static. Its good if you want to monitor internal
user's traffic to the net and the amount of traffic a server is getting,
but to actually track the internet endpoints, you're better off using a
dynamic traffic tracking tools like ntop or bandwidthd.


