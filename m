From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: Shaping ingress traffic
Date: Fri, 18 Jun 2004 01:47:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D23BBE.7060404@dsl.pipex.com>
References: <20040614180844.392a2608.leslie.polzer@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040614180844.392a2608.leslie.polzer@gmx.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Cc: netfilter@lists.netfilter.org

Patrick Leslie Polzer wrote:
> Hello,
> 
> I know that policing ingress traffic can not be as effective as shaping
> egress traffic, but I would still like to know your opinions on the
> best thing I could do with my setup:
> 
> I have a total asymmetric bandwidth of 768kBit/128kBit.
> 
> Three hosts are masqueraded via this interface (ppp0),
> with two on the interface 'vortex' and one on 'dec'.
> Each one should get at least about one third of the
> available downstream, and more if there's more available.
> 
> How is this most effectively achieved?

You could use IMQ(+NAT patch) on ppp0 then shape using HTB etc.

www.linuximq.net
www.lartc.org

The lartc list may help with details.

Andy.




