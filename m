From: Matthew Strait <quadong@users.sourceforge.net>
Subject: Re: where is ipt_layer.h
Date: Mon, 2 Feb 2004 08:47:23 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.60.0402020844140.3769@dsl093-017-216.msp1.dsl.speakeasy.net>
References: <012101c3e992$0a5d75a0$c2bf09ca@huecal>
 <Pine.LNX.4.60.0402020809060.3769@dsl093-017-216.msp1.dsl.speakeasy.net>
 <014d01c3e998$49b056e0$c2bf09ca@huecal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <014d01c3e998$49b056e0$c2bf09ca@huecal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hare ram <hareram@sol.net.in>
Cc: lartc@mailman.ds9a.nl, netfilter@lists.samba.org, l7-filter-developers@lists.sf.net

> i am using the following things
>
> iptables-1.2.9-layer7-0.4.1.patch
> layer7-kernel2.4patch-qos-0.4.1b

You are using the QoS version of the kernel patch and the Netfilter
(iptables) version of the userspace patch.  You need to either use QoS
with iproute2 or Netfilter with iptables.

-matthew

