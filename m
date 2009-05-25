From: Thomas Jacob <jacob@internet24.de>
Subject: RE: Choices for virtual IP failover (was Re: Firewall in Load
	Balance	- Active/Active)
Date: Mon, 25 May 2009 16:31:12 +0200
Message-ID: <1243261872.12933.4.camel@enterprise.ims-firmen.de>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	 <4A1A9756.6040401@netfilter.org>
	 <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
	 <1243260797.11783.29.camel@enterprise.ims-firmen.de>
	 <000b01c9dd44$c81bf5c0$5853e140$@bourke@mobileinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000b01c9dd44$c81bf5c0$5853e140$@bourke@mobileinternet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Bourke <john.bourke@mobileinternet.com>
Cc: 'Eduardo Sachs' <edu.sachs@gmail.com>, netfilter@vger.kernel.org

On Mon, 2009-05-25 at 15:26 +0100, John Bourke wrote:
> Folks,
> 
> Keepalived does not seem to have a mechanism to failover on the failure of a
> process on the system.  It has a load balancer which can select where
> traffic is sent to based on a HTTP check or a script return code.  But that
> is for server selection in load balancing.

It does in the latest versions, you can now add periodically run check
scripts that can be used to determine a FAULT state.

> One thing you really need to consider is flip flopping.  If you have Node A
> which is master, and when it goes down, Node B becomes master, the when node
> A comes up again it will become master.  A mechanism to "stick to the node
> last used" would be better so that a master with an intermittent failure
> does not cause flip flops.

You can do that with keepalived as well, check out the preemption
control parameters (noprempt etc.)

> Thanks
> 
> John


