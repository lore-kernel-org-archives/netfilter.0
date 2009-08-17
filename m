From: "Saurabh Shah" <Saurabh.Shah@Matrixtelesol.com>
Subject: Is Iptable only doing symmetric NATing?
Date: Mon, 17 Aug 2009 14:06:59 +0530
Message-ID: <5EAD8DE815C941A8A0D8E22AAD27D175@DOMAIN>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi List,



IPTABLE is only doing symmetric NATing even if other rules are written.

I have two interfaces eth0 and eth1 on my machine.


For example,


System X <------>| Network |<-------> (eth0) |My System (eth2) <-----> Slave
System A

System Y <------>|         |          (eth1) |

 

System X - 192.168.1.158

System Y - 192.168.2.162

 

My System eth0 - 192.168.2.11 (connected with external network)

My System eth1 - 192.168.1.190 (connected with external network)

My System eth2 - 192.168.253.2 (connected directly with slave system A
through internal network)

 

Slave system A - 192.168.253.3 is a slave device controlled by my system.

 

My system receives some packets on port 8000 on eth1 through system X. Its
job is to convert its source ip and port and send it to system A. It does so
by

 

iptables -t nat -I PREROUTING -i eth1 -p udp --dport 8000 -j DNAT
--to-destination 192.168.253.3:8000

iptables -t nat -I POSTROUTING -0 eth2 -p udp --dport 8000 -j SNAT
--to-destination 192.168.253.2:8000

 

My system also receives some packets on port 8004 on eth0 through system Y.
Its job is to convert its source ip and port and send it to system A. It
does so by

 

iptables -t nat -I PREROUTING -i eth0 -p udp --dport 8004 -j DNAT
--to-destination 192.168.253.3:8004

iptables -t nat -I POSTROUTING -0 eth2 -p udp --dport 8004 -j SNAT
--to-destination 192.168.253.2:8004

 

System A is configured to process these packets and send back it to my
system on eth2 with the same port from which it got packets. 

 

Now what I want to do is to send packets received from system A with source
port 8000 to external system Y

and send packets received from system A with source port 8004 to external
system X.

 

Rule for it,

iptables -t nat -I PREROUTING -i eth2 -p udp --dport 8004 -j DNAT
--to-destination 192.168.1.158:9000

iptables -t nat -I POSTROUTING -0 eth1 -p udp --dport 8004 -j SNAT
--to-destination 192.168.1.190:8000

iptables -t nat -I PREROUTING -i eth0 -p udp --dport 8000 -j DNAT
--to-destination 192.168.2.162:7000

iptables -t nat -I POSTROUTING -0 eth2 -p udp --dport 8000 -j SNAT
--to-destination 192.168.2.11:8004

 

 


But as per my observations, last two DNAT-ed nad SNAT-ed rules are not
applied. And my system is sending packets received on 8004 port of eth2 to
192.168.2.162:7000 and sending packets received on 8000 of eth0 to
192.168.1.158:9000.

Mean to say that it is doing totally reverse than what I need.

 

And as per observation, it is doing symmetric NATing on my packets because
it is sending packets received from system A to the destination from which
it got packets on port. E.g.

It receives packets on port 8000 of eth1 from system x(192.168.1.158:9000)
and sends them from eth2(192.168.253.2:8000) to system A
(192.168.253.3:8000).

So it is sending any packets received on port 8000 of eth2 from system A
(192.168.253.3:8000) to system x (192.168.1.158:9000) from where it got
packets earlier.

 

I am using linux 2.6.22 on my board.

How to override this default behavior with my rules?

 

Regards,

Saurabh Shah

 

 



