From: Leigh Peterson <warpig369@hotmail.com>
Subject: FW: ip_conntrack problem
Date: Mon, 5 Nov 2007 13:09:43 +0000
Message-ID: <BAY119-W366D3D25E7B50B7E7E05CEE9880@phx.gbl>
References: <BAY119-W5D872D93E4C72A3EAD0D2E9880@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY119-W5D872D93E4C72A3EAD0D2E9880@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


I ended up loading the module with:

modprobe ip_conntrack

But I'm wondering why nfnetlink and ip_conntrack were not loaded at boot?

Leigh

> [root@localhost ~]# insmod /lib/modules/2.6.18-8.1.15.el5/kernel/net/ipv4/netfilter/ip_conntrack.ko
> insmod: error inserting '/lib/modules/2.6.18-8.1.15.el5/kernel/net/ipv4/netfilter/ip_conntrack.ko': -1 Unknown symbol in module
> [root@localhost ~]# dmesg | grep ip_conn
> ip_conntrack version 2.4 (8192 buckets, 65536 max) - 304 bytes per conntrack
> ip_conntrack: Unknown symbol __nfa_fill
> ip_conntrack: Unknown symbol nfattr_parse
_________________________________________________________________
Get free emoticon packs and customisation from Windows Live. 
http://www.pimpmylive.co.uk