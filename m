From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Wed, 1 Dec 2004 21:44:13 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412012128370.22471-100000@gollum.grajagan.net>
References: <1101964546.2025.149.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101964546.2025.149.camel@localhost>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 2 Dec 2004 at 00:15 -0500, John A. Sullivan III wrote:

[snip]
JASI> Interesting.  You've showed us what you think you have.  Would you
JASI> kindly show us what you do have.
JASI> Do a 
JASI> iptables -v -n -t nat -L
JASI> iptables -v -n -L FORWARD
JASI> iptables -v -n -L INPUT
JASI> 
JASI> If I'm following this correctly, the esp packets should hit your NAT
JASI> rule and have the destination changed.  It should then hit the routing
JASI> table which will determine that the packet is not local and send it to
JASI> the FORWARD chain.  If you are not logging packets on the FORWARD chain,
JASI> perhaps the match is wrong.  Try a generic log rule for all packets and
JASI> see what the packets look like on the FORWARD chain.  Do they match the
JASI> rules dumped in the above list? - John

ok... I now have: 

[helgew@gollum ~]# iptables -v -n -t nat -L                                                                                                     
Chain PREROUTING (policy ACCEPT 1380 packets, 95540 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 prefix `all preroute: ' 
    0     0 LOG        esp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 prefix `esp route: ' 
    0     0 DNAT       esp  --  eth0   *       0.0.0.0/0            0.0.0.0/0          to:10.0.0.200 

Chain POSTROUTING (policy ACCEPT 586 packets, 45154 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 prefix `masq: ' 
    0     0 MASQUERADE  all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          

Chain OUTPUT (policy ACCEPT 1207 packets, 93374 bytes)
 pkts bytes target     prot opt in     out     source               destination         
[helgew@gollum ~]# iptables -v -n -L FORWARD                                                                                                    
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 prefix `all fwd: ' 
    0     0 LOG        esp  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 prefix `esp fwd: ' 
    0     0 ACCEPT     esp  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          
    0     0 ACCEPT     all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
    0     0 ACCEPT     all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0          
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 prefix `dropped: ' 
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          
[helgew@gollum ~]# iptables -v -n -L INPUT                                                                                                      
Chain INPUT (policy ACCEPT 10 packets, 1176 bytes)
 pkts bytes target     prot opt in     out     source               destination         
[helgew@gollum ~]# 

and the log shows:

VPN tunnel establishment:
Dec  1 21:34:10 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=104 TOS=0x00 PREC=0x00 TTL=64 ID=8317 PROTO=UDP SPT=500 DPT=500 LEN=84 
Dec  1 21:34:10 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=104 TOS=0x00 PREC=0x00 TTL=63 ID=8317 PROTO=UDP SPT=500 DPT=500 LEN=84 
Dec  1 21:34:10 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=104 TOS=0x00 PREC=0x00 TTL=63 ID=8317 PROTO=UDP SPT=500 DPT=500 LEN=84 
Dec  1 21:34:16 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=274 TOS=0x00 PREC=0x00 TTL=63 ID=8322 PROTO=UDP SPT=500 DPT=500 LEN=254 
Dec  1 21:34:16 gollum kernel: all fwd: IN=eth0 OUT=eth1 SRC=(VPN SERVER IP) DST=10.0.0.200 LEN=356 TOS=0x00 PREC=0x00 TTL=49 ID=19301 PROTO=UDP SPT=500 DPT=500 LEN=336 
Dec  1 21:34:17 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=80 TOS=0x00 PREC=0x00 TTL=63 ID=8328 PROTO=UDP SPT=500 DPT=500 LEN=60 
Dec  1 21:34:18 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=112 TOS=0x00 PREC=0x00 TTL=63 ID=8332 PROTO=UDP SPT=500 DPT=500 LEN=92 
Dec  1 21:34:18 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=256 TOS=0x00 PREC=0x00 TTL=63 ID=8335 PROTO=UDP SPT=500 DPT=500 LEN=236 
Dec  1 21:34:18 gollum kernel: all fwd: IN=eth0 OUT=eth1 SRC=(VPN SERVER IP) DST=10.0.0.200 LEN=192 TOS=0x00 PREC=0x00 TTL=49 ID=19304 PROTO=UDP SPT=500 DPT=500 LEN=172 
Dec  1 21:34:19 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=88 TOS=0x00 PREC=0x00 TTL=63 ID=8341 PROTO=UDP SPT=500 DPT=500 LEN=68 
Dec  1 21:34:19 gollum kernel: all fwd: IN=eth0 OUT=eth1 SRC=(VPN SERVER IP) DST=10.0.0.200 LEN=104 TOS=0x00 PREC=0x00 TTL=49 ID=19305 PROTO=UDP SPT=500 DPT=500 LEN=84 

ping of VPN host:
Dec  1 21:38:37 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=64 ID=8977 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:37 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=63 ID=8977 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:37 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=63 ID=8977 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:38 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=64 ID=8981 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:38 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=63 ID=8981 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:38 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=63 ID=8981 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:39 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=64 ID=8986 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:39 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=63 ID=8986 PROTO=ESP SPI=0x2e9dc0d2 
Dec  1 21:38:39 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=136 TOS=0x00 PREC=0x00 TTL=63 ID=8986 PROTO=ESP SPI=0x2e9dc0d2 

ping of VPN server:
Dec  1 21:42:28 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=9650 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=0 
Dec  1 21:42:28 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=9650 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=0 
Dec  1 21:42:28 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=9650 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=0 
Dec  1 21:42:29 gollum kernel: all fwd: IN=eth0 OUT=eth1 SRC=(VPN SERVER IP) DST=10.0.0.200 LEN=84 TOS=0x00 PREC=0x00 TTL=49 ID=19796 PROTO=ICMP TYPE=0 CODE=0 ID=6817 SEQ=0 
Dec  1 21:42:29 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=9656 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=1 
Dec  1 21:42:29 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=9656 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=1 
Dec  1 21:42:29 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=9656 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=1 
Dec  1 21:42:30 gollum kernel: all fwd: IN=eth0 OUT=eth1 SRC=(VPN SERVER IP) DST=10.0.0.200 LEN=84 TOS=0x00 PREC=0x00 TTL=49 ID=19797 PROTO=ICMP TYPE=0 CODE=0 ID=6817 SEQ=1 
Dec  1 21:42:30 gollum kernel: all preroute: IN=eth1 OUT= MAC=00:c0:4f:22:05:03:00:30:65:1f:ed:0a:08:00 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=9662 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=2 
Dec  1 21:42:30 gollum kernel: all fwd: IN=eth1 OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=9662 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=2 
Dec  1 21:42:30 gollum kernel: masq: IN= OUT=eth0 SRC=10.0.0.200 DST=(VPN SERVER IP) LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=9662 PROTO=ICMP TYPE=8 CODE=0 ID=6817 SEQ=2 
Dec  1 21:42:31 gollum kernel: all fwd: IN=eth0 OUT=eth1 SRC=(VPN SERVER IP) DST=10.0.0.200 LEN=84 TOS=0x00 PREC=0x00 TTL=49 ID=19798 PROTO=ICMP TYPE=0 CODE=0 ID=6817 SEQ=2 

otherwise... silence :( I don't see ping replies through the tunnel or the 
server side initiated packets

h.


