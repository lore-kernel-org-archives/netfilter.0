From: Andrew Walrond <andrew@walrond.org>
Subject: Iptables-1.2.9/10 compile failure with linux 2.6.7 headers
Date: Fri, 18 Jun 2004 16:11:37 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200406181611.37890.andrew@walrond.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org-S265266AbUFRPZK@vger.kernel.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: linux-kernel@vger.kernel.org

The addition of a
	__user
attribute to a line in
	linux-2.6.7/include/linux/netfilter_ipv4/ip_tables.h
causes iptables build to fail unless I export
	CC="gcc -D__user= "

Presumably ip_tables.h should include a header defining __user, or iptables 
should include the relevant header before ip_tables.h ?

Sorry if this has already been reported; Archive search found nothing on 
either ML.

Andrew Walrond
