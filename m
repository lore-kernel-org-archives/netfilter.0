From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Bridges
Date: Wed, 18 Aug 2010 13:27:14 +0200
Message-ID: <1282130834.27243.44.camel@enterprise.ims-firmen.de>
References: <4C6B10CA.4090604@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6B10CA.4090604@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Tue, 2010-08-17 at 23:44 +0100, Jonathan Tripathy wrote:
> Hi Everyone,

> I know a previous poster mentioned that when adding a host to a bridge, 
> for a few seconds all packets get sent everywhere, however does this 
> only apply to the bridge that the new host was added to, or all bridges 
> in the system?

As Stephen already said, this is the standard behaviour of Ethernet
bridges (=switches), that bridges are somehow a security device
for separating Ethernet nodes is an urban myth (unless you employ
other techniques like 801.2q VLANs)

> Reason I ask is that I am considering have one bridge for public traffic 
> and one bridge for private, and don't want private traffic to be seen by 
> hosts connected to the public bridge.

But if you configure two bridge devices (br0 & br1) on your Linux box,
what you get is two separate Ethernets (broadcast domains really),
that cannot directly talk to each other over the Ethernet layer, unless
resorting to a router somewhere (assuming your Ethernets are not
connected to each other elsewhere).

In essence, such a setup should behave as if you had two different
Ethernet switches somewhere and the private machines are only connected
to the private switch and the public machines are only connected
to the public switch.

Whether this setup makes any sense in your case is another matter
though...


