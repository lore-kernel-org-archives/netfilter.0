From: "Guillermo" <diseno1@puntozeropublicidad.cl>
Subject: redirect squid to other proxy(windows) hearing in port 80
Date: Fri, 21 Nov 2003 13:19:29 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b901c3b04b$3d88ff10$6500a8c0@ProxY>
References: <20031121132405.56143.qmail@web40812.mail.yahoo.com> <3FBE183F.6030109@Loudoun-Fairfax.com> <200311211411.hALEBN725115@onyx.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

hello!!
i need help with iptables and proxy squid...
i have a linux-proxy for tests and it is connected in the internal net
(LAN), but i need that this squid pass through a win2000 proxy that is
hearing in port 80 for all request....(view the picture)

computers ----->squid-linux(hear port 3128)---->win2000-proxy(hear port
80)----->internet (https-DNS)

mi problem is that apparently the DNS petitions (port 53) not arrives at the
DNS server.
how i must setup IPTABLES for redirect this packets DNS (TCP and UDP) at the
win2000 proxy???
or i must setup SQUID for this???
or i must instal a BIND DNS in my Linux box??
any help will be welcome...
thanks

PD: sorry for my english.... i dont speak english very well..


