From: "rajeev.sekhar" <rajeev.sekhar@sumasoft.net>
Subject: Two gateway for two diff eth in one machine
Date: Thu, 14 Jun 2007 23:26:32 +0530
Message-ID: <005c01c7aead$58077f10$1664a8c0@ssplscu22>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi list ,

My senario is simple to u guys , but i cant find solution.

i am having a mail server with two eth
eth0  192.168.1.2
eth1  192.168.1.3

i want gateway of eth0 (192.168.1.2) to be 192.168.1.41   &
gateway of eth1 (192.168.1.3) to be 192.168.1.51


I will explain in detail.
I have two seperate VPN server( which is the same as 192.168.1.41 & 
192.168.1.51), where i want to DNAT port 25 from both VPN servers to my 
qmail server ( mail server got two ip 192.168.1.2 & 192.168.1.3). I am doing 
this because my MX record of mail server & VPN servers are the same.
My DNAT rule is right in both VPN servers. You can say my VPN server is the 
gateway for my mail server.
my eth file on qmail server is

[root@mail ~]# cat /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
ONBOOT=yes
BOOTPROTO=none
IPADDR=192.168.1.2
NETMASK=255.255.255.0
GATEWAY=192.168.1.41
TYPE=Ethernet

[root@mail ~]# cat /etc/sysconfig/network-scripts/ifcfg-eth1
DEVICE=eth1
ONBOOT=yes
BOOTPROTO=none
IPADDR=192.168.1.3
NETMASK=255.255.255.0
GATEWAY=192.168.1.51
TYPE=Ethernet

i givin the GATEWAY on both eth,  but when i do   route -n   it looks like

[root@mail ~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth1
0.0.0.0         192.168.1.51    0.0.0.0         UG    0      0        0 eth0
[root@mail ~]#

now my eth1  is only working, because the default gateway is 192.168.1.51.

i want gateway of eth0 (192.168.1.2) to be 192.168.1.41   &
gateway of eth1 (192.168.1.3) to be 192.168.1.51   which are on the same 
machine.

Regards
---------------------------------------------
Rajeev Sekhar
Suma Soft Pvt. Ltd
Jr System Administrator
Ph no :91-020-25425655
cell no :91-9370677989
email:rajeev.sekhar@sumasoft.net

----------------------------------------------
Confidentiality Note: This e-mail message and any attachments to it are
intended only for the named recipients and may contain legally privileged
and/or confidential information. If you are not one of the intended
recipients, please notify the sender and do not duplicate or forward this
e-mail message and immediately delete it from your computer.
----------------------------------------------

