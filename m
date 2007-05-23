From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: redirect 127.0.0.1:25 -> 127.0.0.1:2000
Date: Wed, 23 May 2007 09:43:48 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705230943120.4452@yvahk01.tjqt.qr>
References: <464E2A63.3020903@funkware.com> <464E2CAC.8060702@funkware.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464E2CAC.8060702@funkware.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Tang <altitude@funkware.com>
Cc: netfilter@lists.netfilter.org


On May 18 2007 15:46, Alex Tang wrote:
>
> which answered my question. 
> I verified that the kernel had IP_NF_NAT_LOCAL set to y, and i see that I was
> missing the "iptables -t nat -A OUTUPT" line.  Everything works now. Whoohoo!

IP_NF_NAT_LOCAL is removed in later kernels, so don't even think
about starting to use it.

You will be perfectly fine when not having that enabled, -A OUTPUT
does it all.


	Jan
-- 

