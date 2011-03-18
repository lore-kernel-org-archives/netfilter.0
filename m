From: Kurt Wampler <Kurt.Wampler@brion.com>
Subject: How to achieve reverse NETMAP functionality?
Date: Fri, 18 Mar 2011 16:45:54 -0700
Message-ID: <20110318164554.G20495@masktools.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We have a need to "alias" portions of a customer's internal private IP
network, because they have an address range which overlaps a private IP
address range used internally in one of our systems installed at their
site.  We are trying to avoid having to re-IP either network.

We would like to define a 1:1 NAT similar to what's implemented by the
iptables NETMAP target.  Currently, netmap can rewrite only the destination
address during prerouting, and it can rewrite only the source address
during postrouting.

In order to effectively alias the customer's network from the perspective
of our host, we want to rewrite the source address of packets coming from
the customer's network during prerouting, and rewrite the destination address
of the corresponding return packets during postrouting -- the opposite of
what netmap currently does.

Is there any way to achieve this by exploiting the existing configuration
capabilities in iptables?

Our host is running CentOS 5.3 with iptables 1.3.5.

Thanks in advance,

Kurt Wampler
