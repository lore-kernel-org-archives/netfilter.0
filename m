From: Les Mikesell <les@futuresource.com>
Subject: Re: GRE problem
Date: Thu, 13 Jan 2005 08:32:31 -0600
Message-ID: <1105626751.917.21.camel@les-home.futuresource.com>
References: <200501131013.17416.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200501131013.17416.marcin.giedz@eulerhermes.pl>
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
To: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-01-13 at 03:13, Marcin Giedz wrote:

> When first client is trying to connect to VPN server out side our office all
> packets are sent through "linux router". When he finishes the connection
> and second client wants to make a new connection no GRE packets are sent
> through router. If I down and up interfaces on "linux router" everything
> works OK as earlier - GRE packets are transmitted through router. If I
> don't down and up interfaces but wait eg. for next day everything also
> works OK. It seems for me that some "timeout" variable is set on my linux
> router but I didn't set anything. 

Is NAT involved here?  I have a similar problem where a GRE
connection goes out the wrong interface as the gateway starts
up, getting a NAT association in ip_conntrack and the NAT
never goes away after the correct interface and route come
up.  I think you need to get rid of the /proc/net/ip_conntrack
entry but there is no mechanism to do this.

-- 
  Les Mikesell
   les@futuresource.com



