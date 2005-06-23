From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: iptables ROUTE target
Date: Thu, 23 Jun 2005 12:06:41 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0506231205140.19079@mercury.sdinet.de>
References: <3f3cb3f2050623020675984770@mail.gmail.com>
	<3f3cb3f205062302117f64989f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3f3cb3f205062302117f64989f@mail.gmail.com>
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
To: Maya Zimerman <maya.zimerman@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 23 Jun 2005, Maya Zimerman wrote:

> I would like to use/test the experimental feature of ROUTE target.
> I have downloaded iptables v1.2.9. I saw the relevant source,
> libipt_ROUTE.c but the header files containing definitions seem to be
> missing.

You saw the userspace config part of it.
The needed kernel code is part of patch-o-matic-ng, available through the 
netfilter.org website.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

