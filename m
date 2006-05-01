From: "David Leangen" <netfilter@leangen.net>
Subject: Tracking down the source of proxy problem
Date: Mon, 1 May 2006 18:13:43 +0900
Message-ID: <NEBBKBPLMLNABNADCIPACEOMBPAB.netfilter@leangen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


Hello!

I have a network with an iptables-based firewall/proxy. Behind the proxy is
a machine running Postgres. Recently, many changes were made to the
installation.

Connecting to the Postgres DB works from within the network, but not from
without. I've run out of ideas for tracking down the error...

Could anybody kindly pass on some wise advice?


firewall iptables (in port number edited):

  *nat
  :PREROUTING ACCEPT [0:0]
  :POSTROUTING ACCEPT [0:0]
  :OUTPUT ACCEPT [0:0]
  -A PREROUTING -p tcp --dport ##INPORT## -j DNAT --to 192.168.2.10:5432
  -A PREROUTING -p udp --dport ##INPORT## -j DNAT --to 192.168.2.10:5432
  -A POSTROUTING -o ppp0 -j MASQUERADE
  COMMIT


db machine iptables:

  *filter
  :INPUT DROP [1:242]
  :FORWARD DROP [0:0]
  :OUTPUT ACCEPT [0:0]
  :LOG_DROP - [0:0]
  :LOG_ACCEPT - [0:0]
  :icmp_packets - [0:0]
  -A INPUT -p tcp -s 192.168.0.0/16 -m tcp --dport 5432 -j ACCEPT
  -A INPUT -j DROP


Thank you!!


