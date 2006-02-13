From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: SNAT round-robin broken?
Date: Mon, 13 Feb 2006 22:30:45 +0100
Message-ID: <200602132230.48764@krak>
References: <3d00e6dc0602100722l482ae14naa0964f58fb83753@mail.gmail.com>
	<200602132145.27983@krak>
	<3d00e6dc0602131301y75cf0398y8c887289b8c994d3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3d00e6dc0602131301y75cf0398y8c887289b8c994d3@mail.gmail.com>
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
To: Khoa Nguyen <khoa.coffee@gmail.com>
Cc: netfilter@lists.netfilter.org


  Hi,

On Monday 13 February 2006 22:01, Khoa Nguyen wrote:
> Before 2.6.11 kernel, the SNAT box was mapping every new socket from
> the Client to a new source IP address. With this, I was able to
> simulate several thousands "virtual" clients. Now with the new
> behaviour, every socket from the Client to the Server is mapped to the
> same random but fixed source IP address. I am sure the new NAT
> implementation is better and cleaner than the old one, but it also
> takes away a nice round-robin feature per socket. Is there any way I
> can achieve the previous behaviour without modifying the kernel source
> code :-( or downgrading to a pre-2.6.11 kernel? (I am writing some
> ip_conntrack/ip_nat modules based on the new 2.6.11+ API, so
> downgrading the kernel is going to be painful)

  I see. Well, I don't think this is possible without modifying the kernel 
source. However, you could try either modifying the client to use 
different IP addresses (by configuring a few thousand IP addresses to the 
client and having the client bind() to different IP addresses), or 
modifying the kernel to do what you'd like.

  I think both of these should be relatively easy (in case you have access 
to the client source code). About the kernel: take a look at 
find_best_ips_proto() in ip_nat_core.c. At the end of the function 
there's a jhash_2words() call, this is responsible for choosing an IP 
inside the address range specified. You could easily modify it to produce 
a hash value based on the (src, src port, dst) tuple instead of just 
(src, dst).

-- 
 KOVACS Krisztian

