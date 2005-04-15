From: Jason Opperisano <opie@817west.com>
Subject: Re: Complete Rule Syntax
Date: Fri, 15 Apr 2005 16:09:18 -0400
Message-ID: <20050415200918.GA7159@bender.817west.com>
References: <1113593041.4738.18.camel@bodhittsatva>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113593041.4738.18.camel@bodhittsatva>
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

On Fri, Apr 15, 2005 at 02:24:01PM -0500, Thomas Jones wrote:
> Is there a resource available that contains a complete compilation of
> the syntax used by iptables rules? Targets only available in certain
> chains, positional semantics, and structure requirements, etc...
> 
> A book, howto, tutorial anything. 
> 
> I've found the resources via google do not have a complete listing of
> available commands, options, and accepted values and/or value ranges.
> 
> I am developing an Document Type Definition to provide proper format of
> iptables rules and/or commands for a custom XML Markup Language. But,
> given the complexities of both DTD development syntax and iptables
> syntax; it has proven to be heck of a job.
> 
> Any help would be greatly appreciated.

i honestly don't mean this as some sort of wise-ass answer, but you
appear to be asking for the information contained in 'man 8 iptables.'

if you need the usage details for non-standard extensions, you can refer
to the 'help' file in each extension's subdirectory in PoM (best way to
get PoM these days is via svn @
http://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng/ )

-j

--
"Tom Tucker: I think I speak for everyone when I say, New York and
 everyone from there can fornicate themselves with an iron stick."
        --Family Guy

