From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Channel bonding and IRQ affinity
Date: Wed, 02 Jun 2004 20:53:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086202435.21053.11.camel@axl.seasidesoftware.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


With the 2.6 kernel, it seems that a single CPU is used to service a
single NIC.  I've read a paper on NAPI that explains why this is done,
and that makes sense.

However, it does mean you can't scale a Linux box horizontally (i.e.
more CPUs) to increase its maximum loss-free forwarding rate.

So I'm thinking of getting a couple of 4-port cards and using channel
bonding to produce two bonded interfaces, each serviced by 4 ports.

But I worry. :-)

Will the code path from packet receipt, through Netfilter, and up to
packet transmission fix one bonded interface to a single CPU, or is the
limitation that only one CPU is used to service a single physical NIC?

Thanks,
Sheldon.


