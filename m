From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAPT with loab balance does not work with iptables 1.2.11, RHEL
 3
Date: Thu, 16 Nov 2006 17:33:20 +0100
Message-ID: <455C92D0.1080004@plouf.fr.eu.org>
References: <729782.32953.qm@web55015.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <729782.32953.qm@web55015.mail.re4.yahoo.com>
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

Mahmoud Aghapour a =E9crit :
>=20
> I want to use iptables to translate incoming destination port 500 to
> 10000-10009 with (round robin or any other method) load balancing.
> I used the following command in RHEL 3 with iptables 2.11:
> =20
> Iptables -A PREROUTING -p tcp --dport 500 -j DNAT --to :10000-10009
>=20
> But always port 10000 are used for translation and other ports never us=
ed.

DNAT (and SNAT, I guess) does "load balancing" only with IP addresses,=20
not with ports. It will use always the first port in the interval unless=20
the resulting connection collides with an existing connection. Only in=20
this case it will try the next port in the interval, and so on...

Since your port interval is rather short, you may try to do load=20
balancing with the 'nth', 'random', or 'statistic' match and one rule=20
per destination port.

