From: Erik Enge <eenge@prium.net>
Subject: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: 11 Sep 2002 09:42:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87sn0g4p8o.fsf@prium.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all.

I have a question about how ethernet cards work.  I send it here because
I'm thinking that this community probably has dealt with it before, as
it seems to me to be an obvious problem (with no apparent solution to
me; hence this email).

Let's assume I have a firewall with three NICs.  As we know, the
ethernet cards under Unix (I'm running Linux 2.4) are assigned eth0/1/2
and so on based on the bus number the BIOS gives them.  My setup is as
follows:

  NIC 1, eth0, DMZ interface [somewhat laid-back firewall rules]
  NIC 2, eth1, LAN interface [very strict firewall rules]
  NIC 3, eth2, router interface [basically FORWARDs everything]
  NIC 4, eth3, external interface [basically FORWARDs everything]

Now, say we take down the firewall for some reason, and upon it coming
back up eth0 dies.  The bus assigning will then be a bit different, and
so will eth0/1/2 and so on (which is what the firewall rules are set
against).

This means that I could end up in a situation where my laid-back DMZ
rules were applied to my LAN interface and my external interface would
still work, because it would take the eth2 which is pretty laid-back.
The only thing that wouldn't work (which would trigger me that something
was wrong) is that I can't access the DMZ and my router interface.
However, if I'm unlucky, some cracker might have enough time to intrude
into my, now completely open, LAN interface and its associated network.

So, my question then, is how do you guys deal with this?  Is there a way
to ensure that the card in slot such-and-such is assigned eth1 every
single time, even if the card assigned to eth0 dies?  Or is there
another and perhaps better solution to all this?

Thanks for any replies,

Erik Enge.

