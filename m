From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: Re: iptables and iproute
Date: Mon, 26 Apr 2004 09:10:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082967005.1772.21.camel@Toshiba.Toshiba>
References: <1082964013.1772.14.camel@Toshiba.Toshiba>
	 <1082966119.19776.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082966119.19776.1.camel@localhost>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter <netfilter@lists.netfilter.org>

El lun, 26-04-2004 a las 08:55, John A. Sullivan III escribi=F3:
> On Mon, 2004-04-26 at 03:20, Antonio Alvarez wrote:
> > Hello every body!
> >=20
> > I have a machine with 4 ethernet interfaces, 3 directly connected to
> > ADSL lines a the another one to a LAN.
> >=20
> > I have 3 routing tables with iproute ( each one with his default gw f=
or
> > each ADSL line )
> >=20
> > I don't have problems with packet traversing my linux machine ( mangl=
e
> > the packet in the PREROUTING chain ) to routing.
> >=20
> > The problem is how can i control the packet localy generated( ip and
> > port )??? =20
> > i can't mangle this packet before routing :-/
> >=20
> > for example a need to use ssh server in the linux machine using ADSL =
1=20
> > but when the machime aswer me use the ADSL 3 ( because this is the
> > default gw in the main routing table :-( ...=20
> >=20
> > In sumarize it's possible to use different routing tables with packet
> > generated localy??
> <snip>
> I don't recall the syntax off the top of my head but isn't it possible
> to create a iproute2 rule where iif =3D lo to route locally generated
> packets.  I believe that's how we do it in the ISCS project. You can
> check the ISCS training docs at http://iscs.sourceforge.net - John

Ok, Iam looking for in the web.

Thanks



