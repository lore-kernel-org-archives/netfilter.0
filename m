From: "Martin Fandel" <pingu.freak@gmx.de>
Subject: MTU Problems using bridge, vlan and iptables netmap
Date: Wed, 09 Feb 2011 13:45:17 +0100
Message-ID: <20110209124517.216910@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I've some problems using the following environment. If I send ping packets with more than 1476 bytes, the environment is not working. This results in incomplete packets, ssh hanging if transferring more than 1406 bytes, and tcpdump issues.

Here is the environment:

Host: natrouter
Interfaces: br0, eth0 (vlan trunk to cisco)
Virtual hosts (via Linux Cotainers LXC): natrouter-n1, natrouter-n2

Host natrouter-n1
Interfaces: eth0.4, 10.10.10.1, vlan 4 to cisco, eth0.2 192.168.1.2, vlan 2 to cisco, 192.168.1.2
Routing: 10.30.0.0/16 via 192.168.1.1
prerouting: in->eth0.2; source 0.0.0.0/0; destination 10.40.0.0/16; netmap to 10.10.0.0/16
postrouting: out->eth0.2; source 10.10.0.0/16; destination 0.0.0.0/0; netmap to 10.40.0.0/16


Host natrouter-n2
Interfaces: eth0.3, 10.10.10.1, vlan 3 to cisco, eth0.2 192.168.1.1, vlan 2 to cisco, 192.168.1.1
Routing: 10.40.0.0/16 via 192.168.1.2
prerouting: in->eth0.2; source 0.0.0.0/0; destination 10.30.0.0/16; netmap to 10.10.0.0/16
postrouting: out->eth0.2; source 10.10.0.0/16; destination 0.0.0.0/0; netmap to 10.30.0.0/16

The host natrouter is patched to a cisco vlan trunk. natrouter-n1 and natrouter-n2 are running in Linux Containers on natrouter. These containers are connected to vlan2, vlan3 and vlan4. vlan2 is the routing environment, where natrouter-n1 and natrouter-n2 routes their destination networks 10.30.0.0/16 and 10.40.0.0/16. behind natrouter-n1 and natrouter-n2 is the network 10.10.0.0/16. So both sides have the same subnet which is natted to 10.30... and 10.40... . Vlan3 is the client-network for natrouter-n1 and vlan4 the client-network for natrouter-n2. So the following environment:

10.10.0.0/16 (customer net) <--- natrouter ---> 10.10.0.0/16 (company net)

... is natted to:

10.30.0.0/16 (customer net) <--- natrouter ---> 10.40.0.0/16 (company net)

So far the theory. It works perfectly, but if I'm sending more than the specified MTU, the connection hangs. All packets lower than the MTU are working fine:

ping -s 1468 10.40.10.10 # works perfectly
ping -s 1469 10.40.10.10 # doesn't work!

I don't know where to debug nor search for. This is my greatest problem. 

It would be very nice if someone can help me to fix this issue.

Thanks!

Regards,

Martin 
-- 
NEU: FreePhone - kostenlos mobil telefonieren und surfen!			
Jetzt informieren: http://www.gmx.net/de/go/freephone
