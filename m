From: "Carl Holtje ;021;vcsg6;" <cwh0803@cs.rit.edu>
Subject: Re: Questions regarding routing in the stack
Date: Thu, 21 Jul 2005 12:24:51 -0400 (EDT)
Message-ID: <Pine.GSO.4.58.0507211222530.20075@newavalon.cs.rit.edu>
References: <a60102c3050721073024051dd2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a60102c3050721073024051dd2@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC <bikkit@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 21 Jul 2005, JC wrote:

> I was hoping someone could possibly shed some light into this or at
> least point me to the right direction...
>
> I am trying to develop a kernel module level solution for dynamic host
> multihoming. This requires that I mangle packets from specific
> applications running on the system right in the stack and basically
> change the interface the packets are sent from (at least two
> interfaces).
>
> I understand that I need to register my mangling function with one of
> the 5 netfilter hooks (the ROUTING one?), grab the interesting packets
> and change..... something in the skbuff.
>
> What really evades me is where/when does routing *exactly* happen. If
> I know at which point it happens, I should tap right after it and
> change the interface to the one I want. Or this whole idea could be
> bad and I end up breaking something in the
> packet and it gets dropped...

At some point, I found this and squirreled it away:

# .========================================================.
# | PACKET PROCESSING PATH                                 |
# +========================================================+
#
# Arriving Packets
# ==========================================================
# No.   | Table         | Chain         | Description
# ----------------------------------------------------------
# 1     |               |               | On the wire
# 2     |               |               | At interface
# 3     | Mangle        | PREROUTING    |
# 4     | NAT           | PREROUTING    |
# 5     |               |               | Routing descision
# 6     | Mangle        | INPUT         |
# 7     | Filter        | INPUT         |
# 8     |               |               | To application
#
# Departing Packets
# ==========================================================
# No.   | Table         | Chain         | Description
# ----------------------------------------------------------
# 1     |               |               | From Application
# 2     |               |               | Routing decision
# 3     | Mangle        | OUTPUT        |
# 4     | NAT           | OUTPUT        |
# 5     | Filter        | OUTPUT        |
# 6     | Mangle        | POSTROUTING   |
# 7     |               |               | At interface
# 8     |               |               | On the wire
#
# Forwarding Packets
# ==========================================================
# No.   | Table         | Chain         | Description
# ----------------------------------------------------------
# 1     |               |               | From Application
# 2     |               |               | Routing
# 3     | Mangle        | PREROUTING    |
# 4     | NAT           | PREROUTING    |
# 5     |               |               | Routing decision
# 6     | Mangle        | FORWARD       |
# 7     | Filter        | FORWARD       |
# 8     | Mangle        | POSTROUTING   |
# 9     | NAT           | POSTROUTING   |
# 10    |               |               | At interface
# 11    |               |               | On the wire


> Of course, that needs to happen for both locally generated traffic and
> incoming traffic, so that I link the incoming packets to the right
> applications.

Why does this sound like NAT, where you take data from one interface and
spit it out on another (receive is done the same way)?

Hope this helps..

- --

"There are 10 types of people in the world: Those who understand binary
and those that don't."


