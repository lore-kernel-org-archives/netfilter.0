From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: IP port over 65535 ?!
Date: Wed, 31 May 2006 08:25:00 +0100
Message-ID: <20060531072500.GS19917@metastasis.org.uk>
References: <013701c66990$0e9cc500$5e00800a@printserver>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <013701c66990$0e9cc500$5e00800a@printserver>
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
To: netfilter@lists.netfilter.org

On Wed, Apr 26, 2006 at 05:18:06PM -0700, Jesse Gordon wrote:
> I sometimes see a port number like this in Tcpdump:
> 
> 10.0.0.76.2049 > 64.x.x.5.796094310: reply ERR 394
> 
> 64.7.197.5.791752241 > 10.0.0.76.2049: 1460 proc-170106..
> 
> Ever seen anything like this?
> 
> I'm a small natting ISP -- all of the above looks good except that port 
> number of 791752241..

That looks like some kind of issue with tcpdump or the underlying
library.  Have you looked at the same traffic with tethereal/ethereal?

-- 
How can I miss you if you won't go away?


