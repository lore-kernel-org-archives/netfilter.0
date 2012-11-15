From: Vladimir Budnev <vladimir.budnev@gmail.com>
Subject: Iptables rules with module string give strange counter results
Date: Thu, 15 Nov 2012 17:01:08 +0300
Message-ID: <CAAvRK96MCUh4XmeDVd8VU+P5_QvxO6D1_RYHxWBO6MPcOWCRKw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=qFDwycPxuHoLsIUsiBW8hpY9SYder+xJ4zhtaOy+IUQ=;
        b=Bdmk0eoR+Wj894LnCqMz6CADe1YV6HrSAk0zLY69P/cuMznOK9fQ2tviHAs5bhmeUP
         bL0PmtwKWDV10jwLa8hpgnwOoCaGfvFuF/bI3R7DYjTnq/3KYXIo1m9ALclEuQisNyOI
         QBtxDS6i26jH/anbAGeLylSiYoTiA75CGzxgeg7SYxKPmt/R+5dng2Wy6Wz+2uQWBR+r
         3kkyV5+QpV5k/RSq3y8RtGHBGuaGtOjy0y71XxenDd6voQ3lCiRCx+xa7WB5E89rzM6s
         0FeQvwVvxhj8X2J1m+KGOZtnDyhrajGDW4GAcbvPnPxq+F+U0gcYNgbfZuey6g3/eV0h
         XunA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-firewall@lists.debian.org
Cc: netfilter@vger.kernel.org

Hello al.

This is the first time I'm using matching string module for iptables
and met some strange behaviour I can't overcome.

In short, it looks like iptables passes "trimmed" packets to module,
so module can not parse whole packet for string.
I cant find any information about such behaviour on net. All examples
and tutors should work like a charm, but they dont.

Now in details.

OS: debian testing, kernel 3.2.0-3-686-pae
IPTABLES: iptables v1.4.14
OTHER:

 tcpdump version 4.3.0,
 libpcap version 1.3.0

# lsmod|grep ipt
ipt_LOG                12533  0
iptable_nat            12800  0
nf_nat                 17924  1 iptable_nat
nf_conntrack_ipv4      13726  3 nf_nat,iptable_nat
nf_conntrack           43121  3 nf_conntrack_ipv4,nf_nat,iptable_nat
iptable_filter         12488  0
ip_tables              17079  2 iptable_filter,iptable_nat
x_tables               18121  6
ip_tables,iptable_filter,iptable_nat,xt_string,xt_tcpudp,ipt_LOG



I'v reseted all rules to default and added only two rules in following order:
iptables -t filter -A OUTPUT --protocol tcp --dport 80 --match string
--algo bm --from 0 --to 1500 --string "/index.php" --jump LOG
--log-prefix "matched :"
iptables -t filter -A OUTPUT --protocol tcp --dport 80 --jump LOG
--log-prefix "OUT : "

The idea is obious - match requests to any ip to port 80 containing
string /index.php and print them to log, and also log all the data
passed to 80 port.

So the iptables -L -xvn :

Chain INPUT (policy ACCEPT 3 packets, 693 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain OUTPUT (policy ACCEPT 3 packets, 184 bytes)
    pkts      bytes target     prot opt in     out     source
     destination
       0        0 LOG        tcp  --  *      *       0.0.0.0/0
   0.0.0.0/0            tcp dpt:80 STRING match  "/index.php" ALGO
name bm TO 1500 LOG flags 0 level 4 prefix "matched :"
       0        0 LOG        tcp  --  *      *       0.0.0.0/0
   0.0.0.0/0            tcp dpt:80 LOG flags 0 level 4 prefix "OUT : "


Counters for rules are zeroed.

Ok, now browser goes to www.gentoo.org/index.php. This is the only
request url in browser.
And I get the following for iptables -t filter -L -xvn:

Chain INPUT (policy ACCEPT 61 packets, 16657 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source
     destination

Chain OUTPUT (policy ACCEPT 63 packets, 4394 bytes)
    pkts      bytes target     prot opt in     out     source
     destination
       1      380 LOG        tcp  --  *      *       0.0.0.0/0
   0.0.0.0/0            tcp dpt:80 STRING match  "/index.php" ALGO
name bm TO 1500 LOG flags 0 level 4 prefix "matched :"
      13     1392 LOG        tcp  --  *      *       0.0.0.0/0
   0.0.0.0/0            tcp dpt:80 LOG flags 0 level 4 prefix "OUT : "


So we have only ONE match for 1st rule. But that is wrong. Here is
tcpdump for output for connection.
First ip request 89.16.167.134:

<handshake omitted>
16:56:38.440308 IP 192.168.66.106.54704 > 89.16.167.134.80: Flags
[P.], seq 1:373, ack 1, win 913,
options [nop,nop,TS val 85359 ecr 3026115253], length 372
<...>
	0x0030:  b45e dab5 4745 5420 2f69 6e64 6578 2e70  .^..GET./index.p
	0x0040:  6870 2048 5454 502f 312e 310d 0a48 6f73  hp.HTTP/1.1..Hos
	0x0050:  743a 2077 7777 2e67 656e 746f 6f2e 6f72  t:.www.gentoo.or
	0x0060:  670d 0a55 7365 722d 4167 656e 743a 204d  g..User-Agent:.M
	0x0070:  6f7a 696c 6c61 2f35 2e30 2028 5831 313b  ozilla/5.0.(X11;


Here we see one match in HTTP GET. Ok some packets later we have
request for some more content to ip 140.211.166.176:
16:56:38.772432 IP 192.168.66.106.59766 > 140.211.166.176.80: Flags
[P.], seq 1:329, ack 1, win 913,
options [nop,nop,TS val 85442 ecr 110101513], length 328
<...>
	0x0030:  0690 0409 4745 5420 2f20 4854 5450 2f31  ....GET./.HTTP/1
<...>
	0x0130:  6566 6c61 7465 0d0a 436f 6e6e 6563 7469  eflate..Connecti
	0x0140:  6f6e 3a20 6b65 6570 2d61 6c69 7665 0d0a  on:.keep-alive..
	0x0150:  5265 6665 7265 723a 2068 7474 703a 2f2f  Referer:.http://
	0x0160:  7777 772e 6765 6e74 6f6f 2e6f 7267 2f69  www.gentoo.org/i
	0x0170:  6e64 6578 2e70 6870 0d0a 0d0a            ndex.php....

Here we see "/index.php" again.

But LOG rule gives the following info:

kernel: [  641.386182] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=89.16.167.134 LEN=60
kernel: [  641.435946] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=89.16.167.134 LEN=52
kernel: [  641.436226] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=89.16.167.134 LEN=424
kernel: [  641.512594] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=89.16.167.134 LEN=52
kernel: [  641.512762] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=89.16.167.134 LEN=52
kernel: [  641.512819] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=89.16.167.134 LEN=52
kernel: [  641.567496] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=60
kernel: [  641.767707] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=52
kernel: [  641.768328] matched :IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=380 <--
kernel: [  641.768352] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=380
kernel: [  641.990287] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=52
kernel: [  641.990455] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=52
kernel: [  641.990507] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=52
kernel: [  641.990559] OUT : IN= OUT=eth0 SRC=192.168.66.106
DST=140.211.166.176 LEN=52

So we have match on only one packet, going to 140.211.166.176. But
where is the first match?
The more strange for me is that on ither machine with ubuntu, it gives
different counters, like 6 matches for string.

Mb there is some kind of options to tune module data passing or smth?

Tnx in advance.
