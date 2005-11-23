From: Philip Craig <philipc@snapgear.com>
Subject: Re: Unmatchable packet?
Date: Wed, 23 Nov 2005 17:19:20 +1000
Message-ID: <438417F8.3060907@snapgear.com>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>	<078401c5efcf$bd9eb210$5e00800a@printserver>	<4384069F.3010201@snapgear.com>
	<WorldClient-F200511222303.AA03060138@nikola.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <WorldClient-F200511222303.AA03060138@nikola.com>
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
To: Jesse Gordon <jesseg@nikola.com>
Cc: netfilter@lists.netfilter.org

On 11/23/2005 05:03 PM, Jesse Gordon wrote:
> I agree -- to do as my little example showed would be useless -- but my
> real goal is to route the reply traffic via a different route than the
> request traffic -- I already got it to send the replies out a different
> network interface then the requests came in, but I haven't yet figured out
> how to rewrite the source address of the replies.

Why do you need to rewrite the address?
Just routing the packet should be enough, unless there is an
intermediate firewall that is dropping the packets based on the
source address.

> I don't quite understand why iptables wouldn't be able to match just any
> packet going into or out of any given network card, regardless of whether
> it was related to any other packet or not.
> 
> I may be a little confused. It seems to me that my experiments showed that
> the act of permitting a certain packet criteria to exit a specified
> ethernet port does not inherently permit the responses for that connection
> back in. It seems to me that I had to either tell it to allow related in,
> or specifically allow the replies back. I'll check into it more.

I think you are confusing the nat and filter tables.

The nat table only sees the first packet of a connection, because it
is designed to set up the nat mapping based on the first packet only.

The filter table does see every packet, which is why you need the rule
to allow established/related packets.

The mangle table also sees every packet.  It would be possible to write
a custom target for use in the mangle table that changes the source
address as you desire.  However, noone has written such a target as
far as I know.

