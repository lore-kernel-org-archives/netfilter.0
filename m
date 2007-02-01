From: "=?KOI8-R?B?8MHXxcwg68/Lz8zFzcnO?=" <pavelkok@gmail.com>
Subject: Re: nfnl_listen: recvmsg overrun: No buffer space available" in
	nfct_event_conntrack() call
Date: Thu, 1 Feb 2007 20:31:58 +0300
Message-ID: <42261c2c0702010931y1db0ac0cr71bd6170c5e43190@mail.gmail.com>
References: <42261c2c0701311431t6211428uffa34273c4dcc112@mail.gmail.com>
	<45C1ABA7.80600@netfilter.org> <45C1F195.50006@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C1F195.50006@netfilter.org>
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

2007/2/1, Pablo Neira Ayuso <pablo@netfilter.org>:
> Pablo Neira Ayuso wrote:
> > Increase netlink buffer size via nfnl_rcvsiz() (libnfnetlink), the
> > default size is available in /proc/sys/net/core/rmem_max. BTW, this
> > message means that you have probably lost some log messages because the
> > rate was so high that the buffer could not back off.
>
> Sorry, I didn't notice that there is no way to access nfnl_handle from
> libnetfilter_conntrack, instead use setsockopt(nfct_fd(h), SOL_SOCKET,
> SO_RCVBUFFORCE, &size, socklen) to set the buffer size. Anyway I'll cook
> a patch for this asap, this issue is important.

Thanks! This is solved problem!
nfnl_rcvbufsiz call doesn't change rmem_max value in my system
(probably, flag SO_RCVBUFFORCE has no effect), but I set this value manual:
echo 8388608 > /proc/sys/net/core/rmem_max


Pavel

