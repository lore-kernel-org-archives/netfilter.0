From: "louie miranda" <lmiranda@chikka.com>
Subject: 2 internet link problem (forwarding help i think?)
Date: Fri, 13 Dec 2002 16:36:28 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003301c2a282$babc5c70$0b00000a@nocpc3>
References: <000001c2a212$a0f05050$0401000a@robbysan.org> <3DF98B3D.5010104@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi things i have to clear first!

DEFAULT GATEWAY = 203.100.100.1
MACHINE's (primary) IP = 203.100.100.2 - NIC1
MACHINE's (secondary) IP = 203.100.100.3 - NIC2
MASQ BLOCK = 10.0.0.0/16 - NIC3

I have 3 NIC Cards, My only problem is i want to route all my MASQ BLOCK
that when they
access IP BLOCK 203.100.200.0/24 they will come out on NIC2 (Secondary IP of
my machine)
And all other packets to its default route.

Is this possible? Im currently mixed up also when i tried to add the `route`
on linux when i ping
that ip, the secondary IP will not work anymore but my default route to NIC1
will be still the same.

Its like this, I can access 203.100.100.3 (Im not yet adding my secondary
ip/route) When i add
my secondary ip/route 203.100.100.3 "ifconfig eth2 203.100.100.3 netmask
255.255.255.240 up"
I can no longer access 203.100.100.3 But all of my other connections are
working except for that.

my kernel routing table after adding.. (not real ip's)

panic:/# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
203.100.100.*  0.0.0.0         255.255.255.248 U     0      0        0 eth0
203.100.100.*  0.0.0.0         255.255.255.240 U     0      0        0 eth2
10.0.0.0        0.0.0.0         255.255.0.0     U     0      0        0 eth1
0.0.0.0         203.100.100.1  0.0.0.0         UG    0      0        0 eth0


Hope someone can help!


--
thanks,
louie miranda




--
thanks,
louie miranda



