From: Vidya Ravipati <ravipati@cs.sunysb.edu>
Subject: Re:Can iptables/ip6tables start and work in parallel
Date: Thu, 14 Sep 2006 19:47:41 -0400 (EDT)
Message-ID: <Pine.GSO.4.53.0609141945140.3688@compserv1>
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

Pascal , thanks for the reply and I have small question regarding the
restrictions due to IPv4 mapped addresses.

Can you mention what are the restrictions on the dual stack machine  with
IPv4 mapped addresses


Vidya Ravipati a crit :
>
> 1)Can iptables and ip6tables run together on same linux machine.

Yes, of course. iptables and ip6tables are mostly independent, as IPv4
and IPv6 are on any dual stack machine (with restrictions due to
IPv4-mapped addresses).

> 2)I found out in redhat linux adminstration guide that Iptables cannot
> start along with Ip6tables.
> http://www.redhat.com/docs /manuals/linux/RHL-8.0-Manual
> /security-guide/ch-fw.html
> This is what it is mentioned in this page
> The IPChains and IP6Tables services must be turned off to use the
IPTables
> service with the following commands:
> Then how can we build a firewall for a machine which can be used both in
> IPv4 and IPv6 networks.

That may be a specific RedHat restriction. I don't know RedHat at all
and use my own scripts to create iptables and ip6tables rulesets.

Vidya Sagar Ravipati
Graduate Student,
Department of Computer Science,
State University of New York,
StonyBrook-11790
Phone:
Home  :631-216-2410
Mobile:631-220-9167

