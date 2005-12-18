From: Chris Young <chris-netfilter@chris.net.au>
Subject: Re: Set mark in -j QUEUE?
Date: Sun, 18 Dec 2005 12:42:05 +0800
Message-ID: <20051218044205.GB430@viper.net.au>
References: <000001c60332$36cd7340$2801a8c0@MBRC40>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000001c60332$36cd7340$2801a8c0@MBRC40>
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
Content-Transfer-Encoding: 7bit
To: "Michael D. Berger" <m.d.berger@ieee.org>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, Dec 17, 2005 at 12:49:22PM -0500, Michael D. Berger wrote:
> Is there any way to make this work in the -j QUEUE processor?

You need to use the ip_queue_vwmark patch:

http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-ip_queue_vwmark

It provides a ipq_set_vwmark function, it's the same as ipq_set_verdict,
except it takes a mark parameter.

I have nothing to do with the development of it, but I use it for my own
project, and it works well.

Regards,
Chris

