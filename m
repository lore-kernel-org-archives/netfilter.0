From: "Niel Harper" <noaharper@hotmail.com>
Subject: IPTables Problem
Date: Fri, 04 Oct 2002 17:55:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F187QpbalJFWs0eNRfU00009397@hotmail.com>
Reply-To: niel.harper@ieee.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_5b71_3652_1b89"
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

------=_NextPart_000_5b71_3652_1b89
Content-Type: text/plain; format=flowed

I have IPTables version 1.2.6a running on my VPN (FreeS/Wan 1.98b) gateway.  
I have configured (or so I thought) it to accept incoming and outgoing 
IPSEC, ESP, and AH traffic.  When I try to connect from my remote client, I 
keep getting a "not permitted" error.  Could someone please check my 
iptables chains and tell me exactly what I'm doing wrong.  The IPTables list 
is attached to this document as a text file.

Niel Harper, CISA
Information Security Engineer
Institute of Electrical and Electronic Engineers
IEEE Information Assurance Task Force
Tel: (246) 424-3809
Fax: (246) 425-6076
Email: niel.harper@ieee.org




_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx

------=_NextPart_000_5b71_3652_1b89
Content-Type: text/plain; name="iptables.txt"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="iptables.txt"

Chain INPUT (policy DROP)
target     prot opt source               destination
loopback_in  all  --  anywhere             anywhere
interface0_in  all  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere           udp spt:isakmp 
dpt:isakmp
ACCEPT     ipv6-crypt--  anywhere             anywhere
ACCEPT     ipv6-auth--  anywhere             anywhere
LOG        all  --  anywhere             anywhere           LOG level 
warning prefix `giptables-end-of-firewall: '

Chain FORWARD (policy DROP)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level 
warning prefix `giptables-end-of-firewall: '

Chain OUTPUT (policy DROP)
target     prot opt source               destination
loopback_out  all  --  anywhere             anywhere
interface0_out  all  --  anywhere             anywhere
ACCEPT     udp  --  anywhere             anywhere           udp spt:isakmp 
dpt:isakmp
ACCEPT     ipv6-crypt--  anywhere             anywhere
ACCEPT     ipv6-auth--  anywhere             anywhere
ACCEPT     all  --  192.168.10.1         localhost.localdomain
LOG        all  --  anywhere             anywhere           LOG level 
warning prefix `giptables-end-of-firewall: '

Chain interface0_in (1 references)
target     prot opt source               destination
syn_flood_interface0_in  tcp  --  anywhere             anywhere           
tcp flags:SYN,RST,ACK/SYN
LOG        tcp  --  anywhere             anywhere           tcp 
flags:!SYN,RST,ACK/SYN state NEW limit: avg 5/min burst 7 LOG level warning 
prefix `giptables-new-no-syn: '
DROP       tcp  --  anywhere             anywhere           tcp 
flags:!SYN,RST,ACK/SYN state NEW
LOG        all  -f  anywhere             anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-fragments: '
DROP       all  -f  anywhere             anywhere
LOG        tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG limit: avg 5/min burst 
7 LOG level warning prefix `giptables-malformed-xmas: '
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
LOG        tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN,RST,PSH,ACK,URG/NONE limit: avg 5/min burst 7 LOG level 
warning prefix `giptables-malformed-null: '
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
LOG        all  --  192.168.10.2         anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  192.168.10.2         anywhere
LOG        all  --  0.0.0.0/8            anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  0.0.0.0/8            anywhere
LOG        all  --  127.0.0.0/8          anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  127.0.0.0/8          anywhere
LOG        all  --  10.0.0.0/8           anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  10.0.0.0/8           anywhere
LOG        all  --  172.16.0.0/12        anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  172.16.0.0/12        anywhere
LOG        all  --  192.168.0.0/16       anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  192.168.0.0/16       anywhere
LOG        all  --  224.0.0.0/3          anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-spoof: '
DROP       all  --  224.0.0.0/3          anywhere
ACCEPT     udp  --  205.214.192.201      192.168.10.2       udp spt:domain 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  205.214.192.201      192.168.10.2       tcp spt:domain 
dpts:1024:65535 state ESTABLISHED
ACCEPT     udp  --  205.214.192.202      192.168.10.2       udp spt:domain 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  205.214.192.202      192.168.10.2       tcp spt:domain 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:ftp 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp 
spts:1024:65535 dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp 
spts:1024:65535 dpt:ftp state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp 
spts:1024:65535 dpts:1024:65535 state RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp 
spts:1024:65535 dpt:ftp-data state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:ssh 
dpts:login:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp 
spts:login:65535 dpt:ssh state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:telnet 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:smtp 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp 
spts:1024:65535 dpt:smtp state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:pop3 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:imap 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:http 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:https 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:webcache 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.10.2       tcp spt:nntp 
dpts:1024:65535 state ESTABLISHED
ACCEPT     udp  --  anywhere             192.168.10.2       udp spt:ldap 
dpts:1024:65535 state ESTABLISHED
ACCEPT     icmp --  anywhere             192.168.10.2       state 
RELATED,ESTABLISHED
LOG        all  --  anywhere             anywhere           limit: avg 5/min 
burst 7 LOG level warning prefix `giptables-drop-src-norule: '
DROP       all  --  anywhere             anywhere

Chain interface0_out (1 references)
target     prot opt source               destination
ACCEPT     udp  --  192.168.10.2         205.214.192.201    udp 
spts:1024:65535 dpt:domain state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         205.214.192.201    tcp 
spts:1024:65535 dpt:domain state NEW,ESTABLISHED
ACCEPT     udp  --  192.168.10.2         205.214.192.202    udp 
spts:1024:65535 dpt:domain state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         205.214.192.202    tcp 
spts:1024:65535 dpt:domain state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:ftp state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpts:1024:65535 state RELATED,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp spt:ftp 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp spt:ftp-data 
dpts:1024:65535 state RELATED,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:login:65535 dpt:ssh state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp spt:ssh 
dpts:login:65535 state ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:telnet state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:smtp state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp spt:smtp 
dpts:1024:65535 state ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:pop3 state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:imap state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:http state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:https state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:webcache state NEW,ESTABLISHED
ACCEPT     tcp  --  192.168.10.2         anywhere           tcp 
spts:1024:65535 dpt:nntp state NEW,ESTABLISHED
ACCEPT     udp  --  192.168.10.2         anywhere           udp 
spts:1024:65535 dpt:ldap state NEW,ESTABLISHED
ACCEPT     udp  --  192.168.10.2         anywhere           udp 
spts:1024:65535 dpts:traceroute:33523 state NEW
ACCEPT     icmp --  192.168.10.2         anywhere           state 
NEW,RELATED,ESTABLISHED

Chain loopback_in (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere

Chain loopback_out (1 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere

Chain syn_flood_interface0_in (1 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere           limit: avg 1/sec 
burst 3
DROP       all  --  anywhere             anywhere


------=_NextPart_000_5b71_3652_1b89--

