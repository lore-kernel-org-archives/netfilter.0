From: Christian Seberino <seberino@spawar.navy.mil>
Subject: not sure ESTABLISHED TCP traffic will have ACK flag set always...
Date: Fri, 08 Apr 2005 08:57:24 -0700
Message-ID: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Firewall packet filter question.....


**After** setting up a TCP connection, it may seem to make
sense that ALL future packets would set the ACK flag.

(ACK is important in 2 way communication since both sides
need to constantly confirm //receipt// of _past_ packets.)

Therefore, you might think it would be a good idea to
set up you firewall to drop packets on ESTABLISHED
connections that don't have ACK bit set.

However, here is an apparent case where non-ACKs exist!!!...

1. One way traffic!!! --- sender has nothing to ACK!

2. One side sends LESS packets then the other! --
   fast side doesn't have enough incoming to ACK either!

Agree? Why then do people say to drop non-ACK'd packets
as suspicious??.... I would think it would be common
for one side to send more packets then the other.  I could
be wrong.

Chris


