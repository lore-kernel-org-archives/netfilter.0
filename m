From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Iptables, nat, and IPSec
Date: Wed, 06 Apr 2005 04:10:11 +0200
Message-ID: <42534503.2070801@lopsch.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4w8KAAAAQAAAA4U2BieFWiUege5oTSkUNnQEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4w8KAAAAQAAAA4U2BieFWiUege5oTSkUNnQEAAAAA@rogers.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

dave beach schrieb:
> I have a class C private net behind both a dedicated linux/iptables box=
 and
> a Linksys BEFSR41 broadband router. Traffic outbound from the iptables =
box
> to the router is DNATted to that machine's "external" (but still privat=
e) IP
> by iptables, and NATted again by the router to ITS external (public) IP=
.
> Everything works fine, except...
>=20
> I need to be able to run two concurrent passthrough IPSec sessions outb=
ound
> through that configuration. Singly, they work fine. When run concurrent=
ly,
> the second one to try and connect to the office VPN (the IPSec requirem=
ent)
> fails.
>=20
> Digging through Linksys documentation reveals that this particular rout=
er
> will not support more than one passthrough IPSec session. Before I go a=
nd
> drop money on a replacement router (such as the BEFSX41), are there inh=
erent
> limitations with iptables (or, probably more accurately) with NAT/IPSec
> generally, that would render such a purchase a waste of money in that i=
t
> wouldn't solve my problem?
>=20
> Of course, I COULD bypass the iptables box and plug the second connecti=
ng
> device right into the (new) router, but I'd rather not do that if I don=
't
> have to.
>=20
>=20
It=B4s an IPSec problem. I don=B4t want to go into detail but you probabl=
y=20
should try NAT-Traversal.
For the theory http://www.ipsec-howto.org/x180.html
And the outbound traffic from the linux box to the router probably is=20
SNATed ;).

