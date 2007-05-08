From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT and local hosts
Date: Tue, 08 May 2007 11:03:34 +0200
Message-ID: <46403CE6.5010700@plouf.fr.eu.org>
References: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>
	<46403616.60103@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46403616.60103@plouf.fr.eu.org>
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

Pascal Hambourg a =E9crit :
>=20
> 3) NAT or MASQUERADE the source address of the redirected connections,=20
> so the replies from C1 are routed back to the firewall and can be=20
> properly un-DNATed before they reach C2 :
>=20
> iptables -t nat POSTROUTING -o eth0 -d 192.168.0.10 \
>   -p tcp --dport 1234 -j SNAT --to-source <eth0_address>

Oops, I forgot "-s 192.168.0.0/24" in order to avoid hiding=20
unnecessarily the source address of external connections to C2.

> or :
>=20
> iptables -t nat POSTROUTING -o eth0 -d 192.168.0.10 \
>   -p tcp --dport 1234 -j MASQUERADE

Same here.

