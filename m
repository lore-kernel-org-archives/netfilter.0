From: Erik Enge <eenge@prium.net>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: 11 Sep 2002 12:14:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87ofb44i7l.fsf@prium.net>
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
Cc: Antony@soft-solutions.co.uk

On Wed, 11 Sep 2002 15:05:54 +0100, Antony Stone wrote:

> The IP address which was supposed to be on the 'real' eth0, which has
> just died, gets applied to what you think is eth1 (even though your
> computer has just decided to rename it eth0 as the first working
> ethernet card it found).

Correct:

Before death of NIC 1:

  NIC 1, eth0, 192.168.1.1
  NIC 2, eth1, 192.168.1.2
  NIC 3, eth2, 192.168.1.3
  and so on...

After death of NIC 2:

  NIC 1 - dead
  NIC 2, eth0, 192.168.1.2
  NIC 3, eth1, 192.168.1.3
  and so on...

> It is almost inconceivable that the interface connecting you to the
> outside world will deign to communicate with your router (or whatever
> else is the next hop upstream of you) because the IP address, network
> address, default gateway, netmask etc don't match.

I don't follow you.  Let's suppose that the external interface now has
very laid-back rules and still has the same IP address, network address,
default gateway and netmask (because the 'ifconfig' statement wouldn't
have changed).  Why is it inconceivable that that interface wolud
communicate with my router?  I can't see why it wouldn't.

Thanks for your reply,

Erik Enge.

