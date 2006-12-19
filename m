From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Tue, 19 Dec 2006 12:46:54 +0100
Message-ID: <4587D12E.9070500@plouf.fr.eu.org>
References: <45860240.2040102@riverviewtech.net>	<1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>	<4587B400.6080206@rtij.nl>
	<Pine.LNX.4.64.0612191128180.11364@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0612191128180.11364@blackhole.kfki.hu>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Jozsef Kadlecsik a =E9crit :
>=20
> The article must be corrected at one place: the claim: "After an=20
> outgoing SYN packet the firewall / NAT router will forward incoming=20
> packets with suitable IP addresses and ports to the LAN even if they fa=
il=20
> to confirm, or confirm the wrong sequence number (ACK). Linux firewalls=
 at=20
> least, clearly fail to evaluate this information consistently." is=20
> outdated and not true for 2.6 kernels.

For *recent* 2.6 kernels, with "recent" meaning 2.6.9 and above.

