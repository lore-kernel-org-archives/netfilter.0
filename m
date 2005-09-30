From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: can't initialize iptables table `filter': Bad file descriptor
Date: Fri, 30 Sep 2005 23:19:39 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0509302318140.31223@filer.marasystems.com>
References: <OF44D8A4FA.986454A5-ONC125708C.0051084E-C125708C.005269B7@mondial.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF44D8A4FA.986454A5-ONC125708C.0051084E-C125708C.005269B7@mondial.de>
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
To: Stefan.Weigel@mondial.de
Cc: netfilter@lists.netfilter.org

On Fri, 30 Sep 2005 Stefan.Weigel@mondial.de wrote:

> I compiled kernel 2.6.13.2 and iptables 1.3.3 with some extra modules from
> patch-o-matic-ng. Compiling went good.
> But when doing a
>
> # iptables -L
>
> I get the following error message:
>
> iptables v1.3.3: can't initialize iptables table `filter': Bad file
> descriptor
> Perhaps iptables or your kernel needs to be upgraded.


Is your iptables compiled to the correct kernel headers? (KERNEL_DIR 
argument when compiling iptables)

Regards
Henrik

