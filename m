From: "Herbert G. Fischer" <manager@trama.com>
Subject: External Resolved IPs
Date: Mon, 16 Jun 2003 18:00:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003001c3344a$5d220240$093010ac@power>
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
To: NetFilter Users <netfilter@lists.netfilter.org>

Hi,

I have a problem here, that maybe I can solve using DNS, but this can be
very bad and ugly
for me to maintain.

I have a internal network that uses a external DNS to solve addresses. I
also have some
servers in this internal network that can be accessed from outside via
aliases on NAT/FW
redirecting some ports to internal servers.

My problem is that, when I try to connect to a internal server, using the
external and real
IP, I cannot because my FW/NAT appears to be confused or misconfigured.

For example:

Internal Network: 172.16.48.0/24

My IP: 172.16.48.10
Server Internal IP: 172.16.48.20
* Both are on the same network

Server External IP: 200.180.180.20 (IP alias on FW/NAT machine, that
redirects to 172.16.48.20)
DNS name of Server: server.domain.com, points to 200.180.180.20

When I try to connect into server.domain.com from internal machines, DNS
resolves the external
IP and the connection to the real IP does not complete, since the packet
goes "out" of my network
and must "enter" again.

Here is a sample on how my iptables script is configured:

====================================================================

# server
iptables -t nat -A POSTROUTING -s 172.16.48.20 -j SNAT --to-source
200.180.180.20
iptables -t nat -A PREROUTING -s 0/0 -d 200.180.180.20 -j
DNAT --to-destination 172.16.48.20

# NAT for the rest of the world
iptables -t nat -A POSTROUTING -o eth1 -s 172.16.48.0/24 -j SNAT --to-source
200.180.180.22

=====================================================================

I don't know how to better explain my problem... I hope someone understood
that...

Any idea on this ?

Thanks...

Herbert


