From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Need to replace a SonicWall firewall with an iptables firewall.
Date: Mon, 30 Aug 2004 15:23:58 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56794C2@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: ste@smxy.org, Jason Opperisano <Jopperisano@alphanumeric.com>
Cc: netfilter@lists.netfilter.org


> Not knowing what split-dns was, I googled it. If I understand it
> correctly it seems that this is only needed when you use a single,
> common domain for both internal and external systems. All our external
> systems (both between the firewall and the router, and in the DMZ) are
> in "domain.com" and all our internal systems are in "sub.domain.com",
> so=20
> we don't need split-dns, right?

Split DNS is good in that it allows:

Internet -> (1.1.1.1)Firewall(10.0.0.1) -> DMZ (10.0.0.0/24)
                    (10.0.1.1)
                         |
             Internal_Net (10.0.1.0/24)



Internet (Customers / etc..)
dig www.abc.com > 1.1.1.1

Internally (From your management network)
dig www.abc.com > 10.0.0.111

You have two zones of resolution. One for people inside the NAT, and one
for those outside the NAT. Anyone inside the NAT network will pick up
the real internal address name of the servers. People in the outside
world will see the fake routable DNAT IP address of the servers. Nobody
outside should be able to tell the difference (at least with http) that
the internal server doesn't really have an internet routable IP.


