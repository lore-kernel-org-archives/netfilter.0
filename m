From: Marco Colombo <marco@esi.it>
Subject: Re: Is Linux based Gateway/Firewall feasible
Date: Fri, 9 Jul 2004 14:35:49 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407091216430.31223-100000@Megathlon.ESI>
References: <1089359194.1993.3.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089359194.1993.3.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Sudheer Divakaran <sudheer@svw.com>, netfilter@lists.netfilter.org

On Fri, 9 Jul 2004, Cedric Blancher wrote:

> Le jeu 08/07/2004 =E0 16:30, Sudheer Divakaran a =E9crit :
> >     If I'have mislead anyone, I'm Sorry.  I was talking about NATing.
>=20
> Definitly use Linux then. From all the firewalls I tested and used,
> Netfilter is the most complete, efficient and easy-going NAT solution I
> ever seen. You can perform any kind of NAT you want, either for good or
> baaaaaaad stuff :P

For NAT, you'd better list which applications you need to support.
Some of them need (mostly due to bad design) special support on=20
the NAT box. Linux won't support all of them.

Of course this is true for any NAT solution, Cisco included.
So first make sure you have all the functionality you need.

I think you may find the following link useful:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-5=
.html

.TM.
--=20
      ____/  ____/   /
     /      /       /			Marco Colombo
    ___/  ___  /   /		      Technical Manager
   /          /   /			 ESI s.r.l.
 _____/ _____/  _/		       Colombo@ESI.it


