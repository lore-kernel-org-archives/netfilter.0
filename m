From: "Rimas" <rmocius@auste.elnet.lt>
Subject: routing with the iptables
Date: Fri, 22 Nov 2002 16:54:28 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002c01c29247$d30c57d0$6e69690a@rimas>
References: <200211152128.58239.sysadmin@hnoe1.sth.ac.at> <047701c28f97$895afb30$ac01a8c0@monday> <1037960290.8909.1.camel@elendil.intranet.cartel-securite.net> <1037980891.14335.5.camel@ben.mis.tnsi.com>
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


Hi guys,

I have a Linux box (Redhat 7.3) with two network cards.
eth0 is connection to my wireless ISP and eth1 is to my Firewalls (I have
them two one is main Fw and the second one backup, just in case if a first
one gets faulty ).
I want to route eth0<-->eht1. Both NICs have real Internet IPs and FWs as
well.
FWS NICs and router eth1 are on the same subnet and router is default
gateway for my FWs.
I need no NAT (no needs to hide my real IP, because it have to be seen from
Internet and will be accessible with all ports).


What iptables commands I have to use of it.

Thank you

Remus


