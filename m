From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridge, DNAT, New Tables and ip rules
Date: Wed, 13 Jun 2007 22:47:16 -0500
Message-ID: <4670BA44.9010802@riverviewtech.net>
References: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>	<466DE959.8020609@riverviewtech.net>
	<e53321d30706121212r3dabccb2na62e2c07c2b3902b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30706121212r3dabccb2na62e2c07c2b3902b@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/12/2007 2:12 PM, semi linux wrote:
> Yes, I've had this setup running for quite a while but when adding a 
> new ethernet card (on the same or different networks) I get a 
> problem.

Ok, I just had to ask.

> Actually, I've renamed two ports on a dual-port card to be eth50 and 
> eth51 (done using udev rules) and they have a bridge interface of 
> br0.

Do you really have that many interfaces, or are you just skipping a 
bunch of interfaces?

> All other traffic flows just like normal through the bridge.

*nod*

> The second rule is in place just in case Dan initiates conversation, 
> instead of Jack.  When the source is local, wouldn't the outgoing 
> traffic be processed as follows?:

Does this rule ever match any packets?

> program -> routing decision -> mangle::output, nat::output, 
> filter::output, mangle::postrouting, nat::postrouting, interface, 
> wire.

Sorry, with my current state of mind, I can't respond to this.

> Therefore it'd never hit the nat::prerouting (or _any_ ::prerouting 
> rules), right?

(See above.)

> Jose has two IP address, eth0 and br0... they could be on the same 
> subnet or different subnets (depending on install details).

Hum.

> This is the crux of the problem, let me try to clarify... Jose does 
> talk to Jack, but it's through the wrong interface (eth0 instead of 
> br0 (eth50/eth51)).  The packets that are coming out of eth0 are the 
> proper responses, with Dan is listed as the source and Jack is the 
> destination.  The question is, w/o knowing Jack's IP how do I route 
> them through br0?

Baring in mind that (by default) Linux will (primarily) use one 
interface on a subnet unless you do something to alter it.  To this end 
I think you will need to match based on Dan's IP be it source or 
destination.

> I was pointed in that direction by the good folks over on the Fedora 
> mailing list but I'm all ears to try anything here and have no 
> problem testing _sny_ suggestions.

I'm still not convinced that you need to mark the packets.  In my 
opinion it is so much easier to match the source or destination IP.

> br0 - eth50/51 - bridged. eth0,1,2,3,etc... independent. New NIC are 
> brought-up in a typical fashion... added, with default gateway, etc.

Ok, I feel like I'm missing your config.  Will you please list out your 
interfaces (logical and physical) as well as subnets.  Granted the 
subnets can be a.b.c.x, d.e.f.x, g.h.i.x, etc.

> I'm guess with the information I've provided above, you're going to 
> suggest something different... I've already looked into bonding and 
> STP... even adding eth0 to the bridge, none of those solutions seem 
> to do the trick.  Let me know if I should reconsider some of these in 
> light of the above.

You will probably have to use custom routing tables including the tables 
including link addresses.



Grant. . . .

