From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Firewall Help
Date: Tue, 11 Oct 2005 09:47:52 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5843@pxtbenexd01.pxt.primeexalia.com>
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
To: Russ Kreigh <kreigh@onlyinternet.net>, netfilter@lists.netfilter.org

It's nice that you are letting traffic out but don't you want the
related traffic to some back in?  If so, you need to allow related
and/or established connections to return.


-A $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

> $IPTABLES -A INPUT -s X.X.30.0/24 -j ACCEPT  # Exclude Management
subnet
> from below rules
> $IPTABLES -A INPUT -d X.X.30.0/24 -j ACCEPT

-A $IPTABLES -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPTABLES -A FORWARD -s X.X.30.0/24 -j ACCEPT
> $IPTABLES -A FORWARD -d X.X.30.0/24 -j ACCEPT
>=20
> $IPTABLES -A INPUT -p tcp --syn -m limit --limit 500/s -j REJECT
> $IPTABLES -A FORWARD -p tcp --syn -m limit --limit 500/s -j REJECT
>=20
> $IPTABLES -A INPUT -p tcp -m limit --limit 2500/s -j REJECT
> $IPTABLES -A FORWARD -p tcp -m limit --limit 2500/s -j REJECT
>=20
> $IPTABLES -A INPUT -p icmp -m limit --limit 200/s -j REJECT
> $IPTABLES -A FORWARD -p icmp -m limit --limit 200/s -j REJECT
>=20

> Thanks,
>=20
>=20
> Russ Kreigh
> Network Engineer
> OnlyInternet.Net Broadband & Wireless
> Supernova Technologies
> Office: (800) 363-0989
> Direct: (260) 827-2486
> Fax:    (260) 824-9624
> kreigh@onlyinternet.net
> http://www.oibw.net
>=20


