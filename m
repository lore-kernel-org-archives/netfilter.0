From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Unmatchable packet?
Date: Tue, 22 Nov 2005 23:03:06 -0800
Message-ID: <WorldClient-F200511222303.AA03060138@nikola.com>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>
	<078401c5efcf$bd9eb210$5e00800a@printserver>
	<4384069F.3010201@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4384069F.3010201@snapgear.com>
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
To: Philip Craig <philipc@snapgear.com>, Nikolai Georgiev <voyager123bg@gmail.com>, netfilter@lists.netfilter.org



-----Original Message-----
From: Philip Craig <philipc@snapgear.com>
Subject: Re: Unmatchable packet?

> On 11/23/2005 11:46 AM, Jesse Gordon wrote:
> > I actually want to rewrite the source IP of TCP packets that exit a given 
> > ethernet card -- even (especially) if they are generated as responses 
> > to incoming connections to the box.
[Snip] 

> You can't do this with iptables.  NAT rules only match the first packet
> of a connection, and the NAT mapping that is determined for that first
> packet is applied to all subsequent packets in that connection.
> 
> Futhermore, it doesn't make sense to do this.  The client will receive
> packets from your arbitarily assigned source address, but will not know
> what to do with them since it never sent any packets to that address,
> and so it will just drop them.

Ahh, thanks! Can't be done. That explains my lack of success!

I agree -- to do as my little example showed would be useless -- but my
real goal is to route the reply traffic via a different route than the
request traffic -- I already got it to send the replies out a different
network interface then the requests came in, but I haven't yet figured out
how to rewrite the source address of the replies.

I only simplified the example so that no other unneeded data would
obfusticate what I was saying.

By using a second box with iptables as an inbetween gateway, or with proxy
arp filtering or ethernet bridging, I could probably do exactly what I
want. Perhaps I'll see what ebtables can do for me.

I don't quite understand why iptables wouldn't be able to match just any
packet going into or out of any given network card, regardless of whether
it was related to any other packet or not.

I may be a little confused. It seems to me that my experiments showed that
the act of permitting a certain packet criteria to exit a specified
ethernet port does not inherently permit the responses for that connection
back in. It seems to me that I had to either tell it to allow related in,
or specifically allow the replies back. I'll check into it more.

Thanks very much!

-Jesse Gordon



