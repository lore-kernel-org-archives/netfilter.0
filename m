From: Philip Craig <philipc@snapgear.com>
Subject: Re: Unmatchable packet?
Date: Wed, 23 Nov 2005 16:05:19 +1000
Message-ID: <4384069F.3010201@snapgear.com>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>
	<078401c5efcf$bd9eb210$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <078401c5efcf$bd9eb210$5e00800a@printserver>
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

On 11/23/2005 11:46 AM, Jesse Gordon wrote:
> I actually want to rewrite the source IP of TCP packets that exit a given 
> ethernet card -- even (especially) if they are generated as responses to 
> incoming connections to the box.
> 
>  Lets say I have 2 machines: S, and C;
> S is the server, and I am on C[lient]. Both machines are sitting on a simple 
> isolated flat LAN.
> 
> Normally, when C connects to S, S replies with it's own source address. This 
> is normal operation, and is what I want to alter.
> I wish for the replies from S to be to reach C with an arbitrarly assigned 
> source address.
> (And I want the source address rewrite to be performed inside S)

You can't do this with iptables.  NAT rules only match the first packet
of a connection, and the NAT mapping that is determined for that first
packet is applied to all subsequent packets in that connection.

Futhermore, it doesn't make sense to do this.  The client will receive
packets from your arbitarily assigned source address, but will not know
what to do with them since it never sent any packets to that address,
and so it will just drop them.

