From: Jason Opperisano <opie@817west.com>
Subject: Re: limiting connections
Date: Mon, 1 Nov 2004 10:04:46 -0500
Message-ID: <20041101150446.GA18016@bender.817west.com>
References: <20041101092621.GA6044@tranquility.scriptkitchen.com>
	<1099316742.3271.12.camel@hubcap.ljm.dom>
	<20041101145111.GA13130@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041101145111.GA13130@tranquility.scriptkitchen.com>
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

On Mon, Nov 01, 2004 at 09:51:11AM -0500, Payal Rathod wrote:
> On Mon, Nov 01, 2004 at 08:45:42AM -0500, Jason Opperisano wrote:
> > have a look at the connlimit patch from POM.a
> 
> Can it be done without patching? I don't mind if I can drop all
> connections to my external interface above say 10. i.e. only 10 people 
> should be allowed to connect.
> 
> With warm regards,
> -Payal

yeah, in your web server configuration, set the maximum number of
simultaneous connections to 10.

-j

--
"Mmmm...free goo."
	--The Simpsons

