From: =?iso-8859-1?Q?Markus_G=FCrtler?= <guertler@ecircle-ag.com>
Subject: H/A Linux Firewall Cluster
Date: Tue, 25 Mar 2003 14:07:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <28EFFBE34FE29A49821CE3BD0D4382FC0374DD@goldmine>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hello,

we plan to use Netfilter/IPTables to build a firewall for our heavy loaded
eCommerce-Plattform. Basically this should be two Linux-Firewalls, running
in a High-Availability mode. Each firewall will have four Gigabit network
interfaces (Internet, DMZ, Trusted Network, H/A-Link). In total, the
firewalls have to handle about 400 Mbps of IP traffic and around 60.000 -
70.000 simultaneously connections. Our ruleset will have around 40 - 80
rules, and the Connection-Tracking (stateful inspection) should be enabled.

Does anybody have experiences with iptables firewalls of this size? Is the
Netfilter code able to handle this amount of traffic on current
i386-plattform machines? Which hardware and how much RAM do I need?

It would be nice, if somebody could give me some hints.

Thanks,

Markus

