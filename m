From: Leigh Peterson <warpig369@hotmail.com>
Subject: ip_conntrack problem
Date: Mon, 5 Nov 2007 12:37:03 +0000
Message-ID: <BAY119-W5D872D93E4C72A3EAD0D2E9880@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi All,

I have just installed CentOS 5, 64-bit (with the latest updates) onto a server at work and I was configuring iptables when I realised the ip_conntrack kernel module wasn't loaded.  I tried loading it manually, but it failed.  Here is some information from the error:

[root@localhost ~]# uname -a
Linux localhost.localdomain 2.6.18-8.1.15.el5 #1 SMP Mon Oct 22 08:32:28 EDT 2007 x86_64 x86_64 x86_64 GNU/Linux
[root@localhost ~]# insmod /lib/modules/2.6.18-8.1.15.el5/kernel/net/ipv4/netfilter/ip_conntrack.ko
insmod: error inserting '/lib/modules/2.6.18-8.1.15.el5/kernel/net/ipv4/netfilter/ip_conntrack.ko': -1 Unknown symbol in module
[root@localhost ~]# dmesg | grep ip_conn
ip_conntrack version 2.4 (8192 buckets, 65536 max) - 304 bytes per conntrack
ip_conntrack: Unknown symbol __nfa_fill
ip_conntrack: Unknown symbol nfattr_parse

The only thing I've done on the system was disable IPv6 and enable IP forwarding.  Any suggestions as to what might be wrong?

Regards,
Leigh
_________________________________________________________________
Get free emoticon packs and customisation from Windows Live. 
http://www.pimpmylive.co.uk