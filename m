From: David Miller <davem@davemloft.net>
Subject: warnings in current tree
Date: Tue, 21 Apr 2009 01:43:57 -0700 (PDT)
Message-ID: <20090421.014357.219275555.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Can someone fix these up?  Thanks!

net/netfilter/nf_conntrack_netlink.c:1234: warning: 'helpname' may be used uninitialized in this function
net/netfilter/nf_conntrack_netlink.c:991: warning: 'helpname' may be used uninitialized in this function
