From: Ron Peterson <rpeterso@mtholyoke.edu>
Subject: Re: Problem using transparent proxy and iptables 1.3.1
Date: Wed, 25 May 2005 16:33:39 -0400
Message-ID: <20050525203339.GA20290@mtholyoke.edu>
References: <42948ED3.7090407@novadevices.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42948ED3.7090407@novadevices.com>
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
To: Rafael Vallejo <rvallejo@novadevices.com>
Cc: netfilter@lists.netfilter.org

On Wed, May 25, 2005 at 09:42:27AM -0500, Rafael Vallejo wrote:

> I'm having a problem with iptables, we recently instaled version 1.3.1 
> on a Linux Kernel 2.6.10
> 
> This rule that used to work on former versions of iptables no longer 
> work on 1.3.1
> 
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
> --to-ports 3128

I was bitten by something similar a few months ago trying to block dhcp
through a transparent bridge (I needed to use a different dhcp server on
one side).  I used ebtables instead to fix my problem.

I was just doing allow/deny stuff though.  Ebtables has a redirect
option also, but it pertains to mac addresses.  Maybe you could do
something with marking, to make ebtables work in conjunction with
iptables??

-- 
Ron Peterson
Network & Systems Manager
Mount Holyoke College
http://www.mtholyoke.edu/~rpeterso

