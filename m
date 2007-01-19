From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Problem for nfq_set_queue_maxlen of libnetfilter_queue
Date: Fri, 19 Jan 2007 19:21:34 +0100
Message-ID: <45B10C2E.6080204@netfilter.org>
References: <bb5ff7280701180736j5473b100q31709f6ebb9effe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bb5ff7280701180736j5473b100q31709f6ebb9effe@mail.gmail.com>
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
To: Arthur Liew <geniusbb@gmail.com>
Cc: netfilter@lists.netfilter.org

Arthur Liew wrote:
> I don't seem to be able to set max queue len of libnetfilter. The
> error I keep getting is
> 
> NFNETLINK answers: Invalid argument
> 
> Any idea why ?  The code snippet that cause this is
> 
>    u_int32_t qlen = 1024;
>    if (nfq_set_queue_maxlen(qh, qlen) < 0)
> 
> The version of library I use is
> 
> libnetfilter_queue-0.0.13
> libnfnetlink-0.0.25
> 
> I have use the test code from  libnetfilter_queue-0.0.13/utils with
> additional nfq_set_queue_maxlen function

Kernel version?

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

