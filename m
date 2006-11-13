From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: Architecture advice for a newbie
Date: Mon, 13 Nov 2006 07:30:33 +0100
Message-ID: <14396.7639808126$1163399581@news.gmane.org>
References: <e1663d820611122212g3738e01ay37651c50eca8ec81@mail.gmail.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e1663d820611122212g3738e01ay37651c50eca8ec81@mail.gmail.com>
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

Hi.

Google for portknocking ! It is a solution for opening ports "at run time"
by accessing some, already closed ports, and sending a specific packet type.

You can add/delete iptables rules at runtime enabling access to some ports
or adding destination NAT to some machine behind firewall ( in LAN ). The
only thing is - no one here knows what auth method are you planning to use,
but from my experience - netfilter has enough documentation and API to help
you achieve your goal.

Try being more specific ( if possible ).

Regards,
E:S
-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Hal Moroff
Sent: Montag, 13. November 2006 07:12
To: netfilter@lists.netfilter.org
Subject: Architecture advice for a newbie

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

  2 - the target devices are generally dumb and aren't capable of
VPN/encryption
    (I should add that the internal LAN is trusted, so traffic inside
the LAN can be
    unencrypted)

I've just started reading up on VPN's and netfilter docs.  It isn't
(yet) clear to me how
to manipulate netfilter at runtime like this (to open and close the hole).

Regarding the "dumb target" in wrinkle #2, I'm thinking that traffic
can be routed to
another process on the firewall.  That process would serve as the "go
between"
between the LAN dumb target and the rest of the world.

Can anyone advise where to start investigating this?



