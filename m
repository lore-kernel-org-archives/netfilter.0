From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: limiting connections
Date: Mon, 1 Nov 2004 11:19:47 -0500
Message-ID: <20041101161947.GA15423@tranquility.scriptkitchen.com>
References: <20041101092621.GA6044@tranquility.scriptkitchen.com>
	<1099316742.3271.12.camel@hubcap.ljm.dom>
	<20041101145111.GA13130@tranquility.scriptkitchen.com>
	<20041101150446.GA18016@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041101150446.GA18016@bender.817west.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Mon, Nov 01, 2004 at 10:04:46AM -0500, Jason Opperisano wrote:
> yeah, in your web server configuration, set the maximum number of
> simultaneous connections to 10.

Not all webservers (especially windows based) might support it. Also
what if the server in question is not a webserver but some simple server with 
no such capabalities. Hence I was looking at iptables to solve it for me.
The reason is that I am scared to re-make a core utility such as
iptables from  a tar ball. I prefer rpm for such cases.
I have Mandrake 10.0 (official).
With warm regards,
-Payal

