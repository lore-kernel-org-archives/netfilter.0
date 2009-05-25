From: Thomas Jacob <jacob@internet24.de>
Subject: Choices for virtual IP failover (was Re: Firewall in Load Balance
	- Active/Active)
Date: Mon, 25 May 2009 16:13:17 +0200
Message-ID: <1243260797.11783.29.camel@enterprise.ims-firmen.de>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
	 <4A1A9756.6040401@netfilter.org>
	 <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eduardo Sachs <edu.sachs@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 2009-05-25 at 10:35 -0300, Eduardo Sachs wrote:
> Well!!
> 
> I will create a ambient of firewall active/passive.
> 
> But, what better program to do this? Heartbeat? VRRP? UCARP? Keepalived?

I've checked the available options from a similar perspective and
finally decided on keepalived.

My premises were, that the chosen system should:

1. be lightweight (i.e. using almost no resources)
2. allow for coupled virtual IPs (i.e. move the external
  virtual IP whenever moving the internal IP)
3. allow the execution of simple scripts
4. still be maintained
5. have IPv6 support

Heartbeat (2.0) is an unwieldy monster with umpteen daemons
and is also somewhat tardy, but otherwise provides all
the features (and a million more ;). Might be a choice
if you like heartbeat and/or have a lot of other services
that you want to run on the firewall machines. Heartbeat
also supports more than two nodes.

VrrpD isn't maintained anymore (last release in 2002) and provides 
no coupled IPs, not scripts and no IPv6 support but is very lightweight.

Ucarp (userspace implementation of OpenBSDs Carp) is still being
maintained and seems to be lightweight, provides for simple scripts,
though no coupled IP fail over. Don't know whether or not it provides
IPv6 support, I haven't tried it myself.

Keepalived does not have IPv6 support (yet, VRRP for IPv6 is fairly
recent) but otherwise provides all the features and also can watch
the link states of network devices. The major drawback is that it also
has a IPVS module which is printing harmless error messages when the
underlying kernel doesn't support IPVS but I suppose you could prevent
that if you'd compile keepalived yourself.

I've selected keepalived and am so far quite happy with it.

Finally the problem with all these implementations is that they don't
support virtual MAC addresses in the way VRRP is usually provides
by router vendors and thus have to send gratuitous ARP requests
to inform their networks about the new MAC address after a failover.
Maybe ucarp is an exception, doesn't look like it though.

If people have experiences with other Linux based techniques it would
be great if they could post them here.

   Thomas


