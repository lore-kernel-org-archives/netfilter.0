From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Anybody heard about UP&P ?
Date: Fri, 20 Feb 2004 21:34:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040220203434.31CBB3A0@sterenborg.info>
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

> UPNP means Universal Plug'n'Play. I guess WinXP looks to=20
> automagically reconfigure the NAT rules via upnp.
>=20
> No idea about the netfilter stuff myself I'm afraid.
>=20
> > From: Marc Recht=E9 [mailto:mrechte@randodetente.org]
> >=20
> > To enable remote assistance from Internet of a WinXP PC on=20
> a LAN using=20
> > NAT one must have a UP&P NAT compatible router.
> >=20
> > Can Netfilter act as such a router, and if so do you have=20
> an idea of=20
> > the chain to apply ?

Netfilter doesn't do UPnP.

Maybe you can use this information :
http://support.microsoft.com/default.aspx?scid=3Dkb;en-us;q301529
http://www.pccitizen.com/remotecontrol.htm#C.%20XP%20Remote%20Assistance/=
Rem
ote%20Control

It says something about "opening up port 3389" but I don't know if it's =
tcp,
udp or both... I think that in your case you have to forward the packets
coming in from this port to your WinXP box.


Gr,
Rob


