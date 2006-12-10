From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how do I set the MAC address in POSTROUTING?
Date: Sun, 10 Dec 2006 20:52:48 +0100
Message-ID: <457C6590.7070103@plouf.fr.eu.org>
References: <eknslc$rpq$1@sea.gmane.org>	<200612010153.55904.Daniel@musketa.de>	<ekph22$1va$1@sea.gmane.org>	<45704F1C.7070703@plouf.fr.eu.org>
	<457C395F.1000702@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457C395F.1000702@gmail.com>
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

sean a =E9crit :
>=20
> The internet routers just look at the ip address, so I wouldn't think=20
> they'd strip out the MAC address, do they?

Routers *do* strip the source and destination MAC addresses (and any=20
other layer 2 specific information) when forwarding an IP packet. If=20
applicable, the source MAC address is replaced by the MAC address of the=20
router output interface and the destination MAC address is replaced by=20
the next hop interface MAC address. That's what I meant when saying that=20
layer 2 information is not routed.


