From: Andreas Micklei <andreas.micklei@ivistar.de>
Subject: Re: Explicit source port mapping
Date: Wed, 1 Nov 2006 17:10:41 +0100
Message-ID: <200611011710.41802.andreas.micklei@ivistar.de>
References: <!&!AAAAAAAAAAAuAAAAAAAAAKTyXRN5/+lGvU59a+P7CFMBAN6gY+ZG84BMpVQcAbDh1IQAAAATbSgAABAAAAAIEUEyyGMsSKuBQu3vL2y0AQAAAAA=@iname.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAKTyXRN5/+lGvU59a+P7CFMBAN6gY+ZG84BMpVQcAbDh1IQAAAATbSgAABAAAAAIEUEyyGMsSKuBQu3vL2y0AQAAAAA=@iname.com>
Content-Disposition: inline
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
To: frnkblk@iname.com
Cc: netfilter@lists.netfilter.org

Am Mittwoch, 1. November 2006 17:02 schrieb Frank Bulk:
> Sure, that can be done.  Look at this:
> http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html#ss6.1
> in detail.  Specifically, the :1-1023 at the end of the POSTROUTING
> command.

BINGO!

Thanks, I must have overlooked this. *slap on forehead*

regards,
Andreas Micklei


