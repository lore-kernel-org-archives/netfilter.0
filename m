From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: netfilter CPU usage
Date: Mon, 14 Jun 2004 07:36:09 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087212969.5324.5.camel@localhost>
References: <33105.217.79.71.234.1087126250.squirrel@mail.ssi.bg>
	 <200406131626.17416.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406131626.17416.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sun, 2004-06-13 at 11:26, Antony Stone wrote:
> On Sunday 13 June 2004 12:30 pm, lartc@ssi.bg wrote:
> 
> > Hello
> >
> > Can someone tell me just how intensive netfilter is towards CPU?
> >
> > Is it posible for 6000 rules with no target set in the FORWARD chain to
> > eat up about 60% of my P4 2.4 GHz?
> 
> I would be very surprised at this, however you haven't said what sort of 
> bandwidth you're shovelling through the machine, and this will clearly make a 
> difference to the CPU usage.
> 
> Also, when you say "6000 rules with no target set", I assume this means that 
> each packet is traversing all 6000 rules (presumably for some sort of 
> accounting process), and then getting to the bottom of the table and doing 
> something more interesting...
> 
> One simple way of identifying whether it's the 6000 rules which are consuming 
> 60% of your CPU would be to temporarily reduce the ruleset to 2000 or 3000 
> and see if you get a noticeable reduction in CPU usage (I wouldn't expect it 
> to be proportional, so don't look for 20% or 30%, but if it doesn't go down 
> by much, you know it's not the 6000 rules causing the load).
> 
> How memory is in the machine?
> 
> Are you using connection tracking (if so, how many connections are in 
> /proc/net./ip_conntrack)?
> 
> Regards,
> 
> Antony.
How are you loading the rules? Is this high CPU utilization during the
load sequence or are you certain the rules have already loaded and you
still have such high CPU utilization? One should use the
iptables-restore method of loading when using so many rules.  Doing 6000
iptables commands will put a terrible load on the system and take
forever to load - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


