From: Brent Clark <bclark@eccotours.co.za>
Subject: use of -m  limit for Syn Flood protection
Date: Sat, 14 Oct 2006 15:16:34 +0200
Message-ID: <4530E332.4090306@eccotours.co.za>
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

Hey all

In my continuous quest to understand TCP and netfilter / iptables more, I have started experimenting with rate limiting and different TCP Flags.

On my Lan I have mail server and obviously ident requests are perform etc, so I currently im trying this

# we allow 4 TCP connects per second, no more
$IPT -N syn-flood
$IPT -A syn-flood -m limit --limit 1/s --limit-burst 4 -j LOG --log-level info --log-prefix '#### Syn Flood ####'
$IPT -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
$IPT -A syn-flood -j DROP

$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p tcp --syn -j syn-flood

so now I get this

Oct 14 14:51:46 gate kernel: #### Syn Flood ####IN=eth1 OUT=eth0 SRC=192.168.111.11 DST=218.15.249.32 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=23007 DF PROTO=TCP SPT=40108 DPT=113 WINDOW=5840 RES=0x00 SYN 
URGP=0
Oct 14 14:51:49 gate kernel: #### Syn Flood ####IN=eth1 OUT=eth0 SRC=192.168.111.11 DST=218.15.249.32 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=23008 DF PROTO=TCP SPT=40108 DPT=113 WINDOW=5840 RES=0x00 SYN 
URGP=0
Oct 14 14:51:55 gate kernel: #### Syn Flood ####IN=eth1 OUT=eth0 SRC=192.168.111.11 DST=218.15.249.32 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=23009 DF PROTO=TCP SPT=40108 DPT=113 WINDOW=5840 RES=0x00 SYN 
URGP=0
Oct 14 14:52:07 gate kernel: #### Syn Flood ####IN=eth1 OUT=eth0 SRC=192.168.111.11 DST=218.15.249.32 LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=23010 DF PROTO=TCP SPT=40108 DPT=113 WINDOW=5840 RES=0x00 SYN 
URGP=0

So my question is, have I maybe been to aggressive on the limit.

I use the -j syn-flood for both FORWARD and INPUT

