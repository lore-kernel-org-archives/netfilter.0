From: "Christian Ericsson" <debian@home.se>
Subject: Bug in FORWARD chain in iptables-1.2.7a with Linux kernel 2.4.20?
Date: Mon, 23 Jun 2003 15:46:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3398d$dcf68020$64a5a8c0@europe.cellnetwork.com>
Reply-To: <debian@home.se>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,

I have the following configuration:

INTERNET
|
Firewall (Linux box with IPTables)
|
Router (Linux box with IPTables)


The default policy in the FORWARD chain in the Firewall is set to DROP
packets. So, I have to insert a rule for every traffic I want to accept.

The Router logs all traffic:

iptables --append INPUT   -j LOG --log-level debug --log-prefix "IPTABLES
LOG INPUT "
iptables --append FORWARD -j LOG --log-level debug --log-prefix "IPTABLES
LOG FORWARD "
iptables --append OUTPUT  -j LOG --log-level debug --log-prefix "IPTABLES
LOG OUTPUT "


I don't have any rule in the Firewall which ACCEPT traffic to the Router.
But, when I try to access the Router from INTERNET, the Router will log that
packet which the Firewall should DROP!!!

If I try to ping the router from INTERNET, the Router will log:

Jun 23 15:01:23 Router kernel: IPTABLES FILTER DROP INPUT IN=eth0 OUT=
MAC=XX SRC=A-HOST DST=Router PROTO=ICMP
8
Jun 23 15:01:23 Router kernel: IPTABLES FILTER DROP OUTPUT IN= OUT=eth0
SRC=Router DST=A-HOST PROTO=ICMP


It gets even more strange if I also log the traffic which the Firewall
should DROP, i.e. last rule in the FORWARD chain on the Firewall is:

iptables --append -j LOG --log-level debug --log-prefix "IPTABLES DROP
FORWARD "

The Firewall will log:

Jun 23 15:07:59 Firewall kernel: IPTABLES DROP FORWARD IN=eth3 OUT=eth0
SRC=Router DST=A-HOST PROTO=ICMP

eth0 is connected to INTERNET and eth3 is connected to the Router. Shouldn't
it be the other way around? The Firewall should of course DROP this packet
(the default policy is to DROP packets).


What could be wrong? Do I have to upgrade to the latest version of iptables
and the Linux kernel?


Yours sincerely,

Christian Ericsson


