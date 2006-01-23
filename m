From: =?UTF-8?B?UGF3ZcWCIFN0YXN6ZXdza2k=?= <pstaszewski@artcom.pl>
Subject: Problem with kernel 2.6.16-rc1-git4 and iptables
Date: Mon, 23 Jan 2006 10:57:05 +0100
Message-ID: <43D4A871.3090404@artcom.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

GNU gdb 6.4
Copyright 2005 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain 
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "i686-pc-linux-gnu"...Using host libthread_db 
library "/lib/tls/libthread_db.so.1".

(gdb) run
Starting program: /usr/src/iptables-1.3.4-20060122/iptables
iptables v1.3.4-20060122: no command specified
Try `iptables -h' or 'iptables --help' for more information.

Program exited with code 02.
(gdb) run -L
Starting program: /usr/src/iptables-1.3.4-20060122/iptables -L
ERROR: 0 not a valid target)

Program received signal SIGABRT, Aborted.
0xffffe410 in __kernel_vsyscall ()
(gdb)                                            



dmesg output:
ip_tables: (C) 2000-2006 Netfilter Core Team
iptables: loop hook 0 pos 0 00000021.
iptables: loop hook 0 pos 0 00000021.



