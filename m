From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: IPtable Server hanging
Date: Thu, 04 Dec 2003 09:01:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070546465.3552.261.camel@grendel>
References: <003401c3ba66$9645e760$c2bf09ca@huecal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003401c3ba66$9645e760$c2bf09ca@huecal>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-12-04 at 08:00, hare ram wrote:
>
> after i connected the Links to eth1 and eth2
> the CPU load goes to 100% both
> 
> when i drop the ICMP in INPUT and FORWARD
> the CPU load go to 5%
> 
> what could the problem,

Too much ICMP traffic? ;-)

>  how can i resolve this problem
> what is the problem is this ICMP flood or Syn attack or DoS attack

Sounds like an ICMP flood, possibly due to Nachi or some variant.

Start logging traffic. That will tell you which IP is originating the
flood. If its internal systems, cleaning and patching is in order.

HTH,
C



