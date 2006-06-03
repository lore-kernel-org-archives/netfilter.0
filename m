From: ramsurrunv@mx.uom.ac.mu
Subject: Disntiguish between ACK packets in a TCP connection!!
Date: Sat, 3 Jun 2006 21:05:58 +0400 (MUT)
Message-ID: <1229.202.123.9.209.1149354358.squirrel@mx.uom.ac.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi to all,

I would like to know if there's a way to distinguish between the ACK
packet sent during the connection establishment phase of a TCP connection
and subsequent ACK packets sent during the data transfer phase.

I now that the ACK number sent during the connection establishment will be
'sequence number will be equal to the 'sequence number for the SYN in the
SYN/ACK packet' + 1

Is there a way to distinguish between this 3rd packet and any other ACK
packet during data transfer w/o having to keep track of sequence numbers?
Are there other characteristics or options that are set in the former and
not in the latter?

BAsically I want to capture the three packets sent during the connection
establishment phase. How can I do that?

Warm regards,
Visham

