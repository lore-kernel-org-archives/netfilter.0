From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging default drop
Date: Wed, 7 Apr 2004 21:34:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404072134.30328.Antony@Soft-Solutions.co.uk>
References: <000501c41cdf$076300b0$0464a8c0@stu>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c41cdf$076300b0$0464a8c0@stu>
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
To: netfilter@lists.netfilter.org

On Wednesday 07 April 2004 9:29 pm, Stuart Lamble wrote:

> Hi All
>
> Can you LOG a default policy of DROP?

Yes.   Add the LOG rule as the last one in the chain.

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


