From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 13:56:23 +0200
Message-ID: <200509301356.23379.marcin.giedz@eulerhermes.pl>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<433D22A9.1060504@toxicnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433D22A9.1060504@toxicnet.de>
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Dnia pi=C4=85tek, 30 wrze=C5=9Bnia 2005 13:34, Sascha Reissner napisa=C5=82:
> sebastian.ionita@focomunicatii.ro wrote:
> > Why doesn't iptables works with vlans interfaces?
> > iptables -t mangle -A FORWARD -i eth0 -o eth1.11 -j MARK --set-mark 4
> > Gives me the error:
> > host/network eth1.11 not found.
> > I'm running kernel version 2.4.27. with iptables 1.2.9
> > The eth1.11 exists works perfectly.
> > Seby,
>
> eth1.11 is the same physical device as eth1. use eth1 in your rule and
> you are fine. netfiler does IMHO not support filtering by logical
> interface.

It does and it works excellent.=20

here is short example:
/usr/local/sbin/iptables -A FORWARD -i eth0.119 -p tcp -j ACCEPT -m state=20
=2D-state NEW -m multiport --destination-port $TCP_FORWARD1
/usr/local/sbin/iptables -A FORWARD -i eth0.119 -p tcp -j ACCEPT -m state=20
=2D-state NEW -m multiport --destination-port $TCP_FORWARD2

=46or me it seems like eth1.11 is not present on your system. What do get w=
ith=20
"ifconfig"?=20

Marcin

