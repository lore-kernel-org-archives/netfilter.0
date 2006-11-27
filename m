From: gypsy <gypsy@iswest.com>
Subject: Passive FTP sees remote's _internal_ IP!!??
Date: Mon, 27 Nov 2006 07:32:57 -0800
Message-ID: <456B0529.BFBFE757@iswest.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

William Lima wrote:
> 
> Dear,
> 
> Load modules:
> 
> modprobe ip_nat_ftp
> 
> Abs,

Nope:

#!/bin/bash
modprobe ip_nat_ftp
iptables -P FORWARD ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.223.0/24 -j SNAT --to
68.171.136.91
iptables -A FORWARD -j LOG

Module                  Size  Used by    Not tainted
ipt_LOG                 3448   1  (autoclean)
iptable_filter          1772   1  (autoclean)
ip_conntrack_ftp        3728   1  (autoclean)
ip_nat_ftp              2640   0  (unused)
iptable_nat            17542   2  [ip_nat_ftp]
iptable_mangle          2168   0  (autoclean) (unused)
ip_tables              11840   6  [ipt_LOG iptable_filter iptable_nat
iptable_mangle]

Nov 26 17:20:35 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=61924 DF PROTO=TCP
SPT=2105 DPT=2336 WINDOW=60352 RES=0x00 SYN URGP=0 
Nov 26 17:20:36 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=61951 DF PROTO=TCP
SPT=2106 DPT=2337 WINDOW=60352 RES=0x00 SYN URGP=0 
Nov 26 17:20:39 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=61957 DF PROTO=TCP
SPT=2106 DPT=2337 WINDOW=60352 RES=0x00 SYN URGP=0 
Nov 26 17:20:45 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=61958 DF PROTO=TCP
SPT=2106 DPT=2337 WINDOW=60352 RES=0x00 SYN URGP=0 

We don't think this is a netfilter problem.  The kernel should tell the
remote end that it can't use the "nonroutable" IP - shouldn't it?
--
gypsy

> 2006/11/26, gypsy <gypsy@iswest.com>:
> > In our network, we have 2 gateways.  The main GW is a Slackware 10.0 box
> > and the other is a SonicWALL firewall appliance.  Each connects to a
> > different external IP but both are in the same /29 network.
> >
> > Note: No machine in our LAN has an IP of 192.168.1.11.
> >
> > When the default GW is set to the linux box (192.168.223.254) and
> > passive FTP to a remote server is initiated, the FTP fails after
> > connection because the internal IP of the remote machine (192.168.1.11)
> > is seen rather than its external IP.  This problem occurs only when
> > passive FTP is used.
> >
> > We do not believe that the OS or FTP daemon of the remote host matters
> > because when the default GW is set to the SonicWALL (192.168.223.1), the
> > passive FTP succeeds.
> >
> > Therefore, we conclude that there is something wrong with our linux box.
> >
> > But WHAT?
> >
> > Note that the connection has already occurred when port negotation is
> > attempted - which is when the FTP fails.
> >
> > If anyone has advice, we will sincerely appreciate it.
> >
> > The kernel is 2.4.32.
> >
> > #!/bin/bash
> > iptables -P FORWARD ACCEPT
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -t nat -A POSTROUTING -o eth1 -s 192.168.223.0/24 -j SNAT --to
> > 68.171.136.91
> > iptables -A FORWARD -j LOG
> >
> > Nov 26 00:32:10 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> > DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56473 DF PROTO=TCP
> > SPT=1069 DPT=1090 WINDOW=60352 RES=0x00 SYN URGP=0
> > Nov 26 00:32:10 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> > DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56500 DF PROTO=TCP
> > SPT=1070 DPT=1091 WINDOW=60352 RES=0x00 SYN URGP=0
> > Nov 26 00:32:14 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> > DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56506 DF PROTO=TCP
> > SPT=1070 DPT=1091 WINDOW=60352 RES=0x00 SYN URGP=0
> > Nov 26 00:32:20 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> > DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56507 DF PROTO=TCP
> > SPT=1070 DPT=1091 WINDOW=60352 RES=0x00 SYN URGP=0
> > --
> > gypsy
> >
> >
> 
> --
> William R. Lima
> wrochalima@linuxit.com.br

