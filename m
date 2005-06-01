From: Jason Opperisano <opie@817west.com>
Subject: Re: CONNTRACK problem
Date: Tue, 31 May 2005 22:32:11 -0400
Message-ID: <20050601023211.GA7056@bender.817west.com>
References: <8016435.1117541117857.JavaMail.www@wwinf0301>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <8016435.1117541117857.JavaMail.www@wwinf0301>
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

On Tue, May 31, 2005 at 02:05:17PM +0200, Rodolphe AVERTY wrote:
> Hello,
> 
> i have two router connected to the internet and i want to send my tcp connection between them.
> 
> this is my iptables script :
> 
> ############################################################################
> iptables -t mangle -N INTERNET
> iptables -t mangle -N INTERNET_ROUTER_1
> iptables -t mangle -N INTERNET_ROUTER_2
> 
> #le paquet est t'il en direction d'internet
> iptables -o eth2 -t mangle -A POSTROUTING -p tcp -d ! 10.0.0.0/8 -j INTERNET

you are trying to use fwmark's as a key in the routing decision; yet
you are MARK-ing in the mangle POSTROUTING chain, POST meaning "after"
and ROUTING meaning "routing."  you'd be better served to place these
rules in the mangle PREROUTING chain; PRE meaning "before" and ROUTING
meaning "routing."

-j

--
"Peter: I only drank so that the Statue Of Liberty would take her
 clothes off."
        --Family Guy

