From: Christian Riechmann <riechmann@fgan.de>
Subject: IP6TABLES and Muulticast Listener ICMPV6 PDUs
Date: Mon, 10 Nov 2003 12:50:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031110115012.GB2850@ruf098.fkie.fgan.de>
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

Hello,

I am working on a project dealing with IPv6 and Multicast. 
I am trying to filter those IPv6 PDUs being sent by my host and
containing ICMPv6 Multicast Listener Discovery Protocol (MLDP) PDUs.
(In other words I want to see those Multicast Reports which
inform a router that my host wants to see those PDUs which are
sent to a specific multicast address.)These PDUs shall be queued
for some processing within a user space program. 

I tried a lot of IP6TABLES rules, but just these types of 
ICMPV6 PDUs are not queued. 

I tried different rules, but none worked:
	ip6tables -A OUTPUT -p icmp6 -j QUEUE
	ip6tables -A OUTPUT -p icmpv6 -j QUEUE
	ip6tables -A OUTPUT -p ipv6-icmp -j QUEUE

I should mention that ICMPv6 HELLO PDUs are well queued.
And:
	ip6tables -A OUTPUT -p ipv6 -j QUEUE

The last rule queues all IPv6 PDUs except those I really
want to see: MLDP-PDUs.

All tests running on Kernels 2.4.18, 2.4.22 and 2.6.0test8
show the same results.

Hoping that somebody can help me.

Christian Riechmann
(riechmann@fgan.de)


