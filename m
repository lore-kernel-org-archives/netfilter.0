From: Kean Pedersen <zakarun@zakarun.dk>
Subject: Re: Running iptables behind router
Date: Tue, 24 Feb 2004 13:07:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040224120743.GA743@zaklinux.zakarun>
References: <20040216235513.GA1219@room101> <632269680.20040217093907@attla.net.ar> <20040224001308.GA10127@zaklinux.zakarun> <1077597076.394.7.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1077597076.394.7.camel@localhost>
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
To: netfilter <netfilter@lists.netfilter.org>

Almost same result:

MASQUERADE -o eth0:

Feb 24 12:57:47 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52225 SEQ=0
Feb 24 12:57:47 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=35954 PROTO=ICMP TYPE=0 CODE=0 ID=52225 SEQ=0
Feb 24 12:57:48 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52225 SEQ=256
Feb 24 12:57:48 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=35955 PROTO=ICMP TYPE=0 CODE=0 ID=52225 SEQ=256
Feb 24 12:57:49 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52225 SEQ=512
Feb 24 12:57:49 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=35956 PROTO=ICMP TYPE=0 CODE=0 ID=52225 SEQ=512
Feb 24 12:57:50 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52225 SEQ=768
Feb 24 12:57:50 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=35957 PROTO=ICMP TYPE=0 CODE=0 ID=52225 SEQ=768


Chain INPUT (policy ACCEPT 117K packets, 25M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy DROP 540 packets, 45332 bytes)
 pkts bytes target     prot opt in     out     source               destination
  890 74760 LOG        all  --  any    any     anywhere             anywhere            LOG level warning
  445 37380 ACCEPT     all  --  any    any     192.168.2.0/24       anywhere

Chain OUTPUT (policy ACCEPT 116K packets, 20M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain PREROUTING (policy ACCEPT 6774 packets, 630K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 10584 packets, 744K bytes)
 pkts bytes target     prot opt in     out     source               destination
    4   336 MASQUERADE  all  --  any    eth0    192.168.2.0/24       anywhere

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination


SNAT:

Chain INPUT (policy ACCEPT 119K packets, 25M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy DROP 544 packets, 45668 bytes)
 pkts bytes target     prot opt in     out     source               destination
  898 75432 LOG        all  --  any    any     anywhere             anywhere            LOG level warning
  449 37716 ACCEPT     all  --  any    any     192.168.2.0/24       anywhere

Chain OUTPUT (policy ACCEPT 117K packets, 20M bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain PREROUTING (policy ACCEPT 6790 packets, 632K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 10602 packets, 745K bytes)
 pkts bytes target     prot opt in     out     source               destination
    5   434 SNAT       all  --  any    any     192.168.2.0/24       anywhere            to:192.168.1.254

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Feb 24 12:59:14 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52481 SEQ=0
Feb 24 12:59:14 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=28144 PROTO=ICMP TYPE=0 CODE=0 ID=52481 SEQ=0
Feb 24 12:59:15 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52481 SEQ=256
Feb 24 12:59:15 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=28145 PROTO=ICMP TYPE=0 CODE=0 ID=52481 SEQ=256


SNAT with -o eth0:

Feb 24 13:00:25 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52993 SEQ=0
Feb 24 13:00:25 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=28152 PROTO=ICMP TYPE=0 CODE=0 ID=52993 SEQ=0
Feb 24 13:00:26 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101 DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=52993 SEQ=256
Feb 24 13:00:26 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42 DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=28153 PROTO=ICMP TYPE=0 CODE=0 ID=52993 SEQ=256



On Mon, Feb 23, 2004 at 11:31:16PM -0500, John A. Sullivan III wrote:
> Hmmm . . . I've always used SNAT instead of MASQUERADE.  Is it my
> imagination or are the SEQ numbers very strange in your log.  I wonder
> if there is some kind of loop.  What happens if you add an interface
> restriction to your MASQUERADE rule, i.e., from 192.168.2.0/24 -o eth0?
> What happens if you SNAT instead of MASQUERADE?
> 
> On Mon, 2004-02-23 at 19:13, Kean Pedersen wrote:
> > Okay... I have tried the solutions, but still can't connect from
> > 192.168.2 to 192.168.1
> > 
> > I can connect fine to 192.168.1.3 (the ip of eth0 on NAT box) from
> > 192.168.2.101 (the only machine apart from the NAT box on .2 network).
> > 
> > My network right now is:
> > 
> > Hardware router(192.168.1.1), the only access to Internet.
> > Desktop (192.168.1.42)
> > Server/NAT box (eth0:192.168.1.3 and eth1:192.168.2.1)
> > Laptop (192.168.2.101)
> > 
> > The hardware router, desktop and server:eth0 are on one switch, while
> > laptop and server:eth1 are on another switch.
> > 
> > Info from the server:
> > # uname -a
> > Linux luftguitar 2.4.25 #1 man feb 23 23:45:36 CET 2004 i586 GNU/Linux
> > 
> > # iptables -V
> > iptables v1.2.9
> > 
> > # iptables -t nat -L -v; iptables -L -v
> > Chain PREROUTING (policy ACCEPT 603 packets, 52677 bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> > 
> > Chain POSTROUTING (policy ACCEPT 630 packets, 49138 bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> >     2    84 MASQUERADE  all  --  any    any     192.168.2.0/24       anywhere            
> > 
> > Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> > 
> > Chain INPUT (policy ACCEPT 48705 packets, 4302K bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> > 
> > Chain FORWARD (policy DROP 97 packets, 8120 bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> >     4   336 LOG        all  --  any    any     anywhere             anywhere            LOG level warning 
> >     2   168 ACCEPT     all  --  any    any     192.168.2.0/24       anywhere            
> > 
> > Chain OUTPUT (policy ACCEPT 54057 packets, 13M bytes)
> >  pkts bytes target     prot opt in     out     source               destination         
> > 
> > # lsmod
> > Module                  Size  Used by    Not tainted
> > ipt_LOG                 3256   1  (autoclean)
> > ipt_state                472   0  (autoclean)
> > ipt_MASQUERADE          1208   1  (autoclean)
> > iptable_nat            14414   1  (autoclean) [ipt_MASQUERADE]
> > ip_conntrack           18468   0  (autoclean) [ipt_state ipt_MASQUERADE iptable_nat]
> > iptable_filter          1612   1  (autoclean)
> > ip_tables              11360   7  [ipt_LOG ipt_state ipt_MASQUERADE iptable_nat iptable_filter]
> > 
> > (and I have enabled ip forwarding)
> > 
> > I then try a ping from my laptop (192.168.2.101) to my desktop (192.168.1.42),
> > but all packes are lost. The packet count on iptables -L -v goes up for
> > postrouting/masquerade and forward/accept.
> > Looking in syslog the following is logged:
> > 
> > Feb 24 00:49:02 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101
> > DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP
> > TYPE=8 CODE=0 ID=65281 SEQ=0 
> > Feb 24 00:49:02 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42
> > DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=34538 PROTO=ICMP
> > TYPE=0 CODE=0 ID=65281 SEQ=0 
> > Feb 24 00:49:03 server kernel: IN=eth1 OUT=eth0 SRC=192.168.2.101
> > DST=192.168.1.42 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=ICMP
> > TYPE=8 CODE=0 ID=65281 SEQ=256 
> > Feb 24 00:49:03 server kernel: IN=eth0 OUT=eth1 SRC=192.168.1.42
> > DST=192.168.2.101 LEN=84 TOS=0x00 PREC=0x00 TTL=63 ID=34539 PROTO=ICMP
> > TYPE=0 CODE=0 ID=65281 SEQ=256 
> > 
> > I can ping the server on 192.168.2.1 and 192.168.1.3 fine from
> > 192.168.2.101, but cannot reach the desktop (192.168.1.42) or the
> > hardware router 192.168.1.1, and thus not the Internet.
> > 
> > --
> > Kean Pedesen
> > 
> > 
> > On Tue, Feb 17, 2004 at 09:39:07AM -0300, Alexis wrote:
> > > yes, do this
> > > 
> > > 
> > > echo 1 > /proc/sys/net/ipv4/ip_forward
> > > 
> > > iptables -p FORWARD DROP
> > > 
> > > iptables -A FORWARD -s 192.168.2.0/24 -j ACCEPT
> > > 
> > > then, you have 2 options
> > > 
> > > 1 to use 1 ip of 192.168.1 to nat all the .2 network, or use a pool,
> > > its your choice
> > > 
> > > 1st case
> > > iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to
> > > 192.168.1.254
> > > 
> > > or
> > > 
> > > iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE
> > > 
> > > 
> > > 2nd case
> > > 
> > > iptables  -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to
> > > 192.168.1.50-192.168.1.60
> > > 
> > > 
> > > 
> > > 
> > > Hello Kean,
> > > 
> > > Monday, February 16, 2004, 8:55:14 PM, you wrote:
> > > 
> > > KP> Hi, I have some problems setting up iptables on a linux box, acting as a
> > > KP> router between two networks. I have an internet connection through a
> > > KP> hardware router, which I have no access to. This router uses NAT, and
> > > KP> has an interface on 192.168.1.1. So far I've had my LAN on
> > > KP> 192.168.1.0/24, with no problems, but would like to split it into two
> > > KP> LANs, one on 192.168.1.0/24, having the hardware router and some hosts,
> > > KP> and another one on 192.168.2.0/24, acting as an "internal" LAN.
> > > 
> > > KP> I'd then like to connect these two LANs with a linux box running
> > > KP> iptables, so the both LANs have access to the internet through the
> > > KP> hardware router.
> > > 
> > > KP> I sat up the iptables machine (which have two NICs) to the IPs
> > > KP> 192.168.1.100 and 192.168.2.100, one on each interface. How should I set
> > > KP> up iptables, so the 192.168.2.0/24 range have access through iptables,
> > > KP> and further through the hardware router onto the internet? Only outbound
> > > KP> connections will be made. (Inbound connections are mapped in the
> > > KP> hardware router to 192.168.1.x to specific hosts, no problem there).
> > > 
> > > KP> The computers on the 192.168.2.0/24 range should be able to make
> > > KP> connections to the 192.168.1.0/24 range, but not the other way around.
> > > 
> > > KP> Any help is appreciated.
> > > 
> > > KP> --
> > > KP> Kean Pedersen
> > > 
> > > 
> > > -- 
> > > Best regards,
> > >  Alexis                            mailto:alexis@attla.net.ar
> > > 
> > > 
> -- 
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> 

