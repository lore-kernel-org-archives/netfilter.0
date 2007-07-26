From: Sebastien Tricaud <sebastien.tricaud@wengo.com>
Subject: Re: nf_queue question
Date: Thu, 26 Jul 2007 13:40:02 +0200
Message-ID: <46A88812.8030503@wengo.com>
References: <46A8420E.3020200@amnafzar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46A8420E.3020200@amnafzar.com>
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
To: Bahamin Takhtaei <takhtaei@amnafzar.com>, netfilter@lists.netfilter.org

Bahamin Takhtaei wrote:
> Hi everyone!
> I install libnfnetlink_0.0.16 and libnetfilter_queue-0.0.12 and
> upgrade my kernel to
> linux-2.6.17.13. Then I run libnetfilter_queue-0.0.12/utils/nfqnl_test
> , but encounter with
> this message:
> nfnl_talk: sendmsg(netlink) Connection refused
> error during nfq_unbind_pf()

To run nfqueue applications, it requires root rights. If you are running
nfqnl_test as root, can you give the exact line output that produces
this error ?


Thanks,
Sebastien.


