From: =?iso-8859-2?Q?Leszek_=AFur?= <lzur@record.com.pl>
Subject: iptables -t nat -A OUTPUT - j DNAT
Date: Fri, 23 May 2003 16:41:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MCBBLLHIIODBDKIGDHGAMEJHCCAA.lzur@record.com.pl>
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

Hello all.

Slackware 9.0
kernel 2.4.20
iptables 1.2.7a

iptables -t nat -A OUTPUT -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
iptables: Invalid argument

From iptables manual:
   DNAT
       This  target  is  only valid in the nat table, in the PREROUTING and
OUTPUT chains,
       and user-defined chains which are only called from those chains.  It
specifies that
       the destination address of the packet should be modified (and all
future packets in
       this connection will also be mangled), and rules should cease being
examined.   It
       takes one type of option:

       --to-destination ipaddr[-ipaddr][:port-port]
              which can specify a single new destination IP address, an
inclusive range of
              IP addresses, and optionally, a port range (which is only
valid if the  rule
              also  specifies  -p tcp or -p udp).  If no port range is
specified, then the
              destination port will never be modified.



anybody can help me ??


