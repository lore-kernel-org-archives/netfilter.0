From: Pieter van Leuven <p.vanleuven@aramiska.net>
Subject: pptp-natting problems with kernel 2.4.2[56] and patch-o-matic.
Date: Mon, 7 Jun 2004 17:19:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040607151926.GA3260@vanleuven.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi,

Currently busy with building a kernel + modules for customers. 
These customers want to connect from multiple clients to multiple
pptp-servers. Without the pptp patch-o-matic this works of course
for one client to one server. 

After patching the kernel and activating the debug option I got the 
following output: 

ip_nat_pptp.c:init: ip_nat_pptp.c: registering NAT helper
ip_nat_pptp version 1.5 loaded
ip_conntrack_pptp.c:conntrack_pptp_help: ctinfo = 2, skipping
ip_nat_pptp.c:tcp_help: entering
ip_nat_pptp.c:tcp_help: Not touching dir ORIG at hook PREROUTING
ip_nat_pptp.c:tcp_help: entering
ip_nat_pptp.c:tcp_help: pptp packet too short
ip_conntrack_pptp.c:conntrack_pptp_help: RST/FIN received, timeouting GRE
ip_conntrack_pptp.c:conntrack_pptp_help: no full PPTP header, can't track
ip_nat_pptp.c:tcp_help: entering
ip_nat_pptp.c:tcp_help: pptp packet too short
ip_nat_pptp.c:tcp_help: entering
ip_nat_pptp.c:tcp_help: Not touching dir REPLY at hook POSTROUTING

The pptp tunnel couldn't be setup. (Ended in an error code 789)

Can someone indicate what went wrong with setting up with this 
pptp-session? And how this can be solved?

The relevant used iptables filter rules are:

iptables -A FORWARD -i eth0 -i -m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth1 -i -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source <PUBLIC-ADDRESS>

(eth0 is interface on the LAN-side, eth1 is the interface on internet side)

Used software:
   linux-2.4.25 and linux 2.4.26
   patch-o-matic-ng-20040602 and 20040603
   iptables-1.2.10-20040602

pptp-client: W2K-professional server
pptp-server: cisco PIX 501

Regards,
   Pieter
-- 
Pieter van Leuven - Aramiska, Broadband Reality - Network Service Engineer
http://www.aramiska.com/, t: +31 (0)499 365 478; m: +31 (0)6 5249 7305
De Waal 40, P.O. Box 989, 5600 AZ Eindhoven, The Netherlands



