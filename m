From: "Burak Sahin" <burak.sahin@is.net.tr>
Subject: iptables + access-list
Date: Wed, 28 May 2003 09:38:36 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <043101c324e3$c4832110$6b0262d4@is.net.tr>
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

Hi to all,

I am using squid as transparent proxy. So I use iptables.Command I use is:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

I want to use such an access-list: For instance if you want a page from
network A.B.C.D/a.b.c.d, you do not use squid. It is possible doing with
squid, however I need to do this with iptables. I changed my command such
that:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
A.B.C.D/a.b.c.d -j REDIRECT --to-port 3128
it worked.



MY QUESTION is;

For two networks, A.B.C.D/a.b.c.d and E.F.G.H/e.f.g.h how can I do this?

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
A.B.C.D/a.b.c.d -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d !
E.F.G.H/e.f.g.h -j REDIRECT --to-port 3128

This does not work. Because, when a request comes for an ip in the network
E.F.G.H/e.f.g.h, it is forwarded to squid, because of the iptabes first
rule...

How can I do access-list with iptables?

I need help

Thanks for your attention








