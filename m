From: "Serguei I. Ivantsov" <manowar@gsc-game.kiev.ua>
Subject: NAT support for peer-to-peer games
Date: Tue, 21 Sep 2004 11:04:20 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <00cf01c49fb1$da5492e0$e310f43e@manowar>
Reply-To: "Serguei I. Ivantsov" <manowar@gsc-game.kiev.ua>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello!

I just interesting - whether something changes in Netfilter to support
peer-to-peer games.
How to implement the scheme described below using netfilter?

<from the article>
...
Here's how the hosts know where to send the packets:

1) There is a well-known server with a well-known port, not
behind any NAT or firewall. Its only purpose is to relay
the public and local addresses of all participants in a session
to each other. (A host's public address is the address/ UDP port pair
seen by the outside world; its local address is the pair it
thinks it has.)

2) To join the session, a new host sends its local address
to the well-known server. The server then stores the new
host's public address (from the UDP header) together with its
local address (embedded in the packet).
The list of all participants' public and local addresses are
then sent down to the new host. The new host notes its own public
address in the reply from the server.

3) The server sends the public and local address of the
new host to all existing participants.

4) The new host then sends a hello packet to both the public and
local addresses of each participant; likewise, the existing
participants all send hello packets to both the public and
local addresses of the new host. The packet contains
the sending host's public and local addresses.
These are analogous to TCP's SYN packet, and are retransmitted
periodically if no response is received (see below).

5) The act of sending a packet to the other participants
signals the firewall that a reply will be coming back along
the reverse path. It opens up a return path which just
reverses the source and destination address/ UDP port pairs.
This seems to be a common feature of many firewalls and
SOHO routers (e.g. the Cisco PIX). I don't know how
widespread it is. Is there any data on what firewalls
support this behavior?

6) For participants behind different firewalls / NATs / masquerading
hosts, one packet (the one sent to the peer's public address)
will make it through. For participants behind the same firewall / NAT /
masquerading host, the other packet (the one sent to the peer's
local address) will make it through.
For participants with two IP interfaces, one or the other packet
will make it through; it doesn't matter which.


The entire Dan Kegel article can be found here:

http://www.hasenstein.com/HyperNews/get/linux-ip-nat/97.html

--
 Serguei I. Ivantsov


