From: Cody Harris <hchs@ns.sympatico.ca>
Subject: NAT Help...Again...
Date: Tue, 27 Jan 2004 15:07:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127150714.7de338f7.hchs@ns.sympatico.ca>
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

Ok ok, i've looked around sites and stuff, and here is my problem:
I have 2 computers, one called darna and one called bagle (don't ask). 
Here is my setup:


INTERNET --> eth1 = 10.30.7.147 |darna| eth0 = 192.168.0.1 <--> eth0 = 192.168.0.2 |bagle|

Here is my routing tables (netstat -r) for each: 

root@darna:/home/cody# netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
10.30.7.144     *               255.255.255.240 U        40 0          0 eth1
172.16.18.0     *               255.255.255.0   U        40 0          0 vmnet8
192.168.0.0     *               255.255.255.0   U        40 0          0 eth0
192.168.189.0   *               255.255.255.0   U        40 0          0 vmnet1
loopback        *               255.0.0.0       U        40 0          0 lo
default         10.30.7.145     0.0.0.0         UG       40 0          0 eth1
root@darna:/home/cody#

and bagle's:
root@bagle:~# netstat -r
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
localnet        *               255.255.255.0   U        40 0          0 eth0
localnet        *               255.255.255.0   U        40 0          0 eth0
loopback        *               255.0.0.0       U        40 0          0 lo
root@bagle:~#

The problem: I can't access anything beyond darna. On darna, this is my nat table:
root@darna:/home/cody# iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
MASQUERADE  tcp  --  192.168.0.2  anywhere           tcp dpt:http 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
root@darna:/home/cody# 

I can't access ANYTHING, like i said, beyond darna.

What gives?


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

