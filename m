From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: DROP
Date: Mon, 18 Apr 2005 01:36:35 -0500
Message-ID: <42635573.3010104@riverviewtech.net>
References: <42634792.2070307@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42634792.2070307@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: iptables <netfilter@lists.netfilter.org>

> I was wondering, if was adviseable to set the default policy for tables 
> nat and mangle to DROP.

I don't know if it is advisable or not but it is entirely possible.  Just as you explicitly allow traffic in through your filter chains via matching rules you will have to explicitly allow traffic in through your nat / mangle chains respectively too.  I've done this in the past and found it somewhat overkill but effective.  I don't think traffic in the mangle / nat tables reaches up to the standard TCP/IP, UDP/IP stack for your daemons to accept or drop as in port not advisable if you try to connect to an unknown / not listening service.  If you had someone hammering away at a port on your system you could very easily add a rule in either nat:PREROUTING or the respective mangle chains.  I do know that when you start firewalling in the nat and mangle table things get a lot more complicated as traffic will pass through one or more chains before it even reaches the filter table (this is esp
 ecially true with the mangle table) and thus more complicated.  I can't give you a reason 
to not do this, other than possibly excessive complexity.

> So do i need to need to go the extra mile and set the default policy for 
> tables nat and mangle to DROP.

I don't think I would do it again unless I was excessively paranoid.



Grant. . . .

