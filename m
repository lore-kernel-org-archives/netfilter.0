From: "Don Woodruff" <donw@minglewood.net>
Subject: RE: Can't forward Win2k VPN through NAT
Date: Fri, 6 Sep 2002 16:24:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6BED17A9718E204F812CBBAF3B102E2AC000@babylon.metropolis.minglewood.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>=20
> I agree that PPTP is an independent standard, and not a M$-developed
> protocol, however I consider it to be by far an inferior way to set up
a
> VPN
> than IPsec, and therefore I disapprove of Win2k for having provided
users
> with PPTP and not IPsec.
>=20
> Also, I believe that PPTP has significantly greater problems than
IPsec
> with
> NAT.   Basically IPsec in transport mode does not work through NAT at
all,
> but IPsec in tunnel mode works without any need for helpers etc.   As
far
> as
> I'm aware, there are limitations on the number of concurrent PPTP
sessions
> you can maintain through a single NAT device (because of the address
> information embedded in PPTP, not because of anything to do with the
> device),
> whereas there is no such limitation with IPsec in tunnel mode.


Agreed -- IPSEC is better. Again -- it is the protocol that is lacking.
=20
> > As a business-owner, my new focus is "whatever provides the greatest
> > profit margin coupled with the most satisfactory experience for the
> > customer".
>=20
> I'm afraid here again I'm going to use Microsoft as an example that
these
> two
> objectives can easily turn out to be mutually exclusive (or at least,
> competing rivals).

Hmmm, I'd have to say that this is more the reseller/consultant's fault
than MS'. The biggest contributor to the aforementioned conflict is the
VAR/reseller who sells one line of solutions (more often than not
Windows, since it is easy and requires minimal technical expertise),
rather than the vendor. If I made a crappy car that everybody loved and
bought in droves, what impetus would I have to improve it? People
continue to buy cars, despite the fact that it is highly likely that the
car & oil merchants have kept innovation to a minimum in order to sell
more units. Unfortunately there is no open-source auto manufacturer :)


