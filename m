From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: poptop connection problem
Date: Thu, 24 Oct 2002 14:17:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005101c27b89$90256120$8c01a8c0@sundaram>
References: <200210231602.00745.roy@karlsbakk.net> <200210231518.g9NFI4L02942@vulcan.rissington.net> <200210241245.52685.roy@karlsbakk.net> <200210241155.g9OBtEe04312@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter mailinglist <netfilter@lists.netfilter.org>

Hi,

I am trying setup poptop VPN server on my firewall machine.

eth0 - internet IP
eth1 - LAN IP (192.168.1.1)

from inside my LAN I was able to make the connection, from outside I was not
able to make the connection.

tcpdump -i eth0 proto 47 or port 1723
the above command not showing any  information.

my iptables command:
iptables -A INPUT -i eth0 -p tcp --dport 1763 -j ACCEPT
iptables -A INPUT -i eth0 -p 47 -j ACCEPT

Any help
Thanks
SR

lsmod output:

# lsmod
Module                  Size  Used by    Tainted: P
ppp_async               8128   0
ppp_mppe               25120   0
ppp_generic            24076   0  [ppp_async ppp_mppe]
slhc                    6348   0  [ppp_generic]
iptable_filter          2624   1  (autoclean)
ipt_MASQUERADE          2816   1
ipt_state               1408   2
ipt_REJECT              3872   3
ipt_LOG                 4608   9
ip_nat_h323             4352   0  (unused)
ip_conntrack_h323       4352   1  [ip_nat_h323]
ip_nat_ftp              4640   0  (unused)


