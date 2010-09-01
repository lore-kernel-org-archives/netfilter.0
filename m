From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Awkward scenario: 3 interfaces and 3 devices with same
 ip/subnet.
Date: Wed, 1 Sep 2010 09:14:26 +0200
Message-ID: <20100901091426.216b1778@catus>
References: <AANLkTik15tix2nxCQfeD=W+t10NuiYLBeSCuYZ8R_2s+@mail.gmail.com>
	<4C7D11F5.1010105@riverviewtech.net>
	<AANLkTinJT4DFyDe6doNKs5PfQs7C23frUGRjC8n_X6UG@mail.gmail.com>
	<4C7D1F05.4050704@riverviewtech.net>
	<AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikfsOHuTwGcs=-wn5+FGXkb8zWynThxxoFRMmia@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Giacomo Bernardi <mino@minux.it>, netfilter@vger.kernel.org

Hi,

Here's the solution for your awkward scenario. It involves using
kvm/qemu guests like in the diagram
http://cat.piasta.pl/awkward_solution.jpeg

After implementing this configuration host system should be able to
access devices on ip addressess 10.(1,2,3).0.3

* Config on v1:

ip addr add 10.0.0.2/24 dev eth1
ip addr add 10.1.0.2/24 dev eth0
ip ro add default via 10.1.0.1
enable ipv4 forwarding

iptables -t nat -A PREROUTING -d 10.1.0.3 -j DNAT --to 10.0.0.1
iptables -t nat -A POSTROUTING -s 10.0.0.1 -j SNAT --to 10.1.0.3

* Config on v2:

ip addr add 10.0.0.2/24 dev eth1
ip addr add 10.2.0.2/24 dev eth0
ip ro add default via 10.2.0.1
enable ipv4 forwarding

iptables -t nat -A PREROUTING -d 10.2.0.3 -j DNAT --to 10.0.0.1
iptables -t nat -A POSTROUTING -s 10.0.0.1 -j SNAT --to 10.2.0.3

* Config on v3:

ip addr add 10.0.0.2/24 dev eth1
ip addr add 10.3.0.2/24 dev eth0
ip ro add default via 10.2.0.1
enable ipv4 forwarding

iptables -t nat -A PREROUTING -d 10.3.0.3 -j DNAT --to 10.0.0.1
iptables -t nat -A POSTROUTING -s 10.0.0.1 -j SNAT --to 10.3.0.3

* Config on host system

start kvms to get tap devices up
ip addr add 10.1.0.1/24 dev tap0
ip addr add 10.2.0.1/24 dev tap2
ip addr add 10.3.0.1/24 dev tap4
brctl addbr br0
ip link set up dev br0
brctl addif br0 tap1
brctl addif br0 eth1
brctl addbr br1
ip link set up dev br1
brctl addif br1 tap3
brctl addif br1 eth2
brctl addbr br2
ip link set up dev br2
brctl addif br1 tap5
brctl addif br1 eth3

echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables


Best regards,
Marek
