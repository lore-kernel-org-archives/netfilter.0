From: "Hal Moroff" <halm90@gmail.com>
Subject: Architecture advice for a newbie
Date: Sun, 12 Nov 2006 22:12:15 -0800
Message-ID: <e1663d820611122212g3738e01ay37651c50eca8ec81@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I'm fairly experienced with Linux and find myself on a project in an
area that is new to me.

We have a Debian based firewall.  When a client (of our own
design/implementation)
contacts the firewall I wish to connect it to a device behind the
firewall.  The hole
through the firewall should be closed until the client is explicitly
authenticated, and
should only remain open for a specific amount of time or until the
client disconnects.
When the hole is opened WAN traffic between the client and the
firewall should be
encrypted.

I'm thinking that the client should VPN IPSec to the target, and
netfilter can manage
the hole.

There are 2 small wrinkles to add to this:
  1 - we have our own authentication scheme we wish to use, above and beyond
    any preshared keys

  2 - the target devices are generally dumb and aren't capable of VPN/encryption
    (I should add that the internal LAN is trusted, so traffic inside
the LAN can be
    unencrypted)

I've just started reading up on VPN's and netfilter docs.  It isn't
(yet) clear to me how
to manipulate netfilter at runtime like this (to open and close the hole).

Regarding the "dumb target" in wrinkle #2, I'm thinking that traffic
can be routed to
another process on the firewall.  That process would serve as the "go between"
between the LAN dumb target and the rest of the world.

Can anyone advise where to start investigating this?

