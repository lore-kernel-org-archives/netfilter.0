From: Philip Craig <philipc@snapgear.com>
Subject: Re: Unmatchable packet?
Date: Fri, 25 Nov 2005 11:11:18 +1000
Message-ID: <438664B6.2090807@snapgear.com>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>	<078401c5efcf$bd9eb210$5e00800a@printserver>	<4384069F.3010201@snapgear.com>
	<WorldClient-F200511222303.AA03060138@nikola.com>
	<438417F8.3060907@snapgear.com>
	<002201c5f0ec$ef3f2c50$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002201c5f0ec$ef3f2c50$5e00800a@printserver>
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

On 11/24/2005 09:48 PM, Jesse Gordon wrote:
> I ran across a new word (new only to me) 'Fast-nat' -- seems some kernels --  
> at least 2.2 kernels -- had some fast simple dumb stateless natting 
> capabilities in them.
> I wonder if that's what I should be looking into.

The custom mangle target that I referred to would have the same
function as fast-nat (although it wouldn't be as fast ;-)
2.4 also has fast-nat, but I couldn't see it in 2.6.

> I need to rewrite the address so the calling party gets replies with the 
> correct source address.
> I've very carefully created a .PNG diagram on this webpage including IPs and 
> text descriptions here:
> http://jesseg.nikola.com:8080/asym-nat-route/
> This will explain Exactly what I'm trying to do, and why I need to snat on 
> the connection replies.

Okay I can see what you are doing here, and it isn't going to
work with standard iptables NAT.  Assymetrical routing and NAT
are incompatible.

Even your "working" case is not ideal, each direction is seeing
only half the packets and so they can't keep state fully.  Anything
that requires a NAT helper will fail.  eg FTP data connections

> It seems iptables has no problem matching and SNATting reply packets as long 
> as they aren't the reply packets generated
> by a local server.

No.  It has no problem matching and SNATing replies as long
as they are the first packet of the connection that it sees.

> In other words, when a connection is initiated by the Workstation, not only 
> is the first nat rule natting the first request packet,
> the second nat rule is also matching and natting the reply packet. Same 
> thing with the incoming connection.
> 
> But shouldn't the reply packet be ignored by all nat rules, since nat only 
> sees first packet of connection?

See Robert's explanation.
Also, try doing 'iptables -t nat -L -nv' and look at the packet
counts on the rules to see exactly which are matching.

> But I can't nat in any table other then nat, right?

Correct.

>>The mangle table also sees every packet.  It would be possible to write
>>a custom target for use in the mangle table that changes the source
>>address as you desire.  However, noone has written such a target as
>>far as I know.
>>
> 
> 
> 'Custom target' = a module or some addition to the source code, right?

Yes.

> Also, is my current understanding that "There are some packets which simply 
> cannot be source natted," correct?

Incorrect.  The source natting is determined by the first packet
in the connection.   You cannot *change* this source natting for
subsequent packets.

> It may be that if I knew how to use the 'ip' program, I could do everything 
> I need with 'ip route' and so on. I'm certainly open to suggestions.

Yes.  You can use CONNMARK to mark connections that are initially
received on the internal interface, and then use 'ip rule' and 'ip route'
to route those packets back out the internal interface to the
Box A, which will use its existing NAT mapping to correctly source
NAT them automatically (ie no further NAT rules required).

