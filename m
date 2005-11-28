From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Unmatchable packet?
Date: Mon, 28 Nov 2005 11:11:36 -0800
Message-ID: <00d401c5f44f$8df8e560$5e00800a@printserver>
References: <071e01c5efa7$786db600$5e00800a@printserver>	<073501c5efab$b10ad390$5e00800a@printserver>	<4383BBE0.2020504@gmail.com>	<078401c5efcf$bd9eb210$5e00800a@printserver>	<4384069F.3010201@snapgear.com>
	<WorldClient-F200511222303.AA03060138@nikola.com>
	<438417F8.3060907@snapgear.com>
	<002201c5f0ec$ef3f2c50$5e00800a@printserver>
	<438664B6.2090807@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

Philip, Robert, and whoever else:

Thanks! You guys have done an outstanding job of explaining this to me.
It's all starting to make a little bit of sense!

----- Original Message ----- 
From: "Philip Craig" <philipc@snapgear.com>
Subject: Re: Unmatchable packet?
> Okay I can see what you are doing here, and it isn't going to
> work with standard iptables NAT.  Assymetrical routing and NAT
> are incompatible.
>
> Even your "working" case is not ideal, each direction is seeing
> only half the packets and so they can't keep state fully.  Anything
> that requires a NAT helper will fail.  eg FTP data connections

FTP might not fail since the one public routable IP is being mapped directly 
to exactly one non routable private IP,
so the asymetry should be invisable to either end. In any case, I agree --  
[ab]using iptables like this is not ideal.

>> It seems iptables has no problem matching and SNATting reply packets as 
>> long
>> as they aren't the reply packets generated
>> by a local server.
>
> No.  It has no problem matching and SNATing replies as long
> as they are the first packet of the connection that it sees.

I'd been assuming that the type of packet mattered -- but no, it's just 
whether it's the first seen by iptables.

> Yes.  You can use CONNMARK to mark connections that are initially
> received on the internal interface, and then use 'ip rule' and 'ip route'
> to route those packets back out the internal interface to the
> Box A, which will use its existing NAT mapping to correctly source
> NAT them automatically (ie no further NAT rules required).
>

This sounds like the way to go -- I'll learn what CONNMARK means, and how to 
use ip rule and route.

Thanks very much!

-Jesse 



