From: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Subject: NAT overlaps with ports
Date: Wed, 23 Sep 2009 12:51:11 +0300
Message-ID: <4AB9EF8F.4020307@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have the following setup
kernel: 2.6.30.5-43.fc11
iptables-1.4.3.1-1.fc11

192.168.1.0/24 is my public  IP range (eth0)
10.0.0.0/24 is my private IP range (eth1)
192.168.1.1 public IP of server
10.0.0.1 private IP of server


I'd like to add the following rules in the nat table:

[1] -A PREROUTING -i eth0 -d 192.168.1.1 -p tcp --dport 8080 -j DNAT 
--to-destination 10.0.0.1:8080
[2] -A POSTROUTING -o eth0 -s 10.0.0.1 -p tcp --sport 8080 -j SNAT 
--to-source 192.168.1.1:8080
[3] -A POSTROUTING -o eth0 -s 10.0.0.0/24 --to-source 
192.168.1.1-192.168.1.10

According to http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html
iptables is clever enough to avoid overlaps and clashes.
Are we sure that there isn't any chance to map a random packet (not from 
the server)
to 192.168.1.1:8080 in rule [3]?

I mean, does rule [2] reserve port 8080 of 192.168.1.1 ?

best regards,

Giannis


