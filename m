From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: kernel freeze issue
Date: Wed, 9 Nov 2005 12:01:03 +0100
Message-ID: <200511091201.03783@nienna>
References: <43692579.8000807@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43692579.8000807@elte.hu>
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
To: netfilter@lists.netfilter.org


  Hi,

On Wednesday 02 November 2005 21.45, Zoltan Nagy wrote:
> problem:
> 	filter is freezes in random intervalls(30m - 6day) - on-board
> watchdog(i8xx) reboot's the system i've tryed many things, remove my
> custom patches...but it won't help ;) in the kernel trace i've last
> seen(i've a blurry image)
> 	the kernel remove some packages from the boomerang interface
> 	ip_rcv_finish, etc..
> 	ipt_do_table is the last in the call trace...

  Please try to get at least a backtrace, withouth that probably nobody will 
be able to help you. The above information (ip_rcv_finish and ipt_do_table 
being present in the trace) is completely useless, as processing _any_ IPv4 
packet could lead to receiving such a backtrace...

> my tips was:
> 	ipt_condition	-	in pom it's <2.6.0 but i've read the code, and i think
> it's safe to use 

> today's surprise:
> 	ip l s eth0 promisc on	==> freeze, without any trace ;)

  You could still try getting a backtrace with SysRq + P.

-- 
 Regards,
  Krisztian Kovacs

