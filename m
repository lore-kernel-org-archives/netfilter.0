From: "Paulo Bernardo Lindoso" <plindoso@northwoodinformatica.com.br>
Subject: Problems with static NAT -- HELP!
Date: Thu, 23 Jan 2003 16:51:25 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAhnFEp44C0UGuvQhhnk4A7MKAAAAQAAAAM3uWJW4zm0SG+Dh6a277PwEAAAAA@northwoodinformatica.com.br>
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

I am running a linux box as a firewall using Iptables;

Roughly, my config is as follows:

             +-------------+
INTERNET ----| eth0    eth1|----- INTERNAL NETWORK
     (Public)|      eth2   | (10.x.y.z/8)
             +-------------+
                     |(172.16.a.b/16)
                     |
                  ADMIN NETWORK

The catch is that my box needs to be configured to NAT a number of
internal network's addresses to the internet.  An example follows:

200.a.b.c  --NAT--> 10.x.y.z (and vice-versa)

I configured a virtual interface for each IP that needs to be NAT'ed,
but it doesn't seem to be working.   For example:

eth0:0    Link encap:Ethernet  HWaddr 00:80:48:D6:66:1A
          inet addr:200.a.b.c  Bcast:200.a1.b1.c1  Mask:255.255.255.240
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          Interrupt:11 Base address:0x3e80

NAT Tables
(PREROUTING)
70509 5590K DNAT       all  --  eth0   *       0.0.0.0/0
200.a.b.c      to:10.10.50.2
(POSTROUTING)
17699 1321K SNAT       all  --  *      eth0    10.10.50.2
0.0.0.0/0          to:200.a.b.c

The FORWARD chain was also configured accordingly.

Everything was running smoothly until yesterday, when the whole thing
stopped.  I managed to create an alternate route to bring the system
back online again, but I have no idea of what's going on since nothing
was changed in the box.

TCPDUMP output demonstrates the problem clearly:

Eth0 output (filtered):
[root@fwlnx /etc]# tcpdump -i eth0 src host my.host.com and port 3200
tcpdump: listening on eth0
15:43:22.922086 my.host.com.2423 > 200.a.b.c.3200: S
2260930976:2260930976(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
15:43:25.896422 my.host.com.2423 > 200.a.b.c.3200: S
2260930976:2260930976(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
15:43:31.919085 my.host.com.2423 > 200.a.b.c.3200: S
2260930976:2260930976(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)

Eth1 output (filtered):
[root@fwlnx /root]# tcpdump -i eth1 src host my.host.com and port 3200
tcpdump: listening on eth1
15:43:22.922191 my.host.com.2423 > 200.a.b.c.3200: S
2260930976:2260930976(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
15:43:25.896527 my.host.com.2423 > 200.a.b.c.3200: S
2260930976:2260930976(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)
15:43:31.919190 my.host.com.2423 > 200.a.b.c.3200: S
2260930976:2260930976(0) win 16384 <mss 1460,nop,nop,sackOK> (DF)

Packets on the eth1 side should have been NAT'ed to 10.x.y.z...

Any ideas??

TIA
Paulo.


