From: Jason Opperisano <opie@817west.com>
Subject: Re: Help about ipfw
Date: Wed, 15 Sep 2004 12:40:32 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095266432.3718.9.camel@wolfpack.ljm.dom>
References: <58812.192.168.0.100.1095265274.squirrel@192.168.0.100>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <58812.192.168.0.100.1095265274.squirrel@192.168.0.100>
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
To: netfilter@lists.netfilter.org
Cc: Nicolas Montauban <nicolas@lookali.com>

On Wed, 2004-09-15 at 12:21, Nicolas Montauban wrote:
> I want information about ipfw : link

the rules below are not IPFW rules.  they are either IPFilter, or
OpenBSD's PF.  either way--they sure ain't netfilter...

> Usually i use iptables, but i must use ipfw for this night!!!
> 
> Please don't say me "google"

google.

> I have a bridge:
> default rule are
> 
> pass in quick on lo0
> pass out quick on lo0
> 
> pass in log level local0.alert quick on ed1 from any to any
> pass out quick on ed1 from any to any
> 
> pass in log level local0.alert quick on ed2 from any to any
> pass out quick on ed2 from any to any
> 
> I want allow:
> ssh :wan to lan
> 
> block
> netbios, kazaa ... : lan to wan

this list covers linux netfilter and associated issues.  running another
piece firewall code is not a related issue in my book.

possible sources of information:

http://marc.theaimsgroup.com/?l=freebsd-ipfw&r=1&w=2

http://marc.theaimsgroup.com/?l=ipfilter&r=1&w=2

http://marc.theaimsgroup.com/?l=openbsd-pf&r=1&w=2

http://www.google.com/

man 5 ipf.conf (or man 5 pf.conf)

nice trolling, btw...  apologies to the list for feeding...  :-(

-j

-- 
Jason Opperisano <opie@817west.com>


