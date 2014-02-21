From: Anthony Taylor <ataylor@fallsgeek.com>
Subject: Some oddities while setting up outbound filtering on a web server
Date: Fri, 21 Feb 2014 16:36:12 -0600
Message-ID: <CA+5v4QDMy8_aHARhn1r2s7nF6rTfUjFBZq7B6OH9eC0NdTFpjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm attempting to set up outbound filtering on a server to satisfy PCI
requirements.  Here is what I have so far:

iptables -L OUTPUT -n --line-numbers
Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination
1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
2    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
state RELATED,ESTABLISHED
3    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0
4    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8
# DNS
5    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
6    ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
# WHOIS
7    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:43
# SMTP
8    ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:25
# feeds.feedburner.com
9               tcp  --  0.0.0.0/0            74.125.0.0/16       tcp dpt:80
# akismet
10   ACCEPT     tcp  --  0.0.0.0/0            66.135.58.62        tcp dpt:80
11   ACCEPT     tcp  --  0.0.0.0/0            192.0.80.244        tcp dpt:80
12   ACCEPT     tcp  --  0.0.0.0/0            66.135.58.61        tcp dpt:80
13   ACCEPT     tcp  --  0.0.0.0/0            192.0.80.246        tcp dpt:80
# ubuntu updates
14   ACCEPT     tcp  --  0.0.0.0/0            91.189.92.201       tcp dpt:80
15   ACCEPT     tcp  --  0.0.0.0/0            91.189.88.149       tcp dpt:80
16   ACCEPT     tcp  --  0.0.0.0/0            91.189.91.13        tcp dpt:80
17   ACCEPT     tcp  --  0.0.0.0/0            91.189.92.200       tcp dpt:80
18   ACCEPT     tcp  --  0.0.0.0/0            91.189.91.14        tcp dpt:80
19   ACCEPT     tcp  --  0.0.0.0/0            91.189.91.15        tcp dpt:80
20   LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG
flags 0 level 4 prefix `fw-outbound: '

My problem is I'm seeing some traffic that I'm not sure I should be
seeing.  I get periodically some traffic from source port 80.  It's my
understanding that rule 2 above would filter these out.  When I try to
access the webserver I don't get anything to show up in logs.  Yet
still I'm getting entries like these:

[12989577.380311] fw-outbound: IN= OUT=venet0 SRC=205.186.153.230
DST=201.170.158.23 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0
 DF PROTO=TCP SPT=80 DPT=59799 WINDOW=0 RES=0x00 RST URGP=0
[12990368.808237] fw-outbound: IN= OUT=venet0 SRC=205.186.153.230
DST=24.153.148.198 LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=0
 DF PROTO=TCP SPT=80 DPT=55919 WINDOW=31 RES=0x00 ACK URGP=0

These usually happen in batches with a few of them for the same
destination IP happening at once.

I am also still getting traffic going to 74.125.0.0/16 as shown:

[12990030.361878] fw-outbound: IN= OUT=venet0 SRC=205.186.153.220
DST=74.125.228.233 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=4
4707 DF PROTO=TCP SPT=42954 DPT=80 WINDOW=14600 RES=0x00 SYN URGP=0
[12990390.327175] fw-outbound: IN= OUT=venet0 SRC=205.186.153.220
DST=74.125.228.78 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=20
052 DF PROTO=TCP SPT=53988 DPT=80 WINDOW=14600 RES=0x00 SYN URGP=0

I know that this traffic is my webserver contacting feedburner to grab
an rss feed, but shouldn't rule 9 keep these from logging?

I am also getting some weird traffic via ICMP.  This may have been
fixed as I modified rules 3 and 4 recently, but I still would like to
know what was going on with these entries.

[12971782.466219] fw-outbound: IN= OUT=venet0 SRC=205.186.153.230
DST=85.195.104.22 LEN=72 TOS=0x00 PREC=0xC0 TTL=64 ID=59097 PROTO=ICMP
TYPE=3 CODE=3  [SRC=85.195.104.22 DST=205.186.153.230 LEN=44 TOS=0x00
PREC=0x00 TTL=50 ID=0 DF PROTO=TCP SPT=80 DPT=63060 WINDOW=5840
RES=0x00 ACK SYN URGP=0 ]
[12975573.759745] fw-outbound: IN= OUT=venet0 SRC=205.186.153.230
DST=148.251.3.244 LEN=68 TOS=0x00 PREC=0xC0 TTL=64 ID=21963 PROTO=ICMP
TYPE=3 CODE=3
 [SRC=148.251.3.244 DST=205.186.153.230 LEN=40 TOS=0x00 PREC=0x00
TTL=47 ID=0 DF PROTO=TCP SPT=80 DPT=1234 WINDOW=0 RES=0x00 ACK RST
URGP=0 ]
[12979019.838420] fw-outbound: IN= OUT=venet0 SRC=205.186.153.230
DST=188.190.123.59 LEN=72 TOS=0x00 PREC=0xC0 TTL=64 ID=18440
PROTO=ICMP TYPE=3 CODE=
3 [SRC=188.190.123.59 DST=205.186.153.230 LEN=44 TOS=0x00 PREC=0x00
TTL=51 ID=0 DF PROTO=TCP SPT=80 DPT=9358 WINDOW=14600 RES=0x00 ACK SYN
URGP=0 ]
[12982328.005621] fw-outbound: IN= OUT=venet0 SRC=205.186.153.220
DST=69.172.201.19 LEN=72 TOS=0x00 PREC=0xC0 TTL=64 ID=50342 PROTO=ICMP
TYPE=3 CODE=3
 [SRC=69.172.201.19 DST=205.186.153.220 LEN=44 TOS=0x00 PREC=0x00
TTL=117 ID=62129 PROTO=TCP SPT=80 DPT=1234 WINDOW=8192 RES=0x00 ACK
SYN URGP=0 ]
[12982917.606388] fw-outbound: IN= OUT=venet0 SRC=205.186.153.220
DST=193.0.6.135 LEN=68 TOS=0x00 PREC=0xC0 TTL=64 ID=50191 PROTO=ICMP
TYPE=3 CODE=3 [
SRC=193.0.6.135 DST=205.186.153.220 LEN=40 TOS=0x00 PREC=0x00 TTL=246
ID=43720 DF PROTO=TCP SPT=43 DPT=41980 WINDOW=0 RES=0x00 ACK RST
URGP=0 ]


Thank you in advance for any help, I'm sorry if this message is long winded.

Anthony Taylor
---------------------
http://www.fallsgeek.com
(940)228-4580
Wichita Falls, TX
Your connection for everything geek...
