From: oumer@kom.auc.dk
Subject: Re: Simulated Packet Delays
Date: Fri, 25 Jun 2004 08:48:11 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088146091.40dbcaab348fa@webmail.kom.aau.dk>
References: <38331824510441751@webmail.iastate.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <38331824510441751@webmail.iastate.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Joe Clark <joeclark@iastate.edu>
Cc: netfilter@lists.netfilter.org

HI,

I recommend using libipq, cause I am using it at the moment and it seems to
perform pretty OK, interms of processing time and the like. 

A simple way of doing this (not necessarily the best) will be (roughly):

-set rules to queue the concerned packets;
-Create some kind of queue (just use stl deque, for example, or use priority
queue) and put the packet_id, and the time it should be let go (ie current time
+ the amount of time you want to delay it) of each packet that is queued. (using
libip methods, ipq_read, ipq_getpacket and the like, which are described pretty
well in the man pages)

-Create a thread that constantly checks the firing times of the top of the
queue, and if it has passed, will simply call ipq_setverdict with the packet_id 
of the concerned packet, and remove the entry from the queue, and so on ...

Regards,
Oumer


Quoting Joe Clark <joeclark@iastate.edu>:

> Hi.  For a research project, I need to find a way to simulate long
> delays (ie,
> simulating 70ms or so of delay over a typically-1ms delay LAN).  From
> what I've
> seen online, the Netfilter mechanism seems to be the best way to do
> this.  There
> are some Linux packet filtering facilities available with little or no
> work
> (qdisc, tc, etc), but none seem to do the delay that I'm seeking.
> 
> So, from my web search, I would need to write a simple kernel module
> that would
> NF_QUEUE all outgoing packets on a link, and then in user space read the
> packet
> info in, set up a delay-based queuing mechanism, and then dequeue the
> packets
> after the delay and reinject them (NF_ACCEPT via an ioctl?).
> 
> Is that the best method?  I saw something about libipq, which has to do
> with how
> to use the NF_QUEUE framework in userspace.  I also saw a reference that
> said I
> could create a /dev/... device for reading in netfilter queued packets. 
> Which
> is the preferred or current way to do it?
> 
> Thanks for any help you can provide.
> - Joe Clark
> 
> 
> 
> 

