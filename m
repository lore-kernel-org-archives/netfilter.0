From: yunus <yunus@neduet.edu.pk>
Subject: Re: iptables on Satellite receive only linux PC
Date: Wed, 28 Jul 2004 12:00:53 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41074F24.2BF980C3@neduet.edu.pk>
References: <410736B8.D9130BBF@neduet.edu.pk> <1090995073.2141.35.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

When I change the line below to accept everything works fine.

$IPTABLES -P FORWARD DROP    to  $IPTABLES -P FORWARD ACCEPT

             netfilter@lists.netfilter.org

Cedric Blancher wrote:

> Le mer 28/07/2004 =E0 07:16, yunus a =E9crit :
> > In my last post I got good suggestions. Unfortunately they dont work.
> > This is a linux PC with satellite receive only card. The router is al=
so
> > on the same network that is taking the traffic outside. Linux PC runn=
ing
> > iptables has a satellite receive only pentanet card (data is received
> > and transmitted through cisco router.)
>
> Juste a bet. Have you desactivated reverse path filtering that does not
> allow asymetric routing from working ?
>
>         echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters
>
> --
> http://www.netexit.com/~sid/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98=
EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!


