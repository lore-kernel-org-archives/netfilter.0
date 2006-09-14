From: Vidya Ravipati <ravipati@cs.sunysb.edu>
Subject: Can iptables/ip6tables start and work in parallel (fwd)
Date: Thu, 14 Sep 2006 02:44:33 -0400 (EDT)
Message-ID: <Pine.GSO.4.53.0609140244170.1024@compserv3>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



Vidya Sagar Ravipati
Graduate Student,
Department of Computer Science,
State University of New York,
StonyBrook-11790
Phone:
Home  :631-216-2410
Mobile:631-220-9167

---------- Forwarded message ----------
Date: Wed, 13 Sep 2006 18:09:47 -0400 (EDT)
From: Vidya Ravipati <ravipati@cs.sunysb.edu>
To: netfilter@lists.netfilter.org
Subject: Can iptables/ip6tables start and work in parallel

QuestionsA
1)Can iptables and ip6tables run together on same linux machine.
Case : I want to run ip6tables firewall on the linux machine which is
already running ipv4-firewall-machine (iptables). i want to support
firewall feature for both IPv4 and Ipv6 network at the same time.

2)I found out in redhat linux adminstration guide that Iptables cannot
start along with Ip6tables.
http://www.redhat.com/docs /manuals/linux/RHL-8.0-Manual
/security-guide/ch-fw.html
This is what it is mentioned in this page
The IPChains and IP6Tables services must be turned off to use the IPTables
service with the following commands:
Then how can we build a firewall for a machine which can be used both in
IPv4 and IPv6 networks.


Thanks
Vidya sagar ravipati

