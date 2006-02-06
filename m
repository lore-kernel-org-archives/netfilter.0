From: Philip Craig <philipc@snapgear.com>
Subject: Re: PMTU-D and conntrack
Date: Mon, 06 Feb 2006 16:43:16 +1000
Message-ID: <43E6F004.4020404@snapgear.com>
References: <1139204858.2549.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139204858.2549.5.camel@localhost>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On 02/06/2006 03:47 PM, John A. Sullivan III wrote:
> Are the ICMP Destination Unreachable-Fragmentation Needed and DF Set
> (type 3, code 4) packets sent in response to a TCP packet doing PMTU
> discovery considered RELATED or does one need to allow NEW connections
> for such packets?

The man page says that ICMP errors are RELATED, but I seem to recall
them showing up as ESTABLISHED instead.  In any case, fragmentation
needed errors are treated the same as other ICMP errors, and so an
accept ESTABLISHED/RELATED rule is enough.

> By the way, is there a way to specify code number in the --icmp-type
> match? I think one can do -p 1 --icmp-type fragmentation-needed but I
> usually use the numbers to avoid lookups, e.g., -p 1 --icmp-type 8.
> Thanks - John

The man page doesn't mention this, but if you run iptables -p icmp -h
then it says you can use type/code, eg -p 1 --icmp-type 3/4

