From: Benny Amorsen <benny+usenet@amorsen.dk>
Subject: ULOG/NFLOG on a non-forwarding machine
Date: Tue, 23 Sep 2008 11:50:07 +0200
Message-ID: <m38wtjur74.fsf@ursa.amorsen.dk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We have a monitor server in place which we use to get flow
information. Currently libpcap-based is in use, but it would be nice
to be able to use ULOG or NFLOG for this.

The challenge is that the monitor-server does not actually forward any
packets. It is connected to a mirror-port on a switch, so that it is
able to see all traffic. However, the traffic does not show up in any
netfilter chains, because no routing or bridging is in place on the
monitor server.

Is there a way to catch incoming traffic which is neither INPUT nor
FORWARD with netfilter?


/Benny


