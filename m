From: "Jorge Agrelo" <jagrelo@novadevices.com>
Subject: How to set netfilter variables on Kernel???
Date: Tue, 28 Dec 2004 17:09:32 -0500
Message-ID: <41D1934C.6694.24923ECC@localhost>
Reply-To: jagrelo@novadevices.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-description: Mail message body
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

Does anybody can help me to set or leave by default the following netfilter 
variables at a Border/Firewall running kernel 2.6.9 and iptables 1.2.11 ???

ip_conntrack_buckets
ip_conntrack_generic_timeout
ip_conntrack_icmp_timeout
ip_conntrack_max
ip_conntrack_tcp_timeout_close
ip_conntrack_tcp_timeout_close_wait
ip_conntrack_tcp_timeout_established
ip_conntrack_tcp_timeout_fin_wait
ip_conntrack_tcp_timeout_last_ack
ip_conntrack_tcp_timeout_syn_recv
ip_conntrack_tcp_timeout_syn_sent
ip_conntrack_tcp_timeout_time_wait
ip_conntrack_udp_timeout
ip_conntrack_udp_timeout_stream

Thanks in advance


