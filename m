From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: how to use sk_buff in netfilter
Date: Mon, 31 Oct 2005 08:00:35 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0510310759260.11251@filer.marasystems.com>
References: <00d501c5dac7$22306070$060ae29f@javaboy>
	<200510271055.10152@nienna>
	<00f601c5dddc$bffe60f0$060ae29f@javaboy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00f601c5dddc$bffe60f0$060ae29f@javaboy>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: jywang <jywang@cnic.cn>
Cc: netfilter@lists.netfilter.org, KOVACS Krisztian <hidden@balabit.hu>

On Mon, 31 Oct 2005, jywang wrote:

> this so good a tutorial of sk_buff.
>
> and, what is about the struct sock and other core structures?

most are not allowed to be used from netfilter hooks...

but many are documented in the kernel docbook documentation received with 
the kernel sources ("make doc" in the kernel tree to build them..)

Regards
Henrik

