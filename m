From: Erik Enge <eenge@prium.net>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: 11 Sep 2002 14:25:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <873csg4c3v.fsf@prium.net>
References: <87ofb44i7l.fsf@prium.net>
	<20020911174425.URMD287.mta02-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020911174425.URMD287.mta02-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@soft-solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Antony Stone <Antony@Soft-Solutions.co.uk> writes:

> Ugh !!!   What sort of networking setup have you got here ???

A fictional one.  :-)

Here's what we are thinking about doing, with the actual subnets:

  NIC 1, eth0, 192.168.1.0, private LAN
  NIC 2, eth1, 192.168.10.0, DMZ
  NIC 3, eth2, 192.168.11.0, DMZ located elsewhere
  NIC 4, eth3, 10.0.0.0, backup subnet
  NIC 5, eth4, some-other-subnet-that-leads-to-the-internet

> Give us more information about your overall network setup, and we'll
> probably either tell you that you've been very lucky with your routing
> table setup, or that you've got more to worry about than one of your
> NICs dying :-)

:-)

Ok, given the above configuration, and as we discussed before, why is it
inconceivable that the interface would communicate with my router?

Thanks for your help so far,

Erik.

Note: currently, we only have one small firewall with a LAN behind it.
The reason we need this quite elaborate setup (assuming we're not going
to buy any switches) is that we are moving part of our infrastructure to
a colocation.

