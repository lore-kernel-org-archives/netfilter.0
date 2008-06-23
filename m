From: Francois Goudal <fg@satcom1.com>
Subject: NAT issue on a machine with both routing and bridging.
Date: Mon, 23 Jun 2008 16:22:21 +0200
Message-ID: <485FB19D.9080908@satcom1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I need to make a quite special setup today and I'm running in trouble at 
some point :
I'm running a software that does TCP PEP (Performance Enhancement Proxy) 
on a machine with 2 NICs. Basically, this machine can be considered as a 
bridge (except that all the TCP traffic is converted to another 
protocol, but all the rest like UDP or ICMP is simply going through 
without being altered)
My setup also requires a NAT gateway that does masquerading.
This works fine with 2 separate boxes, one doing the PEP, and the other 
doing the NAT gateway, and one crossover cable between them.
But now I have a challenge : all this should fit in one single box.

So I decided to use virtual machines, like Xen (I tried UML as well, so 
my problem is not related to Xen specifically).

Here is the basic test setup I have :

................                                     ................
.    HOST A    .                                     .    HOST D    .
. 10.168.254.1 .                                     . 172.16.33.10 .
................                                     ................
   |                                                               |
   |                                                               |
   |                                                               |
   | eth1                                                     eth0 |
.....................................................................
. |0.0.0.0                                                0.0.0.0 | .
. |__________________________________             ________________| .
.                                    |           |                  .
............................         |_ br0      |                  .
.                     eth0 . vif1.0  |  0.0.0.0  |                  .
. XEN VM          _________._________|           |                  .
. HOST B         | 0.0.0.0 . 0.0.0.0             |                  .
.                |         .                     |_ br2             .
.           br0 _|         .                     |  172.16.33.200   .
. 10.168.254.51  |    eth1 . vif1.1              |        ^         .
.                |_________._________                     |         .
.                  0.0.0.0 . 0.0.0.0 |                    | Routing .
............................         |_ br1               | + DNAT  .
.                                    |  10.168.254.250 <--'         .
.                                    |                              .
.        HOST C                                                     .
.....................................................................

Hosts A and D are here to test the stuff in host C+B.

Host C is a Xen Host machine that contains one Xen VM for the PEP stuff 
and which is responsible for the masquerading of packets.

Host B is a Virtual machine running on Host C which runs the PEP software.


As you can see, the 2 NICs of the Host C are running without an IP 
address but they are up and they are part of bridge interfaces.
eth1 is bridged together with vif1.0 (which corresponds to eth0 in the 
HOST B) so that the eth1 of Host C can be considered as the eth0 of 
HostB, so basically, all the traffic on eth1 of the Host C is going 
to/coming from the Host B (the VM).
Since the Host B can be considered as a bridge, or just simply, a wire, 
all this traffic gets out on eth1 of Host B, so back in the Host C as 
vif1.1, which is part of a bridge which has an IP address : 10.168.254.250
This works fine, Host A can ping 10.168.254.250 (Host C) and we can see 
the traffic going through Host B with tcpdump.
So it's like if there was no PEP stuff and eth1 had the IP address 
10.168.254.250.
Now as you can see, on eth0 of Host C, we have a bridge with the IP 
address 172.16.33.200. Host D can ping this IP address.
So we have both sides able to ping the gateway.
But now, I want Host A to be able to reach Host D through hosts C+B.

Regarding the routes : Host A has 10.168.254.250 (Host C) as a default 
route, so when Host A wants to reach Host D, it sends the packets to 
Host C+B.

Then, I tried to setup a route on Host D so that traffic to the subnet 
10.168.254.0 goes through 172.16.33.200 and this works, Host A can 
successfuly ping Host D.

But now, I want to get rid of the need of a special route on host D, so 
I want to setup DNAT/Masquerade on the Host C.

Therefore, I have done this :

iptables -t nat -A POSTROUTING -o xenbr0 -j MASQUERADE

But when I ping D on A, and I look at what D receives, I can see the 
real IP address of A, instead of the IP address of C (172.16.33.200)

I tried to do this as well :

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

But this doesn't solve my problem.

Now, as a final test, I tried to ping host D from host B (the VM) and in 
this case, I get masqueraded packets, with this rule :

iptables -t nat -A POSTROUTING -o xenbr0 -j MASQUERADE

So I suspect that on Host C, the packets that comes in the eth1 NIC are 
not just forwarded to the VM by the bridge, but detected somehow by the 
network stack and forwarded to eth0 (by some layer2 code ?) without 
being masqueraded, then.

I have been working on trying to solve this during 2 days now but still 
I can't find a solution.

Can anyone have a quick look and hopefully provide me an explaination 
and maybe some help to find a solution ?

Best regards,

-- 
Francois Goudal
Satcom1

