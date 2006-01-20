From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Using iptables on a single NIC to map old IP addresses onto new.
Date: Fri, 20 Jan 2006 07:35:19 +0100
Message-ID: <000601c61d8b$aeac87c0$0101000a@sterenborg.info>
References: <64484.207.192.181.138.1137730470.squirrel@secure.fieldpost.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64484.207.192.181.138.1137730470.squirrel@secure.fieldpost.com>
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
To: netfilter@lists.netfilter.org

> I've got an old pipe connected to a couple of public servers.
> That pipe is going dark.
> 
> I've got a new pipe from a new provider with a block of new
> IP addresses.
> 
> I'm trying to transition to the new IP block without shutting
> down the old so I can have both up while the DNS changes
> propagate.
> 
> My thought is to set up a forwarder box using iptables to
> port forward the old IP's to the new IP's.
> 
> Consider old network a.a.a.0 and new network b.b.b.0
> 
> I want to map all ports on a.a.a.2 to b.b.b.2 and all ports
> on a.a.a.3 to
> b.b.b.3
> 
> Can something like this be done using iptables if I only
> have 1 NIC card and I do not have a physically separate
> subnet?

Why not use "ifconfig" (or "ip addr") to add multiple IP addresses (old
and new) to the NIC ?
Then, when the transition is complete, you just remove the old
addresses.


Gr,
Rob


