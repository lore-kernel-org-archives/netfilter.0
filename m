From: "Dan Flett" <conhoolio@hotmail.com>
Subject: Exit interface of packets in QUEUE
Date: Tue, 22 Feb 2005 23:01:36 +1100
Message-ID: <BAY16-DAV6BA9AF411ACCCFCF3CE0EAF620@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi all,

I'm helping out with the development of a wireless traffic QoS application
that uses the QUEUE target.  I'm looking for a way for the userspace
application to be able to discriminate between packets in the QUEUE based on
their outgoing network interface.

At first I thought that putting packets from the POSTROUTING chain into the
QUEUE would allow me to see their "hw_addr" and I would be able to tell
their exit interface based on their source MAC address.  Reading up some
more tells me that packets in the POSTROUTING chain don't have their
(outgoing) Ethernet headers on them, so the "hw_addr" will be blank.

Can anyone suggest a possible way to do this?  I've thought of reading a
packets' destination IP address and then doing a lookup of the routing table
- but this seems messy and I don't like it.  I'd really like to be able to
read the source MAC of an outgoing packet (in the QUEUE), but as far as I
can tell this is beyond the reach of iptables.

An alternate way to do what I want to do is setup a separately controllable
QUEUE for each interface - but again, as far as I can tell, this capability
doesn't exist.

Any suggestions are welcome...

Cheers,

Dan

