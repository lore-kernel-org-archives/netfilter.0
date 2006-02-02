From: Alan Stern <stern@rowland.harvard.edu>
Subject: Packet filtering and SNAT
Date: Thu, 2 Feb 2006 15:52:15 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.0602021542310.5016-100000@iolanthe.rowland.org>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Apologies if this question has been asked many times before.

I want to set up SNAT on my firewall, and I want to block incoming packets 
that have destination addresses that actually exist on the LAN.  That is, 
I want to accept incoming packets only if they are part of an SNAT 
connection, not if they are addressed directly to one of the local 
computers.

Adding a rule to the FORWARD chain in the filter table won't work, because
at that point the destination address has already been converted to the
destination computer's actual address (hence there's no way to tell which
packets should be dropped).  Would a rule in the PREROUTING chain of the
mangle table work?  If not, what should I do to detect and drop the
packets I don't want?

Thanks,

Alan Stern


