From: "Christopher Lyon" <cslyon@affant.com>
Subject: RE: NAT issues on a VPN tunnel
Date: Tue, 2 Nov 2004 16:35:25 -0800
Message-ID: <9AD7A9B0E0BFCF42A76E29CF9F5B4087B46615@carbon.netsvcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Jason Opperisano
> Sent: Tuesday, November 02, 2004 4:24 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: NAT issues on a VPN tunnel
>=20
> On Tue, 2004-11-02 at 10:40, Chris Lyon wrote:
> > So, I am trying to use NAT to solve the problem below because of an
IP
> > addressing conflict issue but I am not having much luck. Basically
all
> of
> > the Site A needs to get to only a few devices at each site B&C so I
am
> > trying to do PREROUTING NAT on the far end systems.
>=20
> try doing it with POSTROUTING on the local system (site a).

I believe that would cause a problem on the VPN tunnel as the endpoints
won't match. This would need to be done on the far end (site b).=20

>=20
> -j
>=20
> --
> "I bent my wookie."
> 	--The Simpsons
>=20
>=20



