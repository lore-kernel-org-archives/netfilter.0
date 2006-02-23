From: Stephen Jones <hivemynd@hivemynd.net>
Subject: Tuning NAT timeout values
Date: Thu, 23 Feb 2006 14:05:29 -0600
Message-ID: <43FE1589.10205@hivemynd.net>
References: <43EA2AA5.3080401@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43EA2AA5.3080401@arcoscom.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I have run into a wall on this one.  I have need to change the default 
settings on NAT entries through a Linux 2.4.32/iptables 1.2.11 based 
firewall.  Multiple searches have lead me to believe that tuning NAT 
masquerade timeouts through iptables is not possible as it apparently 
was through ipchains/ipfwadm.

This document (and other similar linux NAT/MASQ howtos):

http://howtos.linux.com/guides/nag2/x-087-2-masq.configuration.shtml

State: "The iptables implementation uses much longer default timers and 
does not allow you to set them."  Or something meaning the same thing.

An old discussion about this:

http://www.cs.washington.edu/homes/bdferris/afs_conntrack_nat/index.html

leads me to believe that perhaps if this is possible, it will be through 
tuning the various core conntrack tcp/udp settings for the timeouts 
(e.g. ip_conntrack_udp_timeout_stream
ip_conntrack_tcp_timeout_close_wait
ip_conntrack_udp_timeout
ip_conntrack_tcp_timeout_close
ip_conntrack_tcp_timeout_time_wait
ip_conntrack_tcp_timeout_syn_sent
ip_conntrack_icmp_timeout
ip_conntrack_tcp_timeout_syn_recv
ip_conntrack_generic_timeout
ip_conntrack_tcp_timeout_last_ack
ip_conntrack_tcp_timeout_fin_wait
ip_conntrack_tcp_timeout_established)

Any guidance on this issue would be greatly appreciated!

SJ

