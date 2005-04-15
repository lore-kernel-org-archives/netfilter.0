From: Sander Eikelenboom <S.Eikelenboom@stud.tue.nl>
Subject: Fedora Core 3 + PPTP - NAT: Problems with multiple clients
Date: Fri, 15 Apr 2005 14:53:57 +0200
Message-ID: <1056891510.20050415145357@stud.tue.nl>
Reply-To: Sander Eikelenboom <S.Eikelenboom@stud.tue.nl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi Michael,

If packets would get mixed up, in my view the "call id's" should be mixed
up too, and this should be noticeable in the logs. Perhaps you could enable
the debugging and post the results of kern.log together with 2 tcpdumps of
both external and internal interfaces:

tcpdump -i eth0 -vvv -xx -s 0 ip host ip_addr_pptp_server > tcpdump-2.6.10+pptp+testcase-eth0.txt
tcpdump -i eth1 -vvv -xx -s 0 ip host ip_addr_pptp_server > tcpdump-2.6.10+pptp+testcase-eth1.txt

Where you should change "ip_addr_pptp_server" with the IP address to which
both clients try to connect to.
Please use the netfilter to bugzilla to file the bug (you can upload the
logs as attachments there).

This should give a complete overview of what is happening.

Don't know if it is possible for you, but you could try a patched vanilla
2.6.10 kernel too, to rule out the fedora kernel has some incompatible
patches for the pptp patch.


Regards,

Sander Eikelenboom













I have a firewall which does NAT of outgoing connections. Several clients
behind this box must connect to the same external PPTP server. This did work
fine on a 2.4.27 kernel.

However, with the newest version of the PPTP conntrack/nat helper (from SVN,
Revision 3839) and Fedora Core 3 (2.6.10), this does no longer work (both
clients and server are unchanged, only the firewall is replaced). It applies
cleanly and I can connect to an external PPTP server from a single client:
everything works fine. But as soon as a second client behind the firewall
tries to connect to this server, problems occur. Either the connection does
not get established (most cases), or the first connection is broken
(rarely); completely working: never. It seems, that some packets get mixed
up between those two connections.

Is there any workaround for this or how to help the developers in resolving
the problem? I have enabled all the debugging (printk), but the resulting
log doesn't help (at least me).

Thanks,
        Michael



