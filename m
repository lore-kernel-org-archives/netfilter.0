From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: Re: VPN Issue - help
Date: Tue, 6 May 2003 20:45:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c313cd$662b19f0$6400a8c0@homes>
References: <006c01c31357$a1565ce0$6400a8c0@homes> <200305061135.30694.lyra@fastwebnet.it>
Reply-To: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
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
To: xchris <lyra@fastwebnet.it>, netfilter@lists.netfilter.org

Hi Chris,

Here's my configuration:

##################################
"/etc/pptpd.conf"
option /etc/ppp/options.pptpd
localip 192.168.0.10
remoteip 192.168.0.180-200
##################################

"/etc/ppp/options.pptpd"
lock
proxyarp
auth
mppe-40
mppe-128
mppe-stateless
require-chapms-v2
ms-dns 192.168.0.10
ms-dns 206.172.11.21
netmask 255.255.255.0
##################################

"ifconfig - VPN Client connected"

ppp0 (206.163.247.9) = public IP
eth0 (192.168.0.10) = private IP (192.168.0.0/24)

eth0      Link encap:Ethernet  HWaddr 00:40:D0:09:83:6F
          inet addr:192.168.0.10  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:456067 errors:0 dropped:0 overruns:0 frame:14190
          TX packets:445109 errors:0 dropped:0 overruns:1 carrier:13205
          collisions:16678 txqueuelen:100
          RX bytes:225854445 (215.3 Mb)  TX bytes:196873356 (187.7 Mb)
          Interrupt:9

ppp0      Link encap:Point-to-Point Protocol
          inet addr:206.163.247.9  P-t-P:206.163.246.1  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:327124 errors:0 dropped:0 overruns:0 frame:0
          TX packets:253529 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:207103245 (197.5 Mb)  TX bytes:31867835 (30.3 Mb)

ppp1      Link encap:Point-to-Point Protocol
          inet addr:192.168.0.10  P-t-P:192.168.0.180  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
          RX packets:29 errors:0 dropped:0 overruns:0 frame:0
          TX packets:15 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:2392 (2.3 Kb)  TX bytes:259 (259.0 b)
##################################
"route -n"
Destination          Gateway           Genmask         Flags Metric Ref
Use Iface
206.163.246.1    0.0.0.0             255.255.255.255 UH    0      0        0
ppp0
192.168.0.180    0.0.0.0             255.255.255.255 UH    0      0        0
ppp1
192.168.0.0        0.0.0.0             255.255.255.0   U     0      0
0 eth0
127.0.0.0            0.0.0.0             255.0.0.0       U     0      0
0 lo
0.0.0.0                206.163.246.1 0.0.0.0         UG    0      0        0
ppp0
##################################







----- Original Message -----
From: "xchris" <lyra@fastwebnet.it>
To: <netfilter@lists.netfilter.org>
Cc: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Sent: Tuesday, May 06, 2003 5:35 PM
Subject: Re: VPN Issue - help


On Tuesday 06 May 2003 00:42, Voltaire Pascual wrote:
> repost:
>
> Clients can connect to the VPN server w/o any problem. Private network is
> 192.168.0.0/24. VPN server IP is
>
> Public (ppp0) = 203.x.x.x
> Private (eth0) = 192.168.0.10
>> When client is connected to the VPN server, it can ping the VPN but not
the
> other machines in the network. Client IP when connected is
> 192.168.0.80/255.255.255.255. clients can surf the net after they are
> connected but cannot see other machines inside the network.
>
> ###########################
> other config:
> net.ipv4.ip_forward = 1
> net.ipv4.conf.eth0.proxy_arp = 1
>
> ###########################
> client is connected to the VPN. here's the result of ifconfig:
>
> ppp1      Link encap:Point-to-Point Protocol
>           inet addr:192.168.0.10  P-t-P:192.168.0.80  Mask:255.255.255.255
>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
>           RX packets:18 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:3
>           RX bytes:1062 (1.0 Kb)  TX bytes:147 (147.0 b)
> ###########################
> route -n
>
> 192.168.0.180   0.0.0.0         255.255.255.255 UH    0      0        0
> ppp1 ###########################
>
>
> What could be the problem? What iptables rule should i do.



from route -n
you should have
192.168.0.0      0.0.0.0         255.255.255.0   U     0      0        0
eth(?)

not 192.168.0.180/32
what is .180?


maybe you should post your ifconfig (complete) and route -n (complete) and
maybe your pptpd.conf

bye


