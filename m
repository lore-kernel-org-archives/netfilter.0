From: Justin Pryzby <justinpryzby@users.sourceforge.net>
Subject: [ANNOUNCE] Protowatch userspace monitoring for anomalous packets
Date: Thu, 22 May 2003 14:50:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030522185016.GA27208@andromeda>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

See [http://www.sf.net/projects/protowatch/].  I thought this list might
be interested in my use of userland QUEUEing, though such use was
probably not intended by the author of the QUEUE target!

A section from the README file is included.

The interesting lines of code are:

	listen(sock, 1));
	ipq_set_verdict(h, msg->packet_id, NF_ACCEPT, 0,0);
	client=accept(sock, (struct sockaddr *) &addr, &len);

Please Cc: me in all replies, I am not subscribed.

Justin Pryzby

From the README:

Protowatch is a userspace extension to Linux's 2.4 iptables firewalling
code.  It is intended to watch all unanticipated traffic which reaches a
machine.  `iptables -t filter -A INPUT -j QUEUE` will effectively create
a new 'policy' sending all previously-unhandled packets to userspace.
Userspace will dynamically start a server to accept the packet, and log
whatever the client sends.  Useful for discovering what protocols are in use.

Protowatch is intended to allow for easy identification of protocols;
previously, to identify a Gnutella-type connection, the author had to
modify his firewall script to accept connections to TCP:6346, then
manually run a netcat listener.  Protowatch automates this process.

