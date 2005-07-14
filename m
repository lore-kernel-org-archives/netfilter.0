From: Aleksandar Milivojevic <alex@milivojevic.org>
Subject: Netfilter and IPSec interaction
Date: Thu, 14 Jul 2005 12:21:09 -0500
Message-ID: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-disposition: inline
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

I'm writing set of firewall rules for IPSec based VPN, and have couple of
questions.

I know that packets are supposed to go through Netfilter tables twice (as
received from the wire, and than as outputed by IPSec module).  However, what I
noticed is that this seems to be true only for incomming packets.  The outgoing
packets seems to go through Netfilter tables only once.

For example, I've placed bunch of LOG rules in every chain of filter and mangle
tables, logging all icmp and esp protocol packets.  I've placed them as the
very first rules in each chain, so basically they should log everythign that
goes on.  I've observed this when pinging a host on remote network (over IPSec
tunnel):

Sending ICMP ping, only one pass:
   mangle   PREROUTING    cleartext icmp packet
            FORWARD       cleartext icmp packet
   filter   FORWARD       cleartext icmp packet
   mangle   POSTROUTING   encrypted esp packet

Basically packet went through Netfilter tables only once, with IPSec kicking in
somewhere between filter's FORWARD and mangle's POSTROUTING chains.  I would
expect encrypted packet to also go through filter's and mangle's OUTPUT chains.
 After all, the esp packet is locally generated.  But it never got there, it
just went straight to mangle's POSTROUTING chain and hopped onto the wire.

On the other hand, the return packet was handled as expected (this part included
more as reference):

Receiving ICMP pong, first pass:
   mangle   PREROUTING    encrypted esp packet
            INPUT         encrypted esp packet
   filter   INPUT         encrypted esp packet
IPSec kicks in, and we have second pass:
   mangle   PREROUTING    cleartext icmp packet
            FORWARD       cleartext icmp packet
   filter   FORWARD       cleartext icmp packet
   mangle   POSTROUTING   cleartext icmp packet

So, my question is, is something going wrong here, or is this asymetry by
design?

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


