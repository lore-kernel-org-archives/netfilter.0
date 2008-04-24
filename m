From: Tom Tonk <tnbt@arcor.de>
Subject: DNAT IPSec
Date: Thu, 24 Apr 2008 23:16:29 +0200
Message-ID: <4810F8AD.4020801@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have a problem setting up DNAT in an IPSec environment. Here is my setup:

Client(192.168.0.200) <-> 192.168.0.101(NAT-Box) <-> 192.168.122.100(Client)

I want to setup a secure tunnel between both client machines. Since one 
client is behind a nat box I have to use nat-t in racoon. on client 
192.168.122.100 is also a telnet server running which should be available 
from client 192.168.0.200 on the other subnet.

NAT rules for nat-t on 192.168.0.101 is implemented with these rules:

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       esp  --  0.0.0.0/0            0.0.0.0/0           to:192.168.122.100
DNAT       udp  --  0.0.0.0/0            0.0.0.0/0           multiport 
dports 500,4500 to:192.168.122.100

On both clients, racoon is running with this config:

path pre_shared_key "/etc/racoon/psk.txt";

timer  {
        natt_keepalive 10sec;
        }

listen {
        isakmp 192.168.122.100 [500];
        isakmp_natt 192.168.122.100 [4500];
        }

remote 192.168.0.200 {
         exchange_mode main;
         nat_traversal on;
         proposal {
                 encryption_algorithm 3des;
                 hash_algorithm md5;
                 authentication_method pre_shared_key;
                 dh_group modp1024;
         }
}
sainfo address 192.168.0.101 any address 192.168.0.200 any {
         pfs_group modp768;
         encryption_algorithm 3des;
         authentication_algorithm hmac_md5;
         compression_algorithm deflate;
}

the config on the other machine looks similar. setkey is using this policies:

spdadd 192.168.0.200 192.168.0.101 any -P in ipsec
            esp/tunnel/192.168.0.200-192.168.0.101/require;

spdadd 192.168.0.101 192.168.0.200 any -P out ipsec
            esp/tunnel/192.168.0.101-192.168.0.200/require;

again, similar config on the other box.

when I ping 192.168.0.101 from 192.168.0.200, the tunnel is created:

[root@rhel4 racoon]# racoon -F -f racoon.conf
Foreground mode.
2008-04-24 17:40:01: INFO: @(#)ipsec-tools 0.3.3 
(http://ipsec-tools.sourceforge.net)
2008-04-24 17:40:01: INFO: @(#)This product linked OpenSSL 0.9.7a Feb 19 
2003 (http://www.openssl.org/)
2008-04-24 17:40:01: INFO: 192.168.122.100[4500] used as isakmp port (fd=7)
2008-04-24 17:40:01: INFO: 192.168.122.100[4500] used for NAT-T
2008-04-24 17:40:01: INFO: 192.168.122.100[500] used as isakmp port (fd=8)
2008-04-24 17:40:06: INFO: respond new phase 1 negotiation: 
192.168.122.100[500]<=>192.168.0.200[500]
2008-04-24 17:40:06: INFO: begin Identity Protection mode.
2008-04-24 17:40:06: INFO: received Vendor ID: draft-ietf-ipsec-nat-t-ike-02
2008-04-24 17:40:06: INFO: received Vendor ID: draft-ietf-ipsec-nat-t-ike-00
2008-04-24 17:40:06: INFO: Selected NAT-T version: draft-ietf-ipsec-nat-t-ike-02
2008-04-24 17:40:06: INFO: Hashing 192.168.122.100[500] with algo #1
2008-04-24 17:40:06: INFO: NAT-D payload #0 doesn't match
2008-04-24 17:40:06: INFO: Hashing 192.168.0.200[500] with algo #1
2008-04-24 17:40:06: INFO: NAT-D payload #1 verified
2008-04-24 17:40:06: INFO: NAT detected: ME
2008-04-24 17:40:06: INFO: Hashing 192.168.0.200[500] with algo #1
2008-04-24 17:40:06: INFO: Hashing 192.168.122.100[500] with algo #1
2008-04-24 17:40:06: INFO: Adding remote and local NAT-D payloads.
2008-04-24 17:40:06: INFO: NAT-T: ports changed to: 
192.168.0.200[4500]<->192.168.122.100[4500]
2008-04-24 17:40:06: INFO: KA list add: 
192.168.122.100[4500]->192.168.0.200[4500]
2008-04-24 17:40:06: INFO: ISAKMP-SA established 
192.168.122.100[4500]-192.168.0.200[4500] spi:d4245a3e8d07f023:353aeb082ad83985
2008-04-24 17:40:07: INFO: respond new phase 2 negotiation: 
192.168.122.100[0]<=>192.168.0.200[0]
2008-04-24 17:40:07: INFO: Adjusting peer's encmode UDP-Tunnel->61441
2008-04-24 17:40:08: INFO: IPsec-SA established: ESP/Tunnel 
192.168.0.200->192.168.122.100 spi=189715164(0xb4ed2dc)
2008-04-24 17:40:08: INFO: IPsec-SA established: ESP/Tunnel 
192.168.122.100->192.168.0.200 spi=184022985(0xaf7f7c9)

Now I want to ping from client 192.168.0.200 the peer client 192.168.122.100 
behind the nat box. since the peer client is on a private subnet I ping the 
nat-box IP. and here is the question: how do I have to setup DNAT on the 
nat-box that traffic arriving here is DNATed to the peer client 
192.168.122.100, or is this possible at all? I mean, the ipsec traffic 
arriving at the nat box is forwarded to the internal client running racoon, 
on the machine running racoon also runs the telnet server. it's not clear to 
me where I have to implement the nat rules so that I can ping the 
telnet-server from client 192.168.0.200 using the public IP from the nat-box.

when I sniff the traffic on 192.168.122.100 I actually see this:

[root@rhel4 ~]# tcpdump icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
17:40:13.983235 IP 192.168.0.200 > 192.168.0.101:icmp 64: echo request seq 7
17:40:14.979046 IP 192.168.0.200 > 192.168.0.101:icmp 64: echo request seq 8


Any help is really appreciated.

Thanks.
