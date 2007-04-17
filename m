From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Where has NAT gone?
Date: Tue, 17 Apr 2007 22:21:08 +0200
Message-ID: <46252C34.40309@plouf.fr.eu.org>
References: <20070417081253.A6BF9DBAB7@mail5.inspire.net.nz>
	<1176839902.3870.9.camel@murdegern.cbxnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1176839902.3870.9.camel@murdegern.cbxnet.de>
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

Torsten Luettgert a =E9crit :
>=20
> What you're probably missing is conntrack, which moved to
>=20
> Networking ->
> Networking options ->
> Network packet filtering framework (Netfilter) ->
> Core Netfilter Configuration
>=20
> There, enable "Netfilter connection tracking support"
> (CONFIG_NF_CONNTRACK_ENABLED) and "Netfilter Xtables support"
> (CONFIG_NETFILTER_XTABLES).
>=20
> Then, one menu up and into "IP: Netfilter Configuration",
> enable
>=20
> IPv4 connection tracking support (CONFIG_NF_CONNTRACK_IPV4)
> IP tables support (CONFIG_IP_NF_IPTABLES)
> Full NAT (CONFIG_NF_NAT)

Note that although it is now the default since 2.6.20, you can still=20
disable the new layer 3-independent connection tracking in the "Core=20
Netfilter Configuration" menu and enable the old IPv4-only connection=20
tracking (CONFIG_IP_NF_CONNTRACK) and NAT (CONFIG_IP_NF_NAT) in the "IP:=20
Netfilter Configuration" menu. But you lose the IPv6 connection tracking.

> I understand those config options were moved because they are
> actually not IPv4 specific ("iptables") but more general,
> IPv4 / IPv6 / ARP ("xtables").

Yes, but AFAIK xtables has little to do (if anything) with the layer=20
3-independant connection tracking.

> The binary for setting the rules is still called "iptables", though.

Because that's the dedicated userspace tool to manage the IPv4 rules.=20
There are similar dedicated tools to manage IPv6 and ARP rules,=20
respectively ip6tables and arptables.

