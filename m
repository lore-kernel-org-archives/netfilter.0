From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/NAPT
Date: Tue, 23 Nov 2004 14:54:07 -0500
Message-ID: <20041123195407.GA2891@bender.817west.com>
References: <co03tv$7f0$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <co03tv$7f0$1@sea.gmane.org>
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
To: netfilter@lists.netfilter.org

On Tue, Nov 23, 2004 at 02:43:56PM -0500, Ugo Bellavance wrote:
> Hi,
> 
>   I think that it is possible to achieve some kind of load-balancing 
> between two servers using iptables NAPT (Network and port translation, 
> which is usually called port forwarding).
> 
> I want to run 2 web servers and use my firewall to do some 
> load-balancing between them, but I was wondering if it only forwarded 
> the packets on some round-robin way, even if one host is down.  To 
> summarize, I want to know if I can do some automatic failover with iptables.
> 
> If you need more info, let me know

why not do it for real?

  http://www.linuxvirtualserver.org/

-j

--
"That's it! You people have stood in my way long enough. I'm going
 to clown college!"
        --The Simpsons

