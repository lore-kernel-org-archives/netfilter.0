From: Tom Eastep <teastep@shorewall.net>
Subject: Re: about iprange
Date: Tue, 25 Jan 2005 09:08:40 -0800
Message-ID: <41F67D18.4060100@shorewall.net>
References: <1106251621.41f00f65147cb@imp6-q.free.fr>	<1106252952.5024.25.camel@hubcap.ljm.dom>	<1106335800.41f15838d9d26@imp6-q.free.fr>	<1106660735.41f64d7f087a7@imp5-q.free.fr>
	<1106671920.5306.50.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106671920.5306.50.camel@jasiiitosh.nexusmgmt.com>
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
To: Netfilter users list <netfilter@lists.netfilter.org>

John A. Sullivan III wrote:

> 
> We found we needed to accommodate solutions both ways within ISCS, i.e.,
> if a gateway supports iprange, we write iptables rules with ranges.  If
> not, we use the logic found in SubnetCreator
> (http://subnetcreator.sourceforge.net) to break the range into subnets
> and then create rules for the resultant subnets.

FWIW, Shorewall takes the same approach although Shorewall has it's own
code for converting a range into a list of subnets.

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key

