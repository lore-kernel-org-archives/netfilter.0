From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: netfilter optimization.
Date: Sat, 25 Aug 2007 11:51:14 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B9@pxtbenexd01.pxt.primeexalia.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B7@pxtbenexd01.pxt.primeexalia.com>
	<46D06DA0.1010706@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <46D06DA0.1010706@solutti.com.br>
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
To: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: netfilter@lists.netfilter.org

>     You missed some important informations. How many machines are
> behind
> this firewall ? Are they client machines or are they servers ? Are we
> talking of lots of machines that generates low traffic of we're =
talking
> of some machines that generate LOTS of traffic ??
>=20
>     Please tell us about your network cenary.
>=20
Leonardo,=20

Approximately 50 physical servers running about 300 Xen instances as =
well as other Windows stuff.  We have three class C IP ranges coming in. =
 We balance some of this internally with ipvsadm.  So, in most cases, we =
have one physical external IP coming in per VIP, going to one of several =
machines on the back end. =20

Then we have several other machines that are NAT'd for very specific =
ports.  In particular, we have a set of web servers that get an extreme =
number of connections, usually in the afternoon, PST, which will exhaust =
the pool.

We have tried to balance direct routing and NAT'ing when we can.  That =
is, if we can direct route, we do it.  In some cases, we simply don't =
have the IP's for it.

So, this leads us to solving the connection pooling issue.  We have two =
1.8ghz machine with 512MB, one is the active firewall, the other one =
would be the failover.  Each one has 4 nics, two onboard 100MB and a =
dual 1GB.  Here is the config:

eth0 -> INET (100MB)
eth1 -> Private, heartbeat for linux-HA (100MB) -- Future implementation
eth2 -> DMZ (1GB)
eth3 -> Internal (1GB)

DMZ has public IP's and private IP's.

x.x.51.0/24, x.x.52.0/24, x.x.53.0/24, 10.0.64.0/21.

IP, such that x.x.51.128/25 goes to an ipvs instance, which then =
forwards it to something on the 10.0.64.0/24 range.
IP, such that x.x.52.0/24 goes to an ipvs instance, which then forwards =
it to something on the 10.0.68.0/22 range.
IP, such that x.x.53.0/24 gets direct routed in most cases.
IP, such that x.x.51.0/25 gets routed in a couple different ways (both =
direct and ivps).

As for client workstations behind it, zero, but we do have both direct =
and NAT'd traffic originating from inside the network (email, Windows =
update requests, etc).

I used to have a good png file from Visio that showed this but it's so =
outdated...  I need to update it. =20

Anyway, this is one of the reasons we are rebuilding the firewalls.  The =
other reason being a spinlock but in that kernel version.  So, we wanted =
to go with something fresher.

This is the overall high level layout.

Gary

