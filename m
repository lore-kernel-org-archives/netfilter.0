From: "Damien Mason" <dmason@bluefire.com.au>
Subject: VLANs and DNAT
Date: Thu, 24 Jul 2003 16:53:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1D52A5A949FF0F41A737A228837E0F5576638D@homer.bfsyd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Everyone,

	I have two interfaces, eth1 and eth2

	I have multiple vlans on a eth1, that is, eth1.1 and eth1.2,
eth1.3

	Eth2 is the external interface to the internet.

	Vlan1 uses the following network address:	192.168.50.0/24
	Vlan2 uses the following network address:	192.168.50.0/24
also

	Vlan3 uses the following network address: 192.168.10.0/24

I have NAT working for the vlans, that is, clients are able to access
the external internet using nat.

	However, there are servers on Vlan2 which I would like to
forward traffic to from the external interface, I would imagine that I
could do something like:

iptables -A PREROUTING -t nat -p tcp -d 203.221.181.27 --dport 80 -j
DNAT --to 192.168.50.10:80

But I cannot specify an interface -i eth1.2 in the prerouting, because
it occurs pre-routing?

	How can I forward traffic to a host on a vlan when the vlans
don't use unique addressing schemes?.. I was thinking I may have to -j
REDIRECT the traffic to another chain, and forward it from there?

	Any Ideas or solutions would be most appreciated :)

Regards,
	Damien Mason






