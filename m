From: "louie miranda" <lmiranda@chikka.com>
Subject: problems on packets going out..
Date: Thu, 20 Feb 2003 13:01:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c401c2d89d$2eba94c0$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_00C1_01C2D8E0.3AB1A5F0"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_00C1_01C2D8E0.3AB1A5F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I have an iptables rule which block specific ports and specific icmp and all
udp.
Everything is successfully connected and i can retrieve data packets, but
when i add the last rule for my chain which is..

$IPTABLES -A INPUT -d $MYIP -s 0/0 -j REJECT

Yes its secure every port i have from 1 to 65000, but outgoing packets from
my server could not get out. Which is wrong? I'm attaching my rule if ever
you want to see it.

--
Thanks,
Louie...

------=_NextPart_000_00C1_01C2D8E0.3AB1A5F0
Content-Type: text/plain;
	name="creon-firewall.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="creon-firewall.txt"

#!/bin/bash

IPTABLES=3D"/sbin/iptables"
MYIP=3D"10.0.0.13"

$IPTABLES -F

### global rule for 193.35.207.34 ###
# $IPTABLES -A INPUT -d $MYIP -s 0/0 -j LOG
### end of global rule for 193.35.207.34 ###

### rule for udp ###
$IPTABLES -A INPUT -p udp -d $MYIP -j LOG
$IPTABLES -A INPUT -p udp -d 127.0.0.1 -s 127.0.0.1 -j ACCEPT
$IPTABLES -A INPUT -p udp -d $MYIP -s $MYIP -j ACCEPT
$IPTABLES -A INPUT -p udp -d $MYIP -s 10.0.0.11 -j ACCEPT # louie-pc
$IPTABLES -A INPUT -p udp -d $MYIP -s 0/0 -j REJECT --reject-with =
icmp-net-unreachable # drop the fucker ;)
### end of udp ###

### rule for icmp 8 ###
$IPTABLES -A INPUT -p icmp --icmp-type 8 -d $MYIP -j LOG
$IPTABLES -A INPUT -p icmp --icmp-type 8 -d 127.0.0.1 -s 127.0.0.1 -j =
ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 8 -d $MYIP -s $MYIP -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type 8 -d $MYIP -s 10.0.0.11 -j ACCEPT =
# louie-pc
$IPTABLES -A INPUT -p icmp --icmp-type 8 -d $MYIP -s 0/0 -j REJECT =
--reject-with icmp-net-unreachable
### end of icmp 8 ###

### rule for port 22 ###
$IPTABLES -A INPUT -p tcp --dport 22 -d $MYIP -j LOG
$IPTABLES -A INPUT -p tcp --dport 22 -d 127.0.0.1 -s 127.0.0.1 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 22 -d $MYIP -s $MYIP -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 22 -d $MYIP -s 10.0.0.11 -j ACCEPT # =
louie-pc
$IPTABLES -A INPUT -p tcp --dport 22 -d $MYIP -s 0/0 -j REJECT =
--reject-with icmp-net-unreachable # drop the fucker ;)
### end of port 22 ###

### rule for port 80 ###
$IPTABLES -A INPUT -p tcp --dport 80 -d $MYIP -j LOG
$IPTABLES -A INPUT -p tcp --dport 80 -d 127.0.0.1 -s 127.0.0.1 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -d $MYIP -s $MYIP -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -d $MYIP -s 10.0.0.11 -j ACCEPT # =
louie-pc
$IPTABLES -A INPUT -p tcp --dport 80 -d $MYIP -s 0/0 -j REJECT =
--reject-with icmp-net-unreachable # drop the fucker ;)
### end of port 80 ###

### rule for port 3306 ###
$IPTABLES -A INPUT -p tcp --dport 3306 -d $MYIP -j LOG
$IPTABLES -A INPUT -p tcp --dport 3306 -d 127.0.0.1 -s 127.0.0.1 -j =
ACCEPT
$IPTABLES -A INPUT -p tcp --dport 3306 -d $MYIP -s $MYIP -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 3306 -d $MYIP -s 10.0.0.11 -j ACCEPT # =
louie-pc
$IPTABLES -A INPUT -p tcp --dport 3306 -d $MYIP -s 0/0 -j REJECT =
--reject-with icmp-net-unreachable # drop the fucker ;)
### end of port 3306 ###

### misc rules ###
# $IPTABLES -A OUTPUT -p icmp -s 0/0 -d 10.0.0.13 -j ACCEPT
### end of misc rules ###

### output rules ###
$IPTABLES -A OUTPUT -p ALL -s $MYIP -j ACCEPT
### end of output rules ###

### forward rules ###
$IPTABLES -A FORWARD -i eth0 -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
### end of forward rules ###

### rule for deny all ###
$IPTABLES -A INPUT -d $MYIP -s 0/0 -j REJECT --reject-with =
icmp-net-unreachable # drop the fucker ;)
### end of deny all ###

#
# eof

------=_NextPart_000_00C1_01C2D8E0.3AB1A5F0--


