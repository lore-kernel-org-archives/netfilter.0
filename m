From: "C Kadziolka" <c_kadziolka@poczta.fm>
Subject: Need help with iptables DNAT on local loopback
Date: Fri, 16 Apr 2004 21:49:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003101c423eb$fe5d2360$0a02a8c0@wacko6tr80mjb7>
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

Hello,

I am having some problems with making iptables work. I have
a standard Slackware 9.0 installation, which is running kernel
2.4.22.

My problem is this, it seems like no matter what iptables
commands i issue, the kernel ignores them and acts as if
i never issued them.

To start with, i would just like to be able to DNAT all connections
from one port to another port, all on the same computer over the
local loopback.

The command i have been using is:
iptables -t nat -A PREROUTING -p tcp -j DNAT --dport 4444 --to-destination
127.0.0.1:23

but I have also tried many variants of this, including trying to use the
REDIRECT option to make all connections go to one port, but to no
avail.

My method of testing if it has worked or not is thus: Since i am trying
to redirect from port 4444 to the telnet port, i try to telnet to port 4444
hoping (maybe wrongly...) that i would get the telnet service.

After this attempt, i also tried the kernel version 2.4.26 with all the
iptables options compiled directly into the kernel. I noticed there that
there was one mentioning support for NAT on the local loopback, so
I compiled that one into the kernel as well. But still, I have the same
results.

If anyone could help me with this, i would be greatly appreciative.

Craig.


Follows is attached some information from various sources on my
computer which should be of help in finding the problem...


output from "iptables -L"

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


output from "iptables -L -t nat"

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere           tcp dpt:krb524
to:127.0.0.1:23

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
loopback        *               255.0.0.0       U     0      0        0 lo

output from "ifconfig"

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:189 errors:0 dropped:0 overruns:0 frame:0
          TX packets:189 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:11227 (10.9 Kb)  TX bytes:11227 (10.9 Kb)


modules loaded:
arp_tables              9132   0 (unused)
iptable_filter          1644   0 (autoclean) (unused)
iptable_nat            15928   1 (autoclean)
ip_conntrack           18120   1 (autoclean) [iptable_nat]
ip_tables              12288   4 [iptable_filter iptable_nat]
snd-pcm-oss            37252   0 (unused)
snd-mixer-oss          11992   0 [snd-pcm-oss]
printer                 7040   0 (unused)
parport_pc             14724   0
parport                23264   0 [parport_pc]
uhci                   24496   0 (unused)
usbcore                58400   1 [printer uhci]
snd-via82xx            11712   0
snd-pcm                55904   0 [snd-pcm-oss snd-via82xx]
snd-timer              13252   0 [snd-pcm]
snd-ac97-codec         37240   0 [snd-via82xx]
snd-page-alloc          6004   0 [snd-via82xx snd-pcm]
snd-mpu401-uart         3136   0 [snd-via82xx]
snd-rawmidi            12512   0 [snd-mpu401-uart]
snd-seq-device          3920   0 [snd-rawmidi]
snd                    27460   0 [snd-pcm-oss snd-mixer-oss snd-via82xx
snd-pcm snd-timer snd-ac97-codec snd-mpu401-uart snd-rawmidi snd-seq-device]
soundcore               3332   3 [snd]
ide-scsi                9424   0
agpgart                39576   0 (unused)





