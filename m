From: unauthorized@internode.on.net
Subject: problem with hostB wifi0 -> aDSL modem wifi0 -> hostA wifi0 ->
 hostA eth0 -> hostA ppp0 -> aDSL modem bridge --- Not MASQUERADEing...
Date: Mon, 22 Jan 2007 23:32:32 +1100
Message-ID: <20070122233232.6e63e55b@athlon1>
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

Hello,

	I am trying to figure out why my current MASQUERADEing is not working.  It may not even be related to netfilter, but that's why I'm asking.  I might just have missed something (can't think of anything though).  The setup is as follows:

There are 2 switches involved in this network.

Switch1 is a typical netgear 10/100 switch.
Switch2 is built into the wireless aDSL modem.
aDSL modem has 1 wireless interface (172.25.25.100).

hostA is running linux 2.6.17.
hostA has 1 ethernet interface (eth0) via Switch1 (192.168.0.9).
hostA has a psuedo interface for pppoe via eth0.
hostA has 1 wireless interface (ath0) via aDSL modem wifi0 (172.25.25.10).
hostA is the router for all networks.
hostA is the firewall for all network.

hostB is running linux 2.6.17.
hostB has 1 wireless interface (eth1) via aDSL modem wifi0 (172.25.25.99).

hostC is running linux 2.6.17.
hostC has 1 ethernet interface (eth0) via Switch1 (192.168.0.129).


Now to explain the problem.  All traffic from anywhere to anywhere is ACCEPTed (for testing purposes), all traffic out ppp0 is MASQUERADEd.
If I am coming from any 192.168.0.0/24 to anywhere MASQUERADING works just fine.
If I am coming from any 172.25.25.0/24 to 192.168.0.0/24 the connections work just fine.
If I am coming from any 172.25.25.0/24 to anything through ppp0 to anywhere !192.168.0.0/24,!172.25.25.0/24 (eg: external internet site) it does not MASQUERADE.

I can send my rules if need be.  I'll sanitize them with the above IP address layout to make it easier.  I'm not sure if attachments are allowed.  Anyway do I need to do something special (inside or outside) with netfilter / iptables in order to allow traffic from a wifi interface to an ethernet interface (bridge?)?  I can't even run on hostA:
ping -I ath0 <external internet site>
as that fails.

Thanks,

Chris-

