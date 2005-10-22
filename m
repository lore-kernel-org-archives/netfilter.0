From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: match n packets every m
Date: Sat, 22 Oct 2005 11:37:31 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510221131290.31269@filer.marasystems.com>
References: <4357B648.90700@mbigroup.it>
	<Pine.LNX.4.61.0510201837400.27782@filer.marasystems.com>
	<4358C56E.3050804@mbigroup.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4358C56E.3050804@mbigroup.it>
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
To: Roberto Ferrari <rferrari@mbigroup.it>
Cc: netfilter@lists.netfilter.org

On Fri, 21 Oct 2005, Roberto Ferrari wrote:

> Do you have idea of where I should modify the nth code?
> Do you think it could be safe to modify also the limit of 100  to the
> "--every", making it grow to 1000 or 2000?

This limit is technically only when using --packet.

Regards
Henrik

