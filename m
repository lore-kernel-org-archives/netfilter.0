From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: NAT Helpers?
Date: Mon, 12 Sep 2005 07:52:34 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2A9A@farmer.vikus.com>
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
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
> Sent: Sunday, September 11, 2005 8:09 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: NAT Helpers?
>=20
> On Saturday 2005-September-10 00:05, James Stickland wrote:
> > My problem with this network setup is that when the terminal server
>=20
> With WHAT network setup? I saw no information about a network.
>=20
> > attempts to join the domain, or do such things as browse all the=20
> > network shares (as opposed to typing in their ip address),=20
> it attempts=20
> > connections to the 10.10.10.7 broadcast address.  The problem lies=20
> > within the router  - it does not forward broadcasts.
>=20
> Why not? A broadcast is just another IP. This is sometimes=20
> true but not always true. It might depend on your rules. A=20
> clear explanation of the issue helps in finding a resolution.

I actually tried once to get DHCP to broadcast across two subnets with
no success (I allowed the ports to be forwarded, didn't block 0.0.0.0 or
255.255.255.255, etc.). Of course DHCP uses 0.0.0.0 and 255.255.255.255
so that may be a special case. But usually broadcast addresses are
defined within a subnet (like 10.0.0.255) and so I would think they
wouldn't be routed outside the subnet by design.

Just my thoughts - or maybe I misunderstood this part of the issue.

Derick Anderson

