From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables on Satellite receive only linux PC
Date: Sat, 31 Jul 2004 12:05:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407311205.39799.Antony@Soft-Solutions.co.uk>
References: <410736B8.D9130BBF@neduet.edu.pk> <1090995073.2141.35.camel@anduril.intranet.cartel-securite.net> <410B6CBD.949DDC2A@neduet.edu.pk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410B6CBD.949DDC2A@neduet.edu.pk>
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

On Saturday 31 July 2004 10:56 am, yunus wrote:

> Should I change /proc/sys/net/ipv4/conf/all/rp_filters =3D1.

You should "echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters"

You want the result of "cat /proc/sys/net/ipv4/conf/all/rp_filters" to be=
 0,=20
not 1.

Regards,

Antony.

> Cedric Blancher wrote:
> > Le mer 28/07/2004 =E0 07:16, yunus a =E9crit :
> > > In my last post I got good suggestions. Unfortunately they dont wor=
k.
> > > This is a linux PC with satellite receive only card. The router is =
also
> > > on the same network that is taking the traffic outside. Linux PC
> > > running iptables has a satellite receive only pentanet card (data i=
s
> > > received and transmitted through cisco router.)
> >
> > Juste a bet. Have you desactivated reverse path filtering that does n=
ot
> > allow asymetric routing from working ?
> >
> >         echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters
> >
> > --
> > http://www.netexit.com/~sid/
> > PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E=
98EE
> >
> > >> Hi! I'm your friendly neighbourhood signature virus.
> > >> Copy me to your signature file and help me spread!
>
>              netfilter@lists.netfilter.org

--=20
Users don't know what they want until they see what they get.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


