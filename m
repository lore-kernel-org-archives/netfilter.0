From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: SNAT and IPSEC
Date: Tue, 12 Apr 2005 21:11:27 +0200
Message-ID: <425C1D5F.7000302@lopsch.com>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
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

Eduardo Spremolla schrieb:
> I have 2 local networks 10.2.2.0/24 and 10.37.130.0/24 interconnected b=
y
> a ipsec tunnel running on kernel 2.6 native ipsec. So far so good.
>=20
> Now the admin of 10.37.130.0 wants me to NAT my network to 10.3.3.0
> because he had a ip conflict. I cant SNAT because when the packet goes
> to nat post it has been encapsulated in ESP and had the firewalls
> address, as you can see in the bottom log snipe.I try to use NETMAP in
> mangle PREROUTING, but it changes the dest ip , not the source.
>=20
> Is this possible?
>=20
> Thanks in advance for any clue.
>=20
> LALO
>=20
According to http://www.shorewall.net/netmap.html, besides I don=B4t=20
really know how and when NETMAP interacts, it should work if you use an=20
Interface for IPSec like the alternative IPSec stack implemented by=20
FreeS/WAN. For the native stack I don=B4t know if it will work you will=20
need to know when it exactly interacts. It will probably only work when=20
implemented directly into the IPSec stack.

