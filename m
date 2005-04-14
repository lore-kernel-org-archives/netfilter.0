From: "Michael Sonntag" <sonntag@fim.uni-linz.ac.at>
Subject: Fedora Core 3 + PPTP - NAT: Problems with multiple clients
Date: Thu, 14 Apr 2005 21:58:47 +0200
Message-ID: <BGEEINKEJMLPMKEOBFHDMEEFDIAA.sonntag@fim.uni-linz.ac.at>
Reply-To: sonntag@fim.uni-linz.ac.at
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


