From: "Arthur Liew" <geniusbb@gmail.com>
Subject: Fwd: Problem for nfq_set_queue_maxlen of libnetfilter_queue
Date: Fri, 19 Jan 2007 18:32:06 +0000
Message-ID: <bb5ff7280701191032j7739f65fgfd884e756fa345f0@mail.gmail.com>
References: <bb5ff7280701180736j5473b100q31709f6ebb9effe@mail.gmail.com>
	<45B10C2E.6080204@netfilter.org>
	<bb5ff7280701191031h67b845dw12fbf9fdb6bf3133@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bb5ff7280701191031h67b845dw12fbf9fdb6bf3133@mail.gmail.com>
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

Hi Pablo,

I am using kernel version 2.6.18 fedora core 6 ( kernel
2.6.18-1.2869.fc6 ). Do I need to patch the kernel ? I suppose it
should already be supported in the recent kernel verion like 2.6.18 ?

Hear from you again. Many thanks.

Regards,
Arthur.

On 1/19/07, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Arthur Liew wrote:
> > I don't seem to be able to set max queue len of libnetfilter. The
> > error I keep getting is
> >
> > NFNETLINK answers: Invalid argument
> >
> > Any idea why ?  The code snippet that cause this is
> >
> >    u_int32_t qlen = 1024;
> >    if (nfq_set_queue_maxlen(qh, qlen) < 0)
> >
> > The version of library I use is
> >
> > libnetfilter_queue-0.0.13
> > libnfnetlink-0.0.25
> >
> > I have use the test code from  libnetfilter_queue-0.0.13/utils with
> > additional nfq_set_queue_maxlen function
>
> Kernel version?
>
> --
> The dawn of the fourth age of Linux firewalling is coming; a time of
> great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris
>

