From: Sven Riedel <sr@gimp.org>
Subject: Can reach some websites, can't reach others
Date: Sat, 22 May 2004 13:59:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040522115927.GA18767@localnet>
Reply-To: sr@gimp.org
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
To: netfilter@lists.netfilter.org

Hi,
I'm using a Linux 2.6.6 box as a masquerading firewall via dialup for a
local network. From the internal network I can reach some websites (e.g.
www.debian.org) but can't reach others (e.g. www.freshmeat.net). The
unreachable sites _can_ be reached from the firewall-box itself though.

Throwing out all references to DROP in my firewall rules and setting the
policies of INPUT, OUTPUT and FORWARD to ACCEPT didn't change the
situation, so I doubt it's the rules used (they're appended down below
anyway, you never can tell...).

An ethereal dump of a connection to the sites that fail from the internal
network shows that the 3-way handshake progresses as usual, but then the
sites server sends a "Previous TCP Segment Lost" message and all traffic
ceases.

The box is linux 2.6.6, iptables 1.2.9, netfilter compiled into the
kernel with 
   connection tracking, 
   ftp and irc protocol support, 
   userspace queing via netlink,
   IP tables support, 
   limit match, 
   ip range match, 
   mac address match, 
   Packet type match,
   MARK support,
   multi-port support,
   TOS match support,
   recent match support,
   AH/ESP match support (as a module, not loaded),
   LENGTH match support
   TTL match support,
   tcpmss match support,
   Helper match support,
   Connection state match support
   Connection tracking match support,
   owner match support,
   packet filtering,
   REJECT target support,
   Full NAT,
   MASQUERADE
   REDIRECT
   NETMAP
   SAME,
   Packet mangling
   TOS target support
   MARK target support
   CLASSIFY target support
   LOG target support
   TCPMSS target support
   ARP tables support
   ARP packet filtering

The rules used:
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
SPOOF      all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW,RELATED 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTAB
LISHED 
LOCALSERVICE  all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:53 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:22 
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 6
 prefix `FW: dropped INPUT: ' 

Chain FORWARD (policy DROP)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW,RELATED 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTAB
LISHED 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state ESTABLISHED 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:20 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:21 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:22 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:25 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:80 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:443 
ACCEPT     tcp  --  192.168.0.0/24       0.0.0.0/0           tcp dpt:113 
ACCEPT     icmp --  192.168.0.0/24       0.0.0.0/0           icmp type 8 
ACCEPT     icmp --  0.0.0.0/0            192.168.0.0/24      icmp type 0 
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 6
 prefix `FW: dropped FORWARD: ' 
Chain OUTPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state RELATED,ESTAB
LISHED 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state NEW,RELATED 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           state ESTABLISHED 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:25 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:443 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:21 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:113 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:123 
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8 
ACCEPT     tcp  --  0.0.0.0/0            217.172.180.234     tcp dpt:110 
ACCEPT     icmp --  0.0.0.0/0            192.168.0.0/24      
LOCALTRAFFIC  all  --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 6
 prefix `FW: dropped OUTPUT: ' 

Chain LOCALSERVICE (1 references)
target     prot opt source               destination         
ACCEPT     udp  --  0.0.0.0              0.0.0.0/0           udp spt:68 dpt:67 
RETURN     all  -- !192.168.0.0/24       0.0.0.0/0           
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:32770 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:389 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80 state NE
W 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:443 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22 state NE
W 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:21 state NE
W 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25 state NE
W 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53 state NE
W 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53 state NE
W 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:137 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:137 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:139 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:139 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:138 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:138 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:445 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:445 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:111 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:111 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:2046 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:2046 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:1024 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:1024 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:1029 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:1029 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:2047 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:2047 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:2048 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:2048 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:2049 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:2049 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:631 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:631 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:6566 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:68 dpt:67 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:31457 state
 NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:31457 state
 NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:123 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:3306 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:9999 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:8080 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:143 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:993 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:5432 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:5432 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:20000 
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8 
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 6
 prefix `FW: dropped incoming locals: ' 
DROP       all  --  0.0.0.0/0            0.0.0.0/0           

Chain LOCALTRAFFIC (1 references)
target     prot opt source               destination         
DROP       all  --  0.0.0.0/0           !192.168.0.0/24      
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:137 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:137 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:139 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:139 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:138 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:138 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:445 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:445 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:111 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:111 state N
EW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:2047 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:2047 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:2048 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:2048 state 
NEW 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp spt:2049 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:2049 state 
NEW 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp spt:67 dpt:68 s
tate NEW 
ACCEPT     tcp  --  0.0.0.0/0            192.168.0.0/24      tcp spt:631 state N
EW 
ACCEPT     udp  --  0.0.0.0/0            192.168.0.0/24      udp spt:631 state N
EW 
ACCEPT     icmp --  0.0.0.0/0            192.168.0.0/24      
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 6
 prefix `FW: dropped outgoing locals: ' 
DROP       all  --  0.0.0.0/0            0.0.0.0/0           

Chain SPOOF (1 references)
target     prot opt source               destination         
SPOOFLOGDROP  all  --  10.0.0.0/8           0.0.0.0/0           
SPOOFLOGDROP  all  --  172.16.0.0/12        0.0.0.0/0           
SPOOFLOGDROP  all  --  168.254.0.0/16       0.0.0.0/0           
RETURN     all  --  192.168.0.0/24       0.0.0.0/0           
SPOOFLOGDROP  all  --  192.168.0.0/16       0.0.0.0/0           
RETURN     udp  --  0.0.0.0/8            0.0.0.0/0           udp spt:68 dpt:67 
SPOOFLOGDROP  all  --  0.0.0.0/8            0.0.0.0/0           
SPOOFLOGDROP  all  --  127.0.0.0/8          0.0.0.0/0           
SPOOFLOGDROP  all  --  255.0.0.0/8          0.0.0.0/0           

Chain SPOOFLOGDROP (7 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0 level 6
 prefix `FW: dropped SPOOF: ' 
DROP       all  --  0.0.0.0/0            0.0.0.0/0           


Thanks for any ideas.

Regs,
Sven
-- 
Sven Riedel                      sr@gimp.org
Liebigstr. 38 
30163 Hannover                  "Python is merely Perl for those who
                                 prefer Pascal to C" (anon)

