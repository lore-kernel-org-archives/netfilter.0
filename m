From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: REDIRECT to localhost
Date: Wed, 18 Aug 2004 08:22:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092831763.14318.39.camel@tarkus>
References: <20040816082400.5165.qmail@flock1.newmail.ru>
 <1092654950.27598.13.camel@tarkus> <200408171302.30699.igor@garant.koenig.ru>
 <1092792092.4025.4.camel@anduril.intranet.cartel-securite.net>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1092792092.4025.4.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Igor Popov <igor@garant.koenig.ru>, netfilter@lists.netfilter.org

On Wed, 2004-08-18 at 03:21 +0200, Cedric Blancher wrote:
> Le mar 17/08/2004 =E0 13:02, Igor Popover a acrid :
> > As I know, REDIRECT target redirects to the same if ace, but on a=
nother port.
>=20
> Nope.
> REDIRECT target redirects to lo interface, on the port you want.
>=20
> > I can run squid on PP if ace, because it is created dynamically a=
nd I don't=20
> > want it to listen on all addresses.
>=20
> Just have it run on 127.0.0.1, port 3128, and configure it as a
> transparent proxy (see Squid doc).
>=20
> > I have tried to use REDIRECT and DAT, but without any success.
>=20
> And finally try this :
>=20
> =09iptables -t nat -A PREROUTING -p tcp --dport 80 \
> =09=09-j REDIRECT --to-ports 3128

As long as you want ALL port 80 traffic hitting your squid. Otherwise
much better to be specific to interface or even ip block(s). Not a go=
od
idea to be mixing squid for internal use with external accelerator us=
age
IMHO.
>=20
> Should work.
>=20
>=20
Ted



