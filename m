From: "Joe Clark" <joeclark@iastate.edu>
Subject: Simulated Packet Delays
Date: Thu, 24 Jun 2004 18:33:38 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <38331824510441751@webmail.iastate.edu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi.  For a research project, I need to find a way to simulate long delays (ie,
simulating 70ms or so of delay over a typically-1ms delay LAN).  From what I've
seen online, the Netfilter mechanism seems to be the best way to do this.  There
are some Linux packet filtering facilities available with little or no work
(qdisc, tc, etc), but none seem to do the delay that I'm seeking.

So, from my web search, I would need to write a simple kernel module that would
NF_QUEUE all outgoing packets on a link, and then in user space read the packet
info in, set up a delay-based queuing mechanism, and then dequeue the packets
after the delay and reinject them (NF_ACCEPT via an ioctl?).

Is that the best method?  I saw something about libipq, which has to do with how
to use the NF_QUEUE framework in userspace.  I also saw a reference that said I
could create a /dev/... device for reading in netfilter queued packets.  Which
is the preferred or current way to do it?

Thanks for any help you can provide.
- Joe Clark



