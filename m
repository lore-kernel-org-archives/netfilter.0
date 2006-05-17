From: Ramen Sen <ramen@intnetsystems.com>
Subject: Duplicating packets and NATting dup'd packet
Date: Wed, 17 May 2006 15:14:29 +0100
Message-ID: <446B2FC5.2020706@intnetsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello,

I've been struggling with this for a couple of days and am not sure how
best to proceed.

I need to do the usual duplicating and logging packets thing - with a
twist in that I need to NAT the duplicated packets and send them out on
a particular interface. I've been reading a lot of docs and FAQs, but it
seems that I can't do this?  Do I need to go through user space?

ROUTE --tee seems not to allow you to do anything further with the
packet unless I'm missing something?

There were also some veiled references to MARK and iproute2 but nothing
concrete that I can find.

Has anyone done this or something similar? Any ideas? Or a pointer to a
reference I've missed?

thanks
Ramen


