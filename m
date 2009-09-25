From: Dave Sparks <Dave.Sparks@Sophos.com>
Subject: Multiple --to-source not supported
Date: Fri, 25 Sep 2009 23:57:10 +0100
Message-ID: <B7A55E8C969B974FBC89274E565B8B2D019DFBCA0A@US-COL-EXCHMBX1.green.sophos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am trying to setup SNAT for a large network to roundrobin over two different /28s which are on the same interface.  The obvious way to do this with iptables doesn't like the dis-contiguous cidrs and complains:

/sbin/iptables -t nat -A eth1_masq -s 10.0.0.0/24 -d 0.0.0.0/0 -j SNAT --to-source 1.2.3.210-1.2.3.222 --to-source 4.5.6.50-4.5.6.62

iptables v1.4.3.2: Multiple --to-source not supported


This used to work in earlier 2.6 kernels, why doesn't it work anymore?

Any tips for workarounds?

Thanks!


