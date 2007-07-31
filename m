From: Michael Gale <michael.gale@pason.com>
Subject: Multiple PPTP connections from same public IP ?
Date: Tue, 31 Jul 2007 15:36:20 -0600
Message-ID: <46AFAB54.5020602@pason.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hey,

	I am running Centos 4.4 fully patched and am having a problem PPTP connections.

Right now the PPTP server is on the public network and is working correctly for connections from all clients. We have a private network from behind a firewall, let's call 
it firewall A. A single client from behind firewall A can connect with out a problem, however if a second client tries to connect from behind firewall A it looks like 
firewall A does not forward the PPP LCP packets.

Am I correct that mutliple GRE (proto 47) tunnels would be a problem when the clients have the same IP address ?

We are running the standard kernel 2.6.9-42.0.3.EL.

Firewall A inside interface:
--snip--
       7 1.905608    client         server         PPTP     Outgoing-Call-Request
       8 1.910061    server         client         PPTP     Outgoing-Call-Reply
       9 1.935465    client         server         TCP      commlinx-avl > pptp [ACK] Seq=325 Ack=189 Win=32120 Len=0
      10 2.844911    client         server         PPTP     Set-Link-Info
      11 2.909621    client         server         PPP LCP  Configuration Request
      12 2.992528    server         client         TCP      pptp > commlinx-avl [ACK] Seq=189 Ack=349 Win=16212 Len=0
      13 5.085418    client         server         PPP LCP  Configuration Request
      14 7.504568    client         server         PPP LCP  Configuration Request
--snip--

Firewall A outside interface:
--snip--
       7 1.905608    firewall A         server         PPTP     Outgoing-Call-Request
       8 1.910061    server         firewall A         PPTP     Outgoing-Call-Reply
       9 1.935465    firewall A         server         TCP      commlinx-avl > pptp [ACK] Seq=325 Ack=189 Win=32120 Len=0
      10 2.844911    firewall A         server         PPTP     Set-Link-Info
      11 2.992528    server         firewall A         TCP      pptp > commlinx-avl [ACK] Seq=189 Ack=349 Win=16212 Len=0
--snip--

-- 
Michael Gale

Red Hat Certified Engineer
Network Administrator
Pason Systems Corp.

