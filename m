From: Victor Toni <netfilter-list@kromo.org>
Subject: Re: Howto access modem behind router
Date: Thu, 26 Oct 2006 18:20:00 +0200
Message-ID: <4540E030.1070404@kromo.org>
References: <453D34CD.904@kromo.org> <453E55FF.7000705@kromo.org>
	<f4a92e196d29239919190685a041d19d@former03.de>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f4a92e196d29239919190685a041d19d@former03.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

former03 | Baltasar Cevc wrote:
> On 24.10.2006, at 20:05, Victor Toni wrote:
>> Victor Toni wrote:
>>> I have one of these modems which is a router by itself. The modem is
>>> configured to work in bridged mode.
>>> Connected to the modem is a router which connects via pppoe via the
>>> modem with my ISP.
>>>
>>>    |<---------- PPPOE link ------------->|
>>>    |                                     |    |======
>>>   ISP ======= bridged ================= WRT ========= PCs
>>>                modem |                 |   |  |======
>>>                      |                 |   |
>>>                      |<- 169.254.1.x ->|   |<-- 192.168.1.x -->>
>>>
>>>
>>>
>>> The modem has a web interface and and telnet which I would like to
>>> connect to from within the LAN but this doesn't seem to work.

Base on the article above I tried this:

/usr/sbin/iptables -I POSTROUTING -t nat -o vlan1 -d 169.254.0.0/16 -j
MASQUERADE

(as you seem to speak German, here is the German article which uses the
(seemingly) same config
http://wiki.mhilfe.de/index.php/Modem_%C3%BCber_Router_auslesen
)

>>> I have currently some trouble with my connection and would like to
>>> use a
>>> tool to monitor the modem's error status but this fails due to the
>>> configuration.
>>> The modem has the static IP 169.254.1.1 and the router has the static
>>> IPs 169.254.1.100 and 192.168.1.1.
>>> I can ping "169.254.1.100" from any LAN machine on 192.168.1.0/24 but
>>> that's it.
>
> You should provide the relevant rulesets (iptables -L -v;
> iptables -L -v -t nat). If you can ping the modem from a client
> in the LAN, the routing seems to be working, as well as the
> NAT (if needed).
> You'll probably have to add some rule to the forwarding filter; but
> that's impossible to tell without knowing your current setup.
>
> While I don't think that's the problem, just a little warning: the
> IPs on the modem segment are from the linklocal net, and are not
> meant to be routed - see RFC 3927: "[...]valid for communication
> with other devices connected to the same physical (or logical) link".
It seems that people got this to work with a config similar to mine
although I don't know exactly where it doesn't get through.
I can ping the modem from the router (WRT) but not from any other
machine. It can see the packet count go up in the router when I try to
ping the router from a LAN machine but that's it.
Below are the rulesets.

Thanks for your response.

Victor

--------------------------------------------------------------------------------------------------------------


~ # iptables -nvL
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source              
destination
   51  4649 ACCEPT     all  --  *      *       0.0.0.0/0           
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 DROP       udp  --  ppp0   *       0.0.0.0/0           
0.0.0.0/0           udp dpt:520
    0     0 DROP       udp  --  br0    *       0.0.0.0/0           
0.0.0.0/0           udp dpt:520
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0           
0.0.0.0/0           udp dpt:520
   16  1101 DROP       icmp --  ppp0   *       0.0.0.0/0           
0.0.0.0/0
    2    64 DROP       2    --  *      *       0.0.0.0/0           
0.0.0.0/0
    0     0 ACCEPT     all  --  lo     *       0.0.0.0/0           
0.0.0.0/0           state NEW
    3   324 logaccept  all  --  br0    *       0.0.0.0/0           
0.0.0.0/0           state NEW
  181 13713 DROP       all  --  *      *       0.0.0.0/0           
0.0.0.0/0

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 ACCEPT     47   --  *      ppp0    192.168.1.0/24      
0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      ppp0    192.168.1.0/24      
0.0.0.0/0           tcp dpt:1723
    0     0 ACCEPT     all  --  br0    br0     0.0.0.0/0           
0.0.0.0/0
    0     0 logdrop    all  --  *      *       0.0.0.0/0           
0.0.0.0/0           state INVALID
  772 37084 TCPMSS     tcp  --  *      *       0.0.0.0/0           
0.0.0.0/0           tcp flags:0x06/0x02 tcpmss match 1453:65535 TCPMSS
set 1452
38579   10M lan2wan    all  --  br0    *       0.0.0.0/0           
0.0.0.0/0
73474   31M ACCEPT     all  --  *      *       0.0.0.0/0           
0.0.0.0/0           state RELATED,ESTABLISHED
  191  9339 ACCEPT     tcp  --  *      *       0.0.0.0/0           
192.168.1.13        tcp dpt:4662
   51  3578 ACCEPT     udp  --  *      *       0.0.0.0/0           
192.168.1.13        udp dpt:4672
    0     0 TRIGGER    all  --  ppp0   br0     0.0.0.0/0           
0.0.0.0/0           TRIGGER type:in match:0 relate:0
 4695  366K trigger_out  all  --  br0    *       0.0.0.0/0           
0.0.0.0/0
 4695  366K ACCEPT     all  --  br0    *       0.0.0.0/0           
0.0.0.0/0           state NEW
    0     0 DROP       all  --  *      *       0.0.0.0/0           
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 54 packets, 11482 bytes)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_1 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_10 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_2 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_3 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_4 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_5 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_6 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_7 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_8 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain advgrp_9 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_1 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_10 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_2 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_3 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_4 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_5 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_6 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_7 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_8 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain grp_9 (0 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain lan2wan (1 references)
 pkts bytes target     prot opt in     out     source              
destination

Chain logaccept (1 references)
 pkts bytes target     prot opt in     out     source              
destination
    3   324 ACCEPT     all  --  *      *       0.0.0.0/0           
0.0.0.0/0

Chain logdrop (1 references)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 DROP       all  --  *      *       0.0.0.0/0           
0.0.0.0/0

Chain logreject (0 references)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0           
0.0.0.0/0           tcp reject-with tcp-reset

Chain trigger_out (1 references)
 pkts bytes target     prot opt in     out     source              
destination

--------------------------------------------------------------------------------------------------------------

~ # iptables -nvL -t nat
Chain PREROUTING (policy ACCEPT 5306 packets, 370K bytes)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 DNAT       icmp --  *      *       0.0.0.0/0           
84.62.187.36        to:192.168.1.1
  290 14143 DNAT       tcp  --  *      *       0.0.0.0/0           
84.62.187.36        tcp dpt:4662 to:192.168.1.13:4662
  127  8421 DNAT       udp  --  *      *       0.0.0.0/0           
84.62.187.36        udp dpt:4672 to:192.168.1.13:4672
  301 24403 TRIGGER    all  --  *      *       0.0.0.0/0           
84.62.187.36        TRIGGER type:dnat match:0 relate:0

Chain POSTROUTING (policy ACCEPT 417 packets, 22564 bytes)
 pkts bytes target     prot opt in     out     source              
destination
    0     0 MASQUERADE  all  --  *      vlan1   0.0.0.0/0           
169.254.0.0/16
 5002  346K MASQUERADE  all  --  *      ppp0    0.0.0.0/0           
0.0.0.0/0
    0     0 RETURN     all  --  *      br0     0.0.0.0/0           
0.0.0.0/0           PKTTYPE = broadcast
    0     0 MASQUERADE  all  --  *      br0     192.168.1.0/24      
192.168.1.0/24

Chain OUTPUT (policy ACCEPT 9 packets, 583 bytes)
 pkts bytes target     prot opt in     out     source              
destination


