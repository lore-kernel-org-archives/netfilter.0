From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Sat, 1 Oct 2005 19:06:56 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510011859560.15331@filer.marasystems.com>
References: <200510011806.52191.marek.zachara@conexe.pl>
	<200510011827.15384.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510011827.15384.marek.zachara@conexe.pl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, Marek Zachara wrote:

> Anyway, i have just noticed that not only POSTROUTING but also PREROUTING in
> the NAT table don't match packets as they should. So probably the issue is
> related to NAT table.

The NAT table is a bit special. This table only sees the very first packet 
of each new conntrack session. For all consequtive packets of the same 
session the same NAT rules is automatically used.

What this means is

   a) You can not change NAT for a session while it is running

   b) When you add NAT rules they only start to apply on the next session. 
Traffic flows already seen won't be NAT:ed.

You did not tell what kind of traffic flows you are having, but the rule 
fragments you show is based on UDP. UDP sessions are tracked by the

   source IP, port, destination IP, port  (and the reverse)

once a such pakcet has been seen the UDP session persists in conntrack/NAT 
until no matching packets have been seen for the udp conntrack timeout 
(usually 180 seconds).

Regards
Henrik

