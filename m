From: Jason Opperisano <opie@817west.com>
Subject: Re: conntrack error
Date: Fri, 11 Feb 2005 08:07:36 -0500
Message-ID: <1108127256.4489.27.camel@hubcap.ljm.dom>
References: <20050211105519.GA14110@daleka.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050211105519.GA14110@daleka.net>
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

On Fri, 2005-02-11 at 05:55, Piotrek Kaczmarek wrote:
> Hi,
> I encountered the following situation - when there are around 20000 connections
> "cat /proc/net/ip_conntrack" doesn't display all connections and outputs
> "cat: No space left on device" error. If I patch kernel with POM and 'nth' module
> (only patch, don't load the module) the same happens around 17000 connections.
> It happenes both with 2.6.9 and 2.6.10 kernels.
> 
> Why is it so? Is this matter of memory limit or something else?

what does:

  sysctl net.ipv4.netfilter.ip_conntrack_max

say?  i don't suppose it would be quite that simple, but might as well
start there.

-j

--
"Son, when you participate in sporting events, it's not whether you
 win or lose: it's how drunk you get."
	--The Simpsons


