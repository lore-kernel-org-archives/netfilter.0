From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: assymetrical routing, iptables problem.
Date: 03 Oct 2002 08:46:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033627561.652.9.camel@elendil>
References: <Pine.BSO.4.33L0.0210022200040.16901-100000@sinister.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.BSO.4.33L0.0210022200040.16901-100000@sinister.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Bob Keyes <bob@sinister.com>
Cc: netfilter@lists.netfilter.org

Le jeu 03/10/2002 =E0 04:15, Bob Keyes a =E9crit :
> on A:
> # iptables -t nat -A PREROUTING -d 1.1.1.1 -p tcp --destination-port 80=
 \
>   -j DNAT --to-destination 2.2.2.2:8000
> Redirects packets destined for 1.1.1.1 port 80 to 2.2.2.2 port 8000. Th=
is
> is a way to 'tag' the packets (I opted against using any TCP options, a=
s
> routers/firewalls along the way may play with said options).
> on B:
> # iptables -t nat -A POSTROUTING -s 2.2.2.2 -p tcp --source-port 8000 -=
j \
>   SNAT --to-source 1.1.1.1:80
> This translates the source back to it's proper address for the right
> packets and sends it out.

You really should use a GRE tunnel between your two routers and route
your 1.1.1.1 IP directly through it. I use it quite often when migrating
hosts from one location to another (physically or logically) without
havin to change IP addresses.

See Linux Advanced Routing adn Traffic Control HOWTO (http://lartc.org/)
for GRE set up.

Note that you can also use packet MARK packets to identify them using
mangle table which prevents you to alter layer 4 stuff. You can also use
this MARK to route packets using iproute (see LARTC).

> The problem is, the latter half of this doesn't work. What I really wan=
t
> is SNAT in OUTPUT, as I believe that POSTROUTING won't touch packets th=
at
> originate on the local machine.

SNAT on POSTROUTING will also affect locally originated packets as they
get through this chain.

> Of course I could stick another linux
> system inbetween the web server B and the T1 router, but I'd rather not
> waste the space/electricity/time.


--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

