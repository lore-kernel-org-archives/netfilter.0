From: hal@alucicrazy.tacnet.com.br (bueno)
Subject: iptables + nat problem in large network
Date: Thu, 26 Sep 2002 17:46:51 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926204651.GB3801@alucicrazy.tacnet.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

Hello all,
	        I have had problems with iptables nat with some servers.
        Is strange, because the nat works during some time...

        I have a machine with 3 interfaces...
        eth0 - 200.xxx.xxx.163
        eth1 - 10.1.2.1
        eth2 - 10.0.0.1
               10.0.0.65
               10.0.1.1
               10.0.1.65
               10.0.2.1
               10.0.2.65
               10.0.3.1
               10.0.3.65
               10.0.4.1
               10.0.5.1
               10.0.5.65
               10.0.5.129
               10.0.5.194
               10.0.6.1

        I have the following rules for MASQUERADE:
        iptables -t nat -A POSTROUTING -s 10.1.2.0/25 -j MASQUERADE
        iptables -t nat -A POSTROUTING -s 10.0.0.0/16 -j MASQUERADE

Use iproute2 to help in nat :
        ip a a 200.xxx.xxx.165 dev eth0 scope global

        and the iptables with the following rules
        iptables -t nat -A PREROUTING -d 200.xxx.xxx.165 -j DNAT --to
10.1.2.17
        iptables -t nat -A POSTROUTING -s 10.1.2.17 -j SNAT --to
200.xxx.xxx.165

During determined time  (depending on what I pass through the server) it
works.....
as it shows ping, captured in tcpdump..

(from machine outside of network, (200.yyy.yyy.6)):

ping 200.xxx.xxx.165

tcpdump eth0:
15:01:06.104716 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:06.105192 200.xxx.xxx.165 > 200.yyy.yyy.6: icmp: echo reply
15:01:07.053800 200.yyy.yyy.6 > 200.152.199.166: icmp: echo request
15:01:07.054269 200.xxx.xxx.165 > 200.yyy.yyy.6: icmp: echo reply
15:01:08.085214 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:08.085622 200.xxx.xxx.165 > 200.yyy.yyy.6: icmp: echo reply
        
tcpdump eth1:
15:01:06.104973 200.yyy.yyy.6 > 10.1.2.17: icmp: echo request
15:01:06.105139 10.1.2.17 > 200.yyy.yyy.6: icmp: echo reply 
15:01:07.054079 200.yyy.yyy.6 > 10.1.2.17: icmp: echo request
15:01:07.054226 10.1.2.17 > 200.yyy.yyy.6: icmp: echo reply
15:01:08.085417 200.yyy.yyy.6 > 10.1.2.17: icmp: echo request 
15:01:08.085584 10.1.2.17 > 200.yyy.yyy.6: icmp: echo reply

tcpdump eth2:
nothing ...


after some time :

tcpdump eth0:
nothing...

tcpdump eth1:
nothing...

tcpdump eth2:

15:01:09.087368 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:10.126394 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:11.085064 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:12.112981 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:13.087442 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:14.134855 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:15.088227 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request
15:01:16.109413 200.yyy.yyy.6 > 200.xxx.xxx.165: icmp: echo request


it remains thus during long time, more than 1 hour
note that, 1 second later eth1 stops to answer, eth2 starts...

Some one knows about it ?

        Thanks
        and sorry the english ;>
	
-- 
^hal
<me@hal.vu>
http://hal.vu

