From: Peter Marshall <peter.marshall@caris.com>
Subject: IMAP not working with Established, RELATed
Date: Wed, 22 Jun 2005 22:00:51 -0300
Message-ID: <42BA09C3.5000902@caris.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I have a default rule on my FORWARD chain that accepts established and 
related tcp and udp connections.  However, for some reason, iptables is 
dropping ack packets comming from my mailserver to mail clients on ports 
143 and 993.  Does anyone have any ideas why this might be happening ?

Thank you,
Peter

