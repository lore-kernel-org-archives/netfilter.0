From: Antonio Alvarez <aramirez@teneinformatica.com>
Subject: Re: iptables and iproute
Date: Mon, 26 Apr 2004 09:08:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082966886.1772.18.camel@Toshiba.Toshiba>
References: <1082964013.1772.14.camel@Toshiba.Toshiba>
	 <1082965885.1794.1.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082965885.1794.1.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter <netfilter@lists.netfilter.org>

El lun, 26-04-2004 a las 08:51, Cedric Blancher escribi=F3:
> Le lun 26/04/2004 =E0 09:20, Antonio Alvarez a =E9crit :
> > The problem is how can i control the packet localy generated( ip and
> > port )??? =20
> > i can't mangle this packet before routing :-/
>=20
> You can mangle them in OUTPUT chain...
Uhm.... not sure. you can mangle the packet but when the packet go
output the packet was routed :-(=20

>=20
> > In sumarize it's possible to use different routing tables with packet
> > generated localy??
>=20
> Yes.
> One solution, amoung others : mark them in OUTPUT and route against
> nfmark.




