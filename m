From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: ipset not blocking
Date: Wed, 15 Mar 2006 10:51:17 -0600
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D1610133DA@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Thank you for replying.

I was looking to block traffic to my port 25 (gateway device) from a
list of CIDRs that I obtained from arin, apnic, ripe, lacnic & afrinic.

I don't think my idea will work as it appears the sending host
continually retries sending the message with just a -j DROP in my
iptables. I guess I need to send a 553 message so it stops trying.

But I'd still like to know why it's not blocking.

Here is my iptables -nL:

Chain INPUT (policy DROP)
target     prot opt source               destination        =20
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpts:135:139=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:520

DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
spts:67:68=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:873

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     udp  --  172.13.57.1          172.13.57.102      =20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25=20
ACCEPT     tcp  --  192.168.13.2         192.168.13.1        tcp spt:25=20
ACCEPT     tcp  --  192.168.13.0/24      192.168.13.1        tcp
spts:1024:65535 dpt:8100 state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
spt:2703=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
spt:24441=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
spt:24441=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
spt:32771=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
spt:6277=20
ACCEPT     tcp  --  0.0.0.0/0            172.13.57.102       tcp dpt:22=20
ACCEPT     tcp  --  0.0.0.0/0            192.168.13.1        tcp dpt:22=20
ACCEPT     tcp  --  24.12.195.186        172.13.57.102       tcp
dpt:1241=20
ACCEPT     tcp  --  172.13.57.102        0.0.0.0/0           tcp dpt:443

ACCEPT     tcp  --  192.168.13.0/24      192.168.13.1        tcp
spts:1024:65535 dpt:3128 state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:80
dpts:1024:65535 state RELATED,ESTABLISHED=20
ACCEPT     udp  --  0.0.0.0/0            206.141.192.60      udp dpt:53=20
ACCEPT     udp  --  0.0.0.0/0            206.141.192.60      udp spt:53=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:53=20
ACCEPT     udp  --  192.168.13.0/24      0.0.0.0/0           udp dpt:53=20
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x00=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x29 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x06/0x06 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x03/0x03 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x01 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x3F recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x00 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x05/0x05 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x3F recent: SET name: DEFAULT side: source=20
SMALL      udp  --  0.0.0.0/0            0.0.0.0/0           length 0:27
recent: SET name: DEFAULT side: source=20
SMALL      udp  --  0.0.0.0/0            0.0.0.0/0           length 0:39
recent: SET name: DEFAULT side: source=20
SMALL      icmp --  0.0.0.0/0            0.0.0.0/0           length 0:31
recent: SET name: DEFAULT side: source=20
SMALL      30   --  0.0.0.0/0            0.0.0.0/0           length 0:31
recent: SET name: DEFAULT side: source=20
SMALL      47   --  0.0.0.0/0            0.0.0.0/0           length 0:39
recent: SET name: DEFAULT side: source=20
SMALL      esp  --  0.0.0.0/0            0.0.0.0/0           length 0:49
recent: SET name: DEFAULT side: source=20
SMALL      ah   --  0.0.0.0/0            0.0.0.0/0           length 0:35
recent: SET name: DEFAULT side: source=20
SMALL      all  --  0.0.0.0/0            0.0.0.0/0           length 0:19
recent: SET name: DEFAULT side: source=20
BOGUS      all  --  0.0.0.0/0            0.0.0.0/0           ctstate
INVALID=20
SYN-FLOOD  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x17/0x04=20
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x12/0x12 ctstate NEW LOG flags 0 level 4 prefix `Reset Spoof TWH
'=20
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x12/0x12 ctstate NEW reject-with tcp-reset=20
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x17/0x02 ctstate NEW LOG flags 0 level 4 prefix `New not syn: '=20
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x17/0x02 ctstate NEW=20
ANTI_SPOOF  all  -- !192.168.13.0/24      0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           ctstate
RELATED,ESTABLISHED=20
OFFENDER   all  --  0.0.0.0/0            0.0.0.0/0           recent:
CHECK seconds: 300 name: DEFAULT side: source=20
DROP       all  --  172.13.57.1          224.0.0.1          =20
FINAL_DROP  all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain FORWARD (policy DROP)
target     prot opt source               destination        =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED=20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW=20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x29 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x06/0x06 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x03/0x03 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x01 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x3F recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x05/0x05 recent: SET name: DEFAULT side: source=20
PORTSCAN   tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x3F/0x3F recent: SET name: DEFAULT side: source=20
BOGUS      all  --  0.0.0.0/0            0.0.0.0/0           ctstate
INVALID=20
SYN-FLOOD  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x17/0x04=20
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x12/0x12 ctstate NEW LOG flags 0 level 4 prefix `Reset Spoof TWH
'=20
REJECT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:0x12/0x12 ctstate NEW reject-with tcp-reset=20
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x17/0x02 ctstate NEW LOG flags 0 level 4 prefix `New not syn: '=20
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
flags:!0x17/0x02 ctstate NEW=20
ALLOWED_OUT  all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           ctstate
RELATED,ESTABLISHED=20
OFFENDER   all  --  0.0.0.0/0            0.0.0.0/0           recent:
CHECK seconds: 300 name: DEFAULT side: source=20
FINAL_DROP  all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain OUTPUT (policy DROP)
target     prot opt source               destination        =20
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpts:135:139=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:520

DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp
spts:67:68=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:873

ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     udp  --  172.13.57.102        172.13.57.1        =20
ACCEPT     tcp  --  192.168.13.1         192.168.13.2        tcp dpt:25=20
ACCEPT     tcp  --  172.13.57.102        0.0.0.0/0           tcp
spts:1025:65535 dpt:25=20
ACCEPT     tcp  --  192.168.13.2         0.0.0.0/0           tcp dpt:25=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
spt:8100 dpts:1024:65535 state RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
dpt:2703=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpt:24441=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
dpt:24441=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpt:32771=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
spt:32771=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp
dpt:6277=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:20=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:21=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:22=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
spt:1241=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:443
state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  172.13.57.102        0.0.0.0/0           tcp dpt:443

ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp
spts:1024:65535 dpt:80 state NEW,RELATED,ESTABLISHED=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:80
dpts:1024:65535 state RELATED,ESTABLISHED=20
ACCEPT     udp  --  0.0.0.0/0            206.141.192.60      udp dpt:53=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:53=20
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53=20
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53=20
ACCEPT     tcp  --  192.168.13.1         192.168.13.0/24     tcp
spt:3128=20
BOGUS      all  --  0.0.0.0/0            0.0.0.0/0           ctstate
INVALID=20
ALLOWED_OUT  all  --  0.0.0.0/0            0.0.0.0/0          =20
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           ctstate
RELATED,ESTABLISHED=20
FINAL_DROP  all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain ALLOWED_OUT (2 references)
target     prot opt source               destination        =20
RETURN     all  --  172.13.57.102        0.0.0.0/0          =20
RETURN     all  --  192.168.13.0/24      0.0.0.0/0          =20

Chain ANTI_SPOOF (1 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 6 prefix `Spoofing DENY: '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain BLOCKEDSMTP (0 references)
target     prot opt source               destination        =20

Chain BOGUS (3 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 6 prefix `INVALID PACKET DROP '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain FINAL_DROP (3 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 6 prefix `FINAL DROP '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain OFFENDER (2 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 6 prefix `OFFENDER -- SHUN '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain PORTSCAN (15 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 6 prefix `PORTSCAN -- SHUN '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain SMALL (8 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 6 prefix `SMALL -- SHUN '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20

Chain SYN-FLOOD (2 references)
target     prot opt source               destination        =20
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg
1/sec burst 5 LOG flags 7 level 4 prefix `SYN-FLOOD '=20
DROP       all  --  0.0.0.0/0            0.0.0.0/0          =20


-----Original Message-----
From: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]=20
Sent: Wednesday, March 15, 2006 10:40 AM
To: Thomas Raef
Cc: netfilter@lists.netfilter.org
Subject: RE: ipset not blocking

On Wed, 15 Mar 2006, Thomas Raef wrote:

> I'm using ipset 2.2.8 version 2
> Iptables v1.3.4
> Kernel 2.6.15
>
> If I change the iptables to the INPUT chain it blocks, but more than
> just dst port 25, it blocks everything.

Could you post more details?

What is it you actually want to do? To protect a mail server behind a
firewall, or it is the mail server itself where you want to setup
iptables/ipset? Please send the output of 'iptables -nL' as well.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

