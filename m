From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: RE: Anybody heard about UP&P ?
Date: Sun, 22 Feb 2004 07:33:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077453208.2158.71.camel@grendel>
References: <739652C2AFA4834AAB5986A215F68CEC0165A9@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <739652C2AFA4834AAB5986A215F68CEC0165A9@svr1.home.compsup.net>
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

This sounds *really* fishy to me. Sounds to me like what they are
looking to do is setup a 1 to 1 NAT mapping (or possibly port
forwarding) to the host needing "remote assistance" and probably punch
open the filtering as well.=20

Do you know how how much access gets opened up? Any authentication or
encryption being used during the management session? Any guarantee that
the hole gets closed up when they are done? Any logging of the access as
well as what gets changed during the session?

You could always ask what level of access is required and just manually
create the rules yourself. At least that way you know what is going on.

I think I'm real glad Netfilter does not support this. Sounds like a
compromise waiting to happen.

C


On Fri, 2004-02-20 at 14:35, Carl Farrington wrote:
> UPNP means Universal Plug'n'Play. I guess WinXP looks to automagically =
reconfigure the NAT rules via upnp.
>=20
> No idea about the netfilter stuff myself I'm afraid.
>=20
> > -----Original Message-----
> > From: Marc Recht=E9 [mailto:mrechte@randodetente.org]
> > Sent: 20 February 2004 07:14
> > To: netfilter@lists.netfilter.org
> > Subject: Anybody heard about UP&P ?
> >=20
> > To enable remote assistance from Internet of a WinXP PC on a LAN usin=
g
> > NAT one must have a UP&P NAT compatible router.
> >=20
> > Can Netfilter act as such a router, and if so do you have an idea of =
the
> > chain to apply ?
> >=20
> > Thanks for your help
> >=20
> > Marc.
> >=20
>=20
>=20


