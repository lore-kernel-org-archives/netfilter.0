From: Kiran Kumar <immidi_kiran@yahoo.com>
Subject: Re: hook in kernel module question
Date: Tue, 10 Feb 2004 19:40:43 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040211034043.77603.qmail@web14001.mail.yahoo.com>
References: <Pine.GSO.4.58.0402101109580.11016@gradlab.ucsd.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0402101109580.11016@gradlab.ucsd.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vineet Kumar <vikumar@cs.ucsd.edu>, netfilter@lists.netfilter.org

--- Vineet Kumar <vikumar@cs.ucsd.edu> wrote:
> I have a kernel module which has an inbound
> netfilter hook, inhook().
> I have it set to PRE_ROUTING. From my hook, I want
> to be able to pass each
> received packet to function foo(),
> which is then to pass it on to IP/TCP after a
> variable delay. my hook,
> inhook() then returns NF_STOLEN.

  Returning NF_QUEUE allows you to get the packet into
userspace and you can later reinject it, which then
goes ahead normally.

> 
> Is there an easy way to do this?
> Returning an NF_ACCEPT is not good enough because
> foo() queues packets and
> decides when to send them on to IP/TCP.
> I cannot call ip_rcv_finish() from foo() because its
> not exported.


=====
Regards,
Kiran Kumar Immidi

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

