From: "Steve Melo" <lists@communitytrust.ca>
Subject: udp connection tracking
Date: Tue, 17 May 2005 11:35:55 -0400
Message-ID: <005b01c55af6$1db40980$3c01a8c0@ts.communitytrust.ca>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

greetings list,

I'm having a problem with a particular online game, winning eleven soccer 8.
I need some kind of udp connection tracking and non of the helper modules
seem to help.
Firstly I'll describe what happens during the initial connection between the
server and client:

1.) first the client will choose any random port over 1064 to use for the
outgoing connection, lets use 1379 for this example.
2.) the client will send a udp packet from port 1379 to the listening port
on the server which is always 5739.
3.) the server receives the packet, then chooses a random available port of
its own, lets use 1184 for this example.
4.) the server sends a single udp packet with a src port of 1184 to the dst
port 1379 of the client.
5.) after this single packet described in step 4, all the traffic between
the client and server happen between ports 2222 and 5739.

Here is an illustrated example


 IP CLIENT.1379 > HOST.5739: UDP, length: 64
 IP HOST.1184 > CLIENT.1379: UDP, length: 84 ** this is the troublesome
packet **
 IP HOST.5739 > CLIENT.1379: UDP, length: 60
 IP HOST.5739 > CLIENT.1379: UDP, length: 60
 IP CLIENT.1379 > HOST.5739: UDP, length: 60
 IP HOST.5739 > CLIENT.1379: UDP, length: 60
 IP CLIENT.1379 > HOST.5739: UDP, length: 16
 IP HOST.5739 > CLIENT.1379: UDP, length: 60
 IP CLIENT.1379 > HOST.5739: UDP, length: 60
 IP HOST.5739 > CLIENT.1379: UDP, length: 60
 IP CLIENT.1379 > HOST.5739: UDP, length: 60

Now, my problem is when i want to connect as a client, i have no way of
knowing what port the server will choose to send that single packet (step 4
above).  I also can't guess what port my client will use (step 1 above). All
the other packets are fine because i can always expect a src or dst port
with 5739.  This single packet is causing all my connection attempts to
fail.

Is there anything i can try besides forwarding all udp traffic to the
client?

Thank you,

steve



