From: Petr Titera <P.Titera@century.cz>
Subject: 26sec problems
Date: Wed, 06 Apr 2005 10:18:05 +0200
Message-ID: <42539B3D.2090407@century.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

    I have a problem with 26sec tunnel setup. My network configuration 
looks as follows:

        
          |
          |eth0
      +-------+                                      +-------+
  eth1|       |eth2                              eth0|       |eth1
  ----|  FWA  |------------IPSEC VPN-----------------|  FWB  |----
      |       |                                      |       |
      +-------+                                      +-------+

Both firewalls have kernel version 2.6.10.

I have ADSL modem connected on eth0 and eth2 at FWA site. I've setted up 
VPN tunel between both firewals and there fun begins.

    I can ping the computers in internal networks from both direction.

    Users from unternal network of FWB can connect to computers in 
internal network of FWA without any problem, but
users from FWA network cannot conect at all.

    When I trace traffic from FWA network to FWB network I see strange 
things happen. SYN packets are transfered, but when real communication 
starts I see this:

    on FWA:eth1 I see packets to other computer
    on FWA:eth2 I see packets going to tunnel and packets going from 
tunnel without a change
    on FWB:eth0 I see packets from tunnel without a change
    on FWB:eth1 I see communication in both direction

BUT on FWA:eth1 I see packets from other direction as going from another 
port than I have connected:

This is communication as I see it on FWA:eth1 port. Note change from 
http port to tcpmux port.

09:23:46.372945 IP 192.168.17.200.60424 > 192.168.1.200.http: S 
3072626488:3072626488(0) win 5840 <mss 1460,sackOK,timestamp 3092376420 
0,nop,wscale 0>
09:23:46.485595 IP 192.168.1.200.http > 192.168.17.200.60424: S 
2915082851:2915082851(0) ack 3072626489 win 65535 <mss 1460,nop,wscale 
0,nop,nop,timestamp 0 0,nop,nop,sackOK>
09:23:46.485715 IP 192.168.17.200.60424 > 192.168.1.200.http: . ack 1 
win 5840 <nop,nop,timestamp 3092376478 0>
09:23:51.963654 IP 192.168.17.200.60424 > 192.168.1.200.http: F 1:1(0) 
ack 1 win 5840 <nop,nop,timestamp 3092379283 0>
09:23:52.065913 IP 192.168.1.200.tcpmux > 192.168.17.200.60424: . ack 
3072626490 win 65535 <nop,nop,timestamp 10752655 3092379283>
09:23:52.066028 IP 192.168.17.200.60424 > 192.168.1.200.tcpmux: R 
3072626490:3072626490(0) win 0
09:23:52.171022 IP 192.168.1.200.tcpmux > 192.168.17.200.60424: F 0:0(0) 
ack 1 win 65535 <nop,nop,timestamp 10752656 3092379283>

Any idea what is wrong?


Petr Titera

