From: Giovanni Cardone <g_cardone@libero.it>
Subject: Re: ip_conntrack_ftp doesn't work
Date: Wed, 26 Jun 2002 02:17:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020626021742.A316@rainbow>
References: <20020625113146.B255@rainbow> <Pine.LNX.4.33.0206251200261.4927-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0206251200261.4927-100000@blackhole.kfki.hu>; from kadlec@blackhole.kfki.hu on Tue, Jun 25, 2002 at 12:03:24PM +0200
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Tue, Jun 25, 2002 at 12:03:24PM +0200, you wrote:
> But were there any 'partial' FTP requests detected by the module
> according to the kernel log?

The only place I know to look in is /proc/net/ip_conntrack(I hope you are 
talking about this now...). For example, when I do :

darkstar\$ ftp 195.210.93.14 

it looks like :

darkstar\$ cat /proc/net/ip_conntrack
tcp      6 431998 ESTABLISHED src=151.26.68.170 dst=195.210.93.14 sport=1052
dport=21 src=195.210.93.14 dst=151.26.68.170 sport=21 dport=1052 [ASSURED]
use=1 
EXPECTING: proto=6 src=195.210.93.14 dst=151.26.68.170 sport=0 dport=1053

In the iptables logs I see :

Jun 26 01:51:59 darkstar kernel: ip_tables: (C) 2000-2002 Netfilter core team
Jun 26 01:51:59 darkstar kernel: ip_conntrack (511 buckets, 4088 max)
Jun 26 01:52:19 darkstar kernel: +SYN IN=ppp0 OUT= MAC= SRC=195.210.93.107
DST=151.2 6.68.170 LEN=60 TOS=0x08 PREC=0x00 TTL=58 ID=33120 DF PROTO=TCP 
SPT=20 DPT=1053 WINDOW=32120 RES=0x00 SYN URGP=0 


But now it comes for me the strange part...
Now I tried to do ftp to another server, ftp.unina.it. Passive FTP now it
seems to work.

After I logged in the server, I tried the ls command and it works. To be sure
about the fact that I was using Passive mode, I did :

darkstar\# tcpdump port 20
02:01:26.828426 192.132.34.17.ftp-data > 151.26.68.170.1061: S
1536506260:1536506260(0) win 32768 <mss 1460,nop,wscale 0> (DF)
02:01:26.828491 151.26.68.170.1061 > 192.132.34.17.ftp-data: S
4196382663:4196382663(0) ack 1536506261 win 5840 <mss 1460,nop,wscale 0> (DF)

and so on like those two. So a data channel was opened...
But if I do :

darkstar\# lsmod | egrep 'ftp'
ip_conntrack_ftp        3120   0  (unused)
ip_conntrack           13264   2  [ipt_state ip_conntrack_ftp]

it shows unused, but it's working I believe...
The proc file system :

darkstar\# cat /proc/net/ip_conntrack
tcp      6 117 TIME_WAIT src=192.132.34.17 dst=151.26.68.170 sport=20
dport=1067 src=151.26.68.170 dst=192.132.34.17 sport=1067 dport=20 [ASSURED]
use=1 
tcp      6 431997 ESTABLISHED src=151.26.68.170 dst=192.132.34.17 sport=1066
dport=21 src=192.132.34.17 dst=151.26.68.170 sport=21 dport=1066 [ASSURED]
use=2 
udp      17 12 src=151.26.68.170 dst=193.70.192.25 sport=1027 dport=53
src=193.70.192.25 dst=151.26.68.170 sport=53 dport=1027 use=1 



That's all I know at this time. I'm really new to Netfilter :( Is there other 
I can do to provide more info about my situation? Let me know please.


Thanks

