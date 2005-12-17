From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: tarpit before or after adding chain?
Date: Fri, 16 Dec 2005 23:25:35 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B59EA@pxtbenexd01.pxt.primeexalia.com>
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
To: Eric <erbenton@comcast.net>, netfilter mailing list <netfilter@lists.netfilter.org>

It shouldn't matter.  You can add rules that jump to a chain, as long as
the chain exists, even if empty.  Then later you can add rules to that
chain.

This should also work as well.  We tarpit all data which should never
come through our firewalls.  We also disabled tracking for the same.  We
don't want the firewall wasting resources on this garbage.  Another
trick that we do is we also dedicate a high/low IP for catching things
like SQL, HTTP, VNC, RDC, etc.  This was things walking the network will
sometimes get hung, if they are not threaded.

YMMV (some of this is off the top of my head or pulled form a
iptables-save -- order is preserved, please consult man for exact
syntax)

iptables -t raw -A PREROUTING -i eth0 -p tcp -m multiport \
	--dports 135,139,445 -j NOTRACK

iptables -N filter_tarpit
iptables -A INPUT -i eth0 -j filter_tarpit
iptables -A FORWARD -i eth0 -j filter_tarpit

iptables -A filter_tarpit -p tcp -m multiport \
	--dports 135,139,445 \
	-j LOG --log-prefix "TARPIT: " --log-level 6
iptables -A filter_tarpit -p tcp -m multiport \
	--dports 135,139,445 -j TARPIT

Hope this helps,=20

Gary Wayne Smith

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Eric
> Sent: Friday, December 16, 2005 10:20 PM
> To: netfilter mailing list
> Subject: tarpit before or after adding chain?
>=20
> I'm a little confused about when to add the TARPIT trap.
>=20

