From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: iprange match
Date: Wed, 12 Oct 2005 22:59:43 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510122259040.31374@filer.marasystems.com>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<200510111506.03998.rob0@gmx.co.uk>
	<1129062410.2415.103.camel@vyatka-39.cablenet.com.ni>
	<200510111540.49675.rob0@gmx.co.uk>
	<1129065387.2415.110.camel@vyatka-39.cablenet.com.ni>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1129065387.2415.110.camel@vyatka-39.cablenet.com.ni>
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
To: "Jorge I. Davila L." <davila@cablenet.com.ni>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

On Tue, 11 Oct 2005, Jorge I. Davila L. wrote:

> # make CC=gcc33 KERNEL_DIR=/downloads/kernels/xen-2.0/linux-2.4.30-xenU
> IPTABLES_DIR=/download/iptables-1.3.3 ./runme base
> make: Nothing to be done for `runme'.
> make: *** No rule to make target `base'.  Stop.
>
> this is the same result for
>
> ./runme pending
> ./runme extras

The line should read just

   KERNEL_DIR=/downloads/kernels/xen-2.0/linux-2.4.30-xenU IPTABLES_DIR=/download/iptables-1.3.3 ./runme base

no make here...

Regards
Henrik

