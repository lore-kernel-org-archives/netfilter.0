From: "dave beach" <drbeach@rogers.com>
Subject: RE: Iptables, nat, and IPSec
Date: Tue, 5 Apr 2005 22:30:54 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAAaKAgxwShUi++SQ7B9ssOAEAAAAA@rogers.com>
References: <42534503.2070801@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42534503.2070801@lopsch.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: 'Daniel Lopes' <lopsch@lopsch.com>, netfilter@lists.netfilter.org

Er, yes, SNATted. Silly fingers, won't type what's in my head.

I'll have a look at the link, but on the face of it the Linksys glossies
seem to say it should work just fine absent the iptables middleman - in
other words, the router doing DHCP on the "inside" with a class C =
private
net, and knowing how to route multiple IPSec passthrough connections to
their appropriate internal destinations.

That doesn't seem, at first glance, to square with "it's an IPSec =
problem" -
but maybe the Linksys documentation is... Optimistic.=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Daniel Lopes
Sent: April 5, 2005 10:10 PM
To: netfilter@lists.netfilter.org
Subject: Re: Iptables, nat, and IPSec

dave beach schrieb:
> I have a class C private net behind both a dedicated linux/iptables=20
> box and a Linksys BEFSR41 broadband router. Traffic outbound from the=20
> iptables box to the router is DNATted to that machine's "external"=20
> (but still private) IP by iptables, and NATted again by the router to =
ITS
external (public) IP.
> Everything works fine, except...
>=20
> I need to be able to run two concurrent passthrough IPSec sessions=20
> outbound through that configuration. Singly, they work fine. When run=20
> concurrently, the second one to try and connect to the office VPN (the =

> IPSec requirement) fails.
>=20
> Digging through Linksys documentation reveals that this particular=20
> router will not support more than one passthrough IPSec session.=20
> Before I go and drop money on a replacement router (such as the=20
> BEFSX41), are there inherent limitations with iptables (or, probably=20
> more accurately) with NAT/IPSec generally, that would render such a=20
> purchase a waste of money in that it wouldn't solve my problem?
>=20
> Of course, I COULD bypass the iptables box and plug the second=20
> connecting device right into the (new) router, but I'd rather not do=20
> that if I don't have to.
>=20
>=20
It=B4s an IPSec problem. I don=B4t want to go into detail but you =
probably
should try NAT-Traversal.
For the theory http://www.ipsec-howto.org/x180.html
And the outbound traffic from the linux box to the router probably is =
SNATed
;).


