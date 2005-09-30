From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: iptables spof address problem
Date: Fri, 30 Sep 2005 08:53:58 -0400
Message-ID: <FAC4E024BF776842876169173CE2F0132826@mailbox.vikus.com>
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
To: Henrik Nordstrom <hno@marasystems.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: Henrik Nordstrom [mailto:hno@marasystems.com]=20
> Sent: Friday, September 30, 2005 8:22 AM
> To: Derick Anderson
> Cc: Piotr Holubniak; netfilter@lists.netfilter.org
> Subject: RE: iptables spof address problem
>=20
> On Thu, 29 Sep 2005, Derick Anderson wrote:
>=20
> > I reiterate: a properly spoofed packet is completely identical to a=20
> > genuine one. It is not Netfilter's or the kernel stack's=20
> fault, it is=20
> > a simple fact of life that bits are bits. With an=20
> intelligent switch=20
> > this kind of attack can be stopped provided the switch is=20
> set to use a=20
> > 1-to-1 ratio of ports to MACs and to drop invalid packets.=20
> However, it=20
> > is not possible prevent this attack when nothing separates the two=20
> > boxes but twisted pair.
>=20
> Well, if all you have between the boxes is a twisted pair,=20
> then identifying who sent the spoofed packet is trivial (you=20
> know where the other end of that cable is, don't you?). And=20
> also making anti-spoof rules is equially trivial. You know=20
> both MAC and IPs that box should use so making a filter=20
> ruleset to drop everything else is trivial. In this case you=20
> should not even need to care about MAC spoofing and as the=20
> MAC addrssing is only relevant between the two boxes..=20
> (unless ofcourse if you act as a bridge to some other interface)

Apologies for not being more precise... Yes the hub/dumb switch is
necessary.

> Problems to trace spoofing in an Ethernet arise if there is a=20
> HUB or switch without MAC locking features. In HUB based=20
> networks it is really bad as all you can tell is that the=20
> packet came from some station in the network connected to=20
> that HUB. In the switched network you may be able to find the=20
> originating port by querying the switch for its MAC=20
> forwarding table (each time a switch sees a new source MAC=20
> address on a port it is registered in the MAC forwarding table).

Which is essentially what I said above.

>=20
> Regards
> Henrik
>=20

Derick Anderson

