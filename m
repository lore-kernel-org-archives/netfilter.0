From: "Steffen Heil" <lists@steffen-heil.de>
Subject: complex bridge and nat problem
Date: Mon, 10 Apr 2006 14:10:53 +0200
Message-ID: <00b101c65c97$d1224920$0b4613ac@shs1>
Return-path: <xen-users-bounces@lists.xensource.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.xensource.com/cgi-bin/mailman/listinfo/xen-users>,
	<mailto:xen-users-request@lists.xensource.com?subject=unsubscribe>
List-Post: <mailto:xen-users@lists.xensource.com>
List-Help: <mailto:xen-users-request@lists.xensource.com?subject=help>
List-Subscribe: <http://lists.xensource.com/cgi-bin/mailman/listinfo/xen-users>,
	<mailto:xen-users-request@lists.xensource.com?subject=subscribe>
Sender: xen-users-bounces@lists.xensource.com
Errors-To: xen-users-bounces@lists.xensource.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, ebtables-user@lists.sourceforge.net, xen-users@lists.xensource.com

Hi

I have problems with nat.
My rather complex setup is as follows:

I use a server (running xen), which has two bridges in on linux kernel:
physical eth0 (renamed to peth0) is connected to the first bridge (xenbr0). 
veth0 (renamed to eth0) is connceted to the first bridge (xenbr0).
I call this first bridge the gateway-bridge, it has no ip address.

I call this domain (=VM) my gateway. It has a public ip and is connected to
xenbr0, which is connected to the physical ethernet card, which is connected
to my isps router...

Then I have another bridge (xenbr1), which has a ip-address on it's own in
my $clientnet.
The client domain (=VM) has a virtual network interface which is connected
to that bridge.

So my bridge setup is as:

bridge name     bridge id               STP enabled
- xenbr0          8000.feffffffffff       no
interfaces
- peth0 == physical interface
- vif0.0 == gateways eth0

bridge name     bridge id               STP enabled
- xenbr1          8000.feffffffffff       no
interfaces
- vif22.0 == clients eth0

Finally I have the following SNAT rule (ip4_forward is enabled.)

Chain POSTROUTING (policy ACCEPT 113K packets, 18M bytes)
 pkts bytes target     prot opt in     out     source
destination
   23  1380 SNAT       all  --  *      eth0    $clientnet/24
0.0.0.0/0           to:$gateway

This somehow works:
If I try to reach my outside ssh server (by ip), I get:

GI = Gateway Interface [tcpdump -nni peth0 host $server]
GB = Gateway Bridge [tcpdump -nni xenbr0 host $server]
CI = Client Interface [tcpdump -nni vif22.0 host $server]
CB = Client Bridge [tcpdump -nni xenbr1 host $server]
SI = Server [tcpdump -nni eth0 host $gateway]

CI> 11:40:00.770005 IP $client.2958 > $server.22: S 3227338208:3227338208(0)
win 5840 <mss 1460,sackOK,timestamp 12927453 0,nop,wscale 2>
CB> 11:40:00.770250 IP $client.2958 > $server.22: S 3227338208:3227338208(0)
win 5840 <mss 1460,sackOK,timestamp 12927453 0,nop,wscale 2>
GB> 11:40:00.770416 IP $gateway.2958 > $server.22: S
3227338208:3227338208(0) win 5840 <mss 1460,sackOK,timestamp 12927453
0,nop,wscale 2>
GI> 11:40:00.770571 IP $gateway.2958 > $server.22: S
3227338208:3227338208(0) win 5840 <mss 1460,sackOK,timestamp 12927453
0,nop,wscale 2>
SI> 13:40:01.108827 IP $gateway.2958 > $server.22: S
3227338208:3227338208(0) win 5840 <mss 1460,sackOK,timestamp 12927453
0,nop,wscale 2>
SI> 13:40:01.108863 IP $server.22 > $gateway.2958: S
1070006580:1070006580(0) ack 3227338209 win 5792 <mss 1460,sackOK,timestamp
4101418364 12927453,nop,wscale 2>
GI> 11:40:00.779428 IP $server.22 > $gateway.2958: S
1070006580:1070006580(0) ack 3227338209 win 5792 <mss 1460,sackOK,timestamp
4101418364 12927453,nop,wscale 2>

So the client sends the SYN, the client bridge passes this to the gateway,
the gateway does SNAT and forwards it to the gateway bridge, the gateway
bridge sends this through the physical interface.
The ssh-Server responds with SYN ACK, and this arrives at the gateway's
physical interface. However, it doesn't make it till the first bridge.

I would expect it at leat to reach the gateway bridge and then the gateway.
I even hoped SNAT would do it's job, rewrite the address and forward it to
the client over the client bridge.
But it DOES NEVER reach the gateway bridge.

Can someone tell me, why packets that where SNATed earlier don't make it up
to the gateway bridge?
The gateway itself (and other domains connected to the gateway bridge work
just fine.

Regards,
  Steffen








begin 666 smime.p7s
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
H#@B#:Q-*.C2T$ZG%=V7;04E)U0S]6 ":6_Z332\67G">10``````````
`
end
