From: "Raghavan, Srihari" <srihari.raghavan@viasat.com>
Subject: iptables v1.2.1a - packets not reaching tun(0) from eth0 interfac
	e
Date: Mon, 21 Oct 2002 15:37:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B370C63B487FD51196760002557CEABA3CD962@courier.vmd.viasat.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi all,

I have a linux machine that needs to catch TCP packets (not meant for
itself) that come on its eth0 interface and pass it on to tun0 interface
(through the TUN/TAP driver). I am using Linux 2.4.12 kernel.

1. I use the following iptables/ip rules commands after opening the tun
device:

system("ip addr add 172.17.27.18 peer 10.99.99.99 dev tun0");
system("ip link set dev tun0 up");
system("iptables -t mangle -A PREROUTING -d 172.17.27.0/24 -j ACCEPT");
system("iptables -t mangle -A OUTPUT -d 172.17.27.0/24 -j ACCEPT");
system("iptables --verbose -t mangle -A PREROUTING -i eth0 -p tcp \
        -d 0.0.0.0/0 -j MARK --set-mark 1");
system("iptables -t mangle -A OUTPUT -p tcp -d 0.0.0.0/0 -j MARK \
        --set-mark 1");
system("ip rule add fwmark 1 table 200");
system("ip route add default dev tun0 table 200");

2. IFCONFIG output

$ ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:02:B3:3D:81:B3
          inet addr:172.17.27.18  Bcast:172.17.27.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:20280520 errors:9 dropped:0 overruns:7 frame:0
          TX packets:4162258 errors:0 dropped:0 overruns:0 carrier:3691
          collisions:298147 txqueuelen:100
          Interrupt:10
...

tun0      Link encap:Point-to-Point Protocol
          inet addr:172.17.27.18  P-t-P:10.99.99.99  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10

3. IPRULE list
$ ip rule list
0:      from all lookup local
32765:  from all fwmark        1 lookup 200
32766:  from all lookup main

4. IP ROUTE output
$ ip route show table 200
default dev tun0  scope link

$ ip route show table local
broadcast 172.17.27.255 dev eth0  proto kernel  scope link  src 172.17.27.18
broadcast 127.255.255.255 dev lo  proto kernel  scope link  src 127.0.0.1
broadcast 192.168.20.255 dev eth1  proto kernel  scope link  src
192.168.20.82
broadcast 172.17.27.0 dev eth0  proto kernel  scope link  src 172.17.27.18
local 172.17.27.18 dev eth0  proto kernel  scope host  src 172.17.27.18
broadcast 192.168.20.0 dev eth1  proto kernel  scope link  src 192.168.20.82
local 192.168.20.82 dev eth1  proto kernel  scope host  src 192.168.20.82
broadcast 127.0.0.0 dev lo  proto kernel  scope link  src 127.0.0.1
local 127.0.0.1 dev lo  proto kernel  scope host  src 127.0.0.1
local 127.0.0.0/8 dev lo  proto kernel  scope host  src 127.0.0.1


$ ip route show table main
192.168.20.0/24 dev eth1  proto kernel  scope link  src 192.168.20.82
172.17.27.0/24 dev eth0  proto kernel  scope link  src 172.17.27.18
127.0.0.0/8 dev lo  scope link
default via 172.17.27.1 dev eth0


5. I try to send the machine some TCP telnet packets from 172.17.27.77 m/c
TCPDUMP output:

$ tcpdump -i eth0 dst host 134.133.33.22 and src host 172.17.27.77
Kernel filter, protocol ALL, datagram packet socket
tcpdump: listening on eth0

17:39:27.658294 < 172.17.27.77.2996 > 134.133.33.22.telnet: 
S 3023850874:3023850874(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
17:39:30.913925 < 172.17.27.77.2996 > 134.133.33.22.telnet: 
S 3023850874:3023850874(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
17:39:37.476235 < 172.17.27.77.2996 > 134.133.33.22.telnet: 
S 3023850874:3023850874(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)


The ifconfig -a output at the end, still shows no packets got at tun0
interface even though eth0 gets packets as shown above.

Any clues?

Thank you for your time
Srihari

