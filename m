From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Sometimes SNAT is not working
Date: Mon, 27 Aug 2007 16:41:14 +0200
Message-ID: <46D2E28A.1090503@plouf.fr.eu.org>
References: <A192455967CC5A498A520879D99A5775E30B08@ex2-del1.synapse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A192455967CC5A498A520879D99A5775E30B08@ex2-del1.synapse.com>
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

Hello,

Manish Jain a =E9crit :
>=20
> I am using some internal IPs (169.254.x.x) on my box and then performin=
g
> SNAT and DNAT from/to this IP to/from actual public IP.

Note : you should consider using an address range other that=20
169.254.0.0/16 which is reserved for non routable link local=20
communications (see RFC 3330). You could use a private address range in=20
10.0.0.0/8, 172.16.0.0/12 or 192.168.0.0/16 (see RFC 1918) instead.

> It has been observed that sometimes SNAT does not work and internal IP
> exposed to outside world.
>=20
> Please share your experiences. Whether it has to do with connection
> tracking in some way or other?

Probably. NAT does not work on packets in the INVALID or NOTRACK state.

