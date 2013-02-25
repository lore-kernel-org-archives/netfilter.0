From: Daniel huhardeaux <daniel.huhardeaux@tootai.com>
Subject: Using set mark to split traffic against 2 IF
Date: Mon, 25 Feb 2013 15:28:23 +0100
Message-ID: <512B7507.7000008@tootai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm running a Debian Squeeze with iptables 1.4.8. The server has 3 
physical interfaces, local one (eth2) being bridged as br0. Both other 
interfaces are connected too 2 providers in ADSL (eth0) and SDSL (eth1).

Default route is going out through eth1. Two computers are going out 
using eth1, ip rule make this setup working.

What I want now, is to mark packets 0x1 for eth0 0x2 (or nothing) for 
eth1, so I will be able to use the links by services for instane (like 
ssh and http connections going out using eth0, doesn't matter which 
computer) rest of traffic using the default route.

My mangle table (Relevant part):

*mangle
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:CONNMARK1 - [0:0]
:CONNMARK2 - [0:0]
:RESTOREMARK - [0:0]
-A PREROUTING -j RESTOREMARK
-A PREROUTING -s 192.168.10.6/32 -m mark --mark 0x0 -j CONNMARK1
-A PREROUTING -p tcp -m mark --mark 0x0 -m tcp --sport 55555 -j CONNMARK1
-A POSTROUTING -p tcp -m mark --mark 0x0 -m tcp --dport 55555 -j CONNMARK1
-A POSTROUTING -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 
0xffffffff
-A CONNMARK1 -j LOG --log-prefix "MARK=1" --log-level 5
-A CONNMARK1 -j CONNMARK --set-xmark 0x1/0xffffffff
-A CONNMARK2 -j LOG --log-prefix "MARK=2" --log-level 5
-A CONNMARK2 -j CONNMARK --set-xmark 0x2/0xffffffff
-A RESTOREMARK -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 
0xffffffff
COMMIT

Nat Table

-A POSTROUTING -m mark --mark 0x1 -j SNAT --to-source xxx.xxx.xxx.xxx
-A POSTROUTING -j SNAT --to-source yyy.yyy.yyy.yyy

xxx.xxx.xxx.xxx being public IP address of eth0/Provider 1
yyy.yyy.yyy.yyy being public IP address of eth1/Provider 2

Now I run nc -kl 55555 on an outside server as well as tshark - i eth0 
port 55555. From the office router or from a worksattion from the 
intranet I run nc -vvv <ip of far server> 55555 as well as tshark -i 
eth0 dst <ip of far server> What I see is that the trafic is still going 
out using default route insteed of eth0/IP xxx.xxx.xxx.xxx

What is wrong with my setup?

Thanks for any hint.

-- 
Daniel
