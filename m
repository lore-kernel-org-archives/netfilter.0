From: Craig Steadman <spinout@yakbox.shacknet.nu>
Subject: Re: ways to lookup or query rules?
Date: Wed, 06 Oct 2004 15:41:19 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097048478.10818.89.camel@e500>
References: <002201c4ab53$f4264300$2001a8c0@mantis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002201c4ab53$f4264300$2001a8c0@mantis>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jonathan <jonathan@jonathan.abda.net>
Cc: netfilter@lists.netfilter.org

Hi Jonathan
I've posted the scripts i use on sourceforge
http://bastionx.sourceforge.net

then main rc.bastionx script has a simple search and
replace feature for acls on ip or alias ... 
It only does INPUT,OUTPUT and FORWARD chains but
could be adpated to be more generic.

Cheers
  Craig

On Wed, 2004-10-06 at 11:24, Jonathan wrote:
> Hi, if this is a classic case of RTFM go ahead and shoot me.
> 
> Is there an option or a command to look up rules in your iptables,
> especially if there's the ability to search by rulenumber or some
> kind of key?
> 
> The only solution I've seen so far, is to use the -l option, capture the
> output, and then process it, but that's a very dirty solution.
> I'm writing a script that needs to update the iptables automatically, and I
> assume it needs to know whether ot use the add or update
> option by verifying whether a rule exists, in order to decide whether to
> update the rule, or add a new one.
> 
> Jonathan
> 


