From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: strange phenomena about ip_conntrack
Date: 24 May 2003 00:54:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053730443.713.167.camel@tux.rsn.bth.se>
References: <004401c31f72$57415ca0$02020a0a@acamarpeng>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004401c31f72$57415ca0$02020a0a@acamarpeng>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: pengjie <bill@acamar.com.cn>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-05-21 at 10:24, pengjie wrote:
 
> After 2 days, the conntrack table is full, /var/log/messages display
> the ip_conntrack_count is 167, and /proc/net/ip_conntrack is empty. 
>  
> Why?!, Why the ip_conntrack_count is bigger than ip_conntrack_max?
> Why is /proc/net/ip_conntrack is empty?
> how can this occurs?
>  
> who can help me?

Can you try a newer kernel? (I'd recommend 2.4.21-rc3)

And if you still have the same problem, try enabling netfilter debugging
in the kernel configuration (or at least enable the IP_NF_ASSERT macro
in include/linux/netfilter_ipv4/ip_conntrack.h)
 
-- 
/Martin

