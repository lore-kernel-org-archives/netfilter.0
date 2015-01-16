From: The Media Server <info@themediaserver.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 21:15:38 -0500
Message-ID: <CAJb3rWA-Xy5MwqtyKP4X96NtrKw9Wm5-d-uMYwN4oG2cymOvYw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

OH nice trick! thks.. so I can see my packets are actually being
marked.. the problem is probably somewhere else then.. the number 32
increase as i try to connect..

Chain PREROUTING (policy ACCEPT 136K packets, 39M bytes)
 pkts bytes target     prot opt in     out     source               destination
   32  1628 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp dpt:80 MARK set 0x2
  218 77118 MARK       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0            tcp spt:80 MARK set 0x2
 136K   39M MARK       all  --  *      *       0.0.0.0/0
0.0.0.0/0            MARK set 0x2

Chain INPUT (policy ACCEPT 136K packets, 39M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 174K packets, 144M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 176K packets, 144M bytes)
 pkts bytes target     prot opt in     out     source               destination


This is the result of table main (OPENVPN did this):
0.0.0.0/1 via 10.107.1.5 dev tun0
default via 192.168.2.1 dev eth0  proto static
10.107.1.1 via 10.107.1.5 dev tun0
10.107.1.5 dev tun0  proto kernel  scope link  src 10.107.1.6
128.0.0.0/1 via 10.107.1.5 dev tun0
162.xx.xxx.xx via 192.168.2.1 dev eth0
192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.20  metric 1

table 2:
default via 192.168.2.1 dev eth0
192.168.2.0/24 dev eth0  proto kernel  scope link  src 192.168.2.20  metric 1

I'll try to do more test.. You have an idea why it still timing out
tho? and not timing out with this:
sudo ip rule add from 192.168.2.0/24 table ht

Thks a lot!
