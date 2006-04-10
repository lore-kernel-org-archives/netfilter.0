From: "Eric Low" <elow-zz35LlRFFRJWk0Htik3J/w@public.gmane.org>
Subject: RE: complex bridge and nat problem
Date: Mon, 10 Apr 2006 13:10:41 -0400
Message-ID: <99D454BB14CE494BB2CBCD9846F45C3DFAA5EB@mailserver.datastat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
content-class: urn:content-classes:message
Sender: ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Errors-To: ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=ebtables-user>
Content-Type: text/plain; charset="us-ascii"
To: Steffen Heil <lists-97Gl/RufXAk0ccujo2y7rA@public.gmane.org>, netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org, ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, xen-users-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org

Steffen,

Do you have the proper rules in place to make the firewall stateful?  =
For example:

 iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Also, can you see the reply packets with a logging rule on the Gateway =
Bridge?  Someplace early... like the mangle prerouting or nat prerouting =
chain.  If I recall, the packets should still appear to have the =
translated address (as the destination on the reply) all the way through =
the chains.  But don't quote me on it.  Anyhow, if iptables can see the =
packets there, you can narrow down where to look.  Put in logging rules =
on each chain and see where it dies.

Here's what I think is happening... I think that because you're double =
bridging, your Gateway Bridge does not know where to route the packets =
back to.  I know that doesn't make a lot of sense with a bridge, but =
you're obviously not doing straight bridging when you SNAT.  From =
experience, it seems that iptables will just drop the packet in certain =
NAT'ing circumstances if it doesn't have either an ARP entry or a =
ROUTE... or possibly both.

Try the following things:
1) Double SNAT - SNAT on the first bridge, then SNAT again on the =
second.
2) Add an alias from the client subnet to xenbr0 (xenbr0:0)
3) Check your routing table and try adding routes to the appropriate =
subnets (a route to the client subnet through vif0.0).

Hope this helps.  I've tried to do a lot of weird NAT'ing like this in =
the past, but it's been a while.

Eric


-----Original Message-----
From:	ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org on behalf of Steffen =
Heil
Sent:	Mon 4/10/2006 8:10 AM
To:	netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org; ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org; =
xen-users-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org
Cc:=09
Subject:	[Ebtables-user] complex bridge and nat problem

Hi

I have problems with nat.
My rather complex setup is as follows:

I use a server (running xen), which has two bridges in on linux kernel:
physical eth0 (renamed to peth0) is connected to the first bridge =
(xenbr0).=20
veth0 (renamed to eth0) is connceted to the first bridge (xenbr0).
I call this first bridge the gateway-bridge, it has no ip address.

I call this domain (=3DVM) my gateway. It has a public ip and is =
connected to
xenbr0, which is connected to the physical ethernet card, which is =
connected
to my isps router...

Then I have another bridge (xenbr1), which has a ip-address on it's own =
in
my $clientnet.
The client domain (=3DVM) has a virtual network interface which is =
connected
to that bridge.

So my bridge setup is as:

bridge name     bridge id               STP enabled
- xenbr0          8000.feffffffffff       no
interfaces
- peth0 =3D=3D physical interface
- vif0.0 =3D=3D gateways eth0

bridge name     bridge id               STP enabled
- xenbr1          8000.feffffffffff       no
interfaces
- vif22.0 =3D=3D clients eth0

Finally I have the following SNAT rule (ip4_forward is enabled.)

Chain POSTROUTING (policy ACCEPT 113K packets, 18M bytes)
 pkts bytes target     prot opt in     out     source
destination
   23  1380 SNAT       all  --  *      eth0    $clientnet/24
0.0.0.0/0           to:$gateway

This somehow works:
If I try to reach my outside ssh server (by ip), I get:

GI =3D Gateway Interface [tcpdump -nni peth0 host $server]
GB =3D Gateway Bridge [tcpdump -nni xenbr0 host $server]
CI =3D Client Interface [tcpdump -nni vif22.0 host $server]
CB =3D Client Bridge [tcpdump -nni xenbr1 host $server]
SI =3D Server [tcpdump -nni eth0 host $gateway]

CI> 11:40:00.770005 IP $client.2958 > $server.22: S =
3227338208:3227338208(0)
win 5840 <mss 1460,sackOK,timestamp 12927453 0,nop,wscale 2>
CB> 11:40:00.770250 IP $client.2958 > $server.22: S =
3227338208:3227338208(0)
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
1070006580:1070006580(0) ack 3227338209 win 5792 <mss =
1460,sackOK,timestamp
4101418364 12927453,nop,wscale 2>
GI> 11:40:00.779428 IP $server.22 > $gateway.2958: S
1070006580:1070006580(0) ack 3227338209 win 5792 <mss =
1460,sackOK,timestamp
4101418364 12927453,nop,wscale 2>

So the client sends the SYN, the client bridge passes this to the =
gateway,
the gateway does SNAT and forwards it to the gateway bridge, the gateway
bridge sends this through the physical interface.
The ssh-Server responds with SYN ACK, and this arrives at the gateway's
physical interface. However, it doesn't make it till the first bridge.

I would expect it at leat to reach the gateway bridge and then the =
gateway.
I even hoped SNAT would do it's job, rewrite the address and forward it =
to
the client over the client bridge.
But it DOES NEVER reach the gateway bridge.

Can someone tell me, why packets that where SNATed earlier don't make it =
up
to the gateway bridge?
The gateway itself (and other domains connected to the gateway bridge =
work
just fine.

Regards,
  Steffen



-------------------------------------------------------
This SF.Net email is sponsored by xPML, a groundbreaking scripting language
that extends applications into web and mobile media. Attend the live webcast
and join the prime developer group breaking into this new coding territory!
http://sel.as-us.falkag.net/sel?cmd=lnk&kid=110944&bid=241720&dat=121642
