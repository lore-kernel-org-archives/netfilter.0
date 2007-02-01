From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nfnl_listen: recvmsg overrun: No buffer space available"
 in	nfct_event_conntrack() call
Date: Thu, 01 Feb 2007 09:58:15 +0100
Message-ID: <45C1ABA7.80600@netfilter.org>
References: <42261c2c0701311431t6211428uffa34273c4dcc112@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42261c2c0701311431t6211428uffa34273c4dcc112@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?0J/QsNCy0LXQuyDQmtC+0LrQvtC70LXQvNC40L0=?= <pavelkok@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

Павел Коколемин wrote:
> I am using libnetfilter_conntrack for log all connections passing via my 
> router (new & destroy messages).
> 
> When LAN users start network scanners (NetLook, for example),
> sometimes I receive error in console:
> "nfnl_listen: recvmsg overrun: No buffer space available"
> generated in nfct_event_conntrack() (recvmsg() returns ENOBUFS error code).
> This message generated in nfnl_listen().

Increase netlink buffer size via nfnl_rcvsiz() (libnfnetlink), the 
default size is available in /proc/sys/net/core/rmem_max. BTW, this 
message means that you have probably lost some log messages because the 
rate was so high that the buffer could not back off.

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of 
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

