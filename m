From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: problem with forward and iptables
Date: Wed, 3 Jul 2002 08:57:02 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703155702.95481.qmail@web9904.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org

This is part of the rules

PROG=3D"/usr/sbin/iptables"

$PROG -t nat -A POSTROUTING -j SNAT --source
iii.iii.iii.0/255.255.255.128 --to-source
ooo.ooo.*17.*50 -o eth1

### Set a default policy of DROP
$PROG -P FORWARD DROP
$PROG -P INPUT DROP
$PROG -P OUTPUT DROP


## navgw

# mail
$PROG  -t nat -A PREROUTING -p tcp -d ooo.ooo.*17.*54
--dport 25 -j DNAT --to iii.iii.iii.*15:25
$PROG -A FORWARD -p tcp -d iii.iii.iii.*15 --dport 25
-j ACCEPT
$PROG -A INPUT -p tcp --destination ooo.ooo.*17.*54
--destination-port 25 -j ACCEPT

# Allow SMTP=20
$PROG -A FORWARD -j ACCEPT -i eth1 -o eth0
--destination iii.iii.iii.*15 -p tcp --dport 25
$PROG -A FORWARD -j ACCEPT -i eth1 -o eth0
--destination iii.iii.iii.*15 -p tcp --sport 25
$PROG -A FORWARD -j ACCEPT -i eth0 -o eth1 --source
iii.iii.iii.*15 -p tcp --dport 25
$PROG -A FORWARD -j ACCEPT -i eth0 -o eth1 --source
iii.iii.iii.*15 -p tcp --sport 25


ooo.ooo.*17.*50 is on eth1 (outside)
ooo.ooo.*17.*54 is another ip on eth1 (outside)

iii.iii.iii.*15 is a ip on a masq network (behind the
fw)

both ooo.ooo.ooo.ooo and iii.iii.iii.iii is real class
c-net (even though iii.iii.iii.iii is being masqed),
which mean no net is a 192.168.0.0/255.255.0.0 or
10.0.0.0/255.0.0.0 or 172.16.0.0/255.255.255.0

The problem:

Telnet from the outside to ooo.ooo.*17.*54 : 25 does
what its supposed to do, i get a reply from a smtp
server. But then i noticed that iii.iii.iii.*15 : 25
gives the same reply. How come ? No other ip on the
iii.iii.iii.iii net is reachable. Is the forward rule
opening for access directly to the masqed ip ? and how
do i stop that ?

/J=F6rgen



__________________________________________________
Do You Yahoo!?
Sign up for SBC Yahoo! Dial - First Month Free
http://sbc.yahoo.com

