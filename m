From: "=?KOI8-R?B?8MHXxcwg68/Lz8zFzcnO?=" <pavelkok@gmail.com>
Subject: nfnl_listen: recvmsg overrun: No buffer space available" in
	nfct_event_conntrack() call
Date: Thu, 1 Feb 2007 01:31:35 +0300
Message-ID: <42261c2c0701311431t6211428uffa34273c4dcc112@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello!

I am using libnetfilter_conntrack for log all connections passing via my router
(new & destroy messages).

When LAN users start network scanners (NetLook, for example),
sometimes I receive error in console:
"nfnl_listen: recvmsg overrun: No buffer space available"
generated in nfct_event_conntrack() (recvmsg() returns ENOBUFS error code).
This message generated in nfnl_listen().

When this happens, information about new/destroyed connections is lost?
How I can fix this? If this error in kernel settings?

I am using Gentoo, kernel 2.6.19-r3, try libnfnetlink-0.0.25 and
libnetfilter_conntrack-0.0.50

Pavel

PS. Sorry for my english

