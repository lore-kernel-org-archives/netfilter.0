From: Alan Stern <stern@rowland.harvard.edu>
Subject: [BUG] SNAT allows packets through when it shouldn't
Date: Mon, 9 Feb 2009 17:09:45 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.0902091648460.29419-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm seeing some strange behavior on my firewall, which is running
Fedora 8's version of the 2.6.26.6 kernel.  Packets with private source
addresses are sometimes leaking out through the public interface.

This seems to happen only with TCP packets and when the kernel has 
reason to think the connection has been closed.  For example:

	Internal host A (using a private address) connects to
	external host B.  The firewall applies SNAT to the
	connection.

	Data goes back and forth.

	Host B sends a FIN packet, which is ACKed by host A.

	Host A sends a FIN packet but there's no response from
	host B.  Nevertheless, the conntrack code seems to believe
	the connection is closed.

	A few seconds later, host A resends the FIN packet.  This
	sails through the filtering and connection-tracking routines
	completely unscathed, and is sent out the public interface
	with host A's private source address.

(I sometimes see the same sort of thing happening with TCP RESET 
packets.)

Now, this looks like a bug in the SNAT implementation.  If the kernel
has erased its record of the connection then it should apply a new SNAT
transformation to the FIN packet.  Or, if the kernel is smart enough to
realize that a non-SYN packet can't be the start of a new connection,
then it should drop the packet entirely.  Under no circumstances should
the packet be passed through unchanged.

Is this a known problem?  Has it been fixed in later kernel versions?  

Could it be the result of a mistake in the firewall's iptables setup?
For reference, here is a lightly-edited extract from my iptables 
script:


OUTIP=... #the IP address of the firewall's public interface "net1"
iptables -t nat -N startnat
iptables -t nat -A startnat -p tcp -j SNAT --to-source $OUTIP:7000-65500
iptables -t nat -A startnat -p udp -j SNAT --to-source $OUTIP:7000-65500
iptables -t nat -A startnat -j DROP

iptables -t nat -A POSTROUTING -o net1 -s 10.0.0.0/8 -j startnat


Thank you,

Alan Stern

