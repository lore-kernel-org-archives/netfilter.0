From: "Dimitrios Pezaros" <dp@comp.lancs.ac.uk>
Subject: Changing TCP MSS for IPv6
Date: Mon, 13 Oct 2003 19:58:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E36B692FEB773C4BB3EC8B1828516B87A37030@exchange-be2.lancs.ac.uk>
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

Dear all,

I am experimenting with altering the TCP MSS using iptables/ip6tables
v1.2.5 under Linux 2.4.18

I am able to do that for IPv4 traffic using the options e.g.
iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss
1000
iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu

This is, as expected, applied to IPv4 traffic. I need to do something
equivalent (being able to manually alter MSS) for IPv6, but the TCPMSS
option does not seem to work for ip6tables.

------------------------------------------------------------------------
-----
# ip6tables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss
1400
ip6tables v1.2.5: Unknown arg `--set-mss'
Try `ip6tables -h' or 'ip6tables --help' for more information.
------------------------------------------------------------------------
-----

Am I doing something obviously wrong, or such functionality is not (yet)
implemented for ip6tables?
Or even, is there a specific patch that I need to apply?

Many thanks for any help,
Dimitris.


