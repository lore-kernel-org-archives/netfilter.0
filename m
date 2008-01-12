From: "Steven Ayre" <steveayre@gmail.com>
Subject: Packet loss?
Date: Sat, 12 Jan 2008 13:59:07 +0000
Message-ID: <eafa772f0801120559p1cd3e2a4q41440060996efe11@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=Mm9BnF2cqbCpT5Gnyw7bwxaS2TKSH3AqVi3WEuPBVp8=;
        b=rGpO1fDOb+iSo+QE5HY5hyTOuzvnEvsYaVgtBZ+SrxzEtLohbNXepRsSr7b5lDJ2kdCVTVX2BA53wRWReXs7kJCp42vOHeSSJSu/KVyFEEzXvpjq4xnA45Cj7RCwsfvxhk7hB3ztJ4SVavloCmvYgUdeomTuDmea2GYR8fcxBNU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a Linux machine set up running an iptables firewall, acting as
a internet gateway for the LAN and performing SNAT on the POSTROUTING
chain.

This is working find 95% of the time, but there are certain websites
which I can't get onto. When I find one that doesn't work, it's always
repeatable. One such example is www.microsoft.com.

Here's the strange thing... I can connect fine to www.microsoft.com
(in reality an akadns.net server) from the Linux machine, but from any
machine on the LAN I can't connect. Having traced the packets going
in/out of the Linux machine on the WAN port I've found that the
following is happening:

From Linux machine:
OUT: [SYN] Seq=0 Len=0 MSS=1418 TSV=429048334 TSER=0 WS=1
IN:  [SYN,ACK] Seq=0 Ack=1 Win=8190 Len=0 MSS=1418
OUT: [ACK] Seq=1 Ack=1 Win=5672 Len=0
IN:  [TCP segment of reassembled PDU]
OUT: [ACK] Seq=1 Ack=34 Win=8190 Len=0
OUT: HTTP:
        GET /en/us/default.aspx HTTP/1/1\n
        HOST: www.microsoft.com\n
        \n
IN:  [ACK] Seq=1 Ack=59 Win=64735 Len=0
IN:  ...HTML response received...

From LAN machine:
OUT: [SYN] Seq=0 Len=0 MSS=1460
IN:  [SYN,ACK] Seq=0 Ack=1 Win=8190 Len=0 MSS=1460
OUT: [ACK] Seq=1 Ack=1 Win=17520 Len=0
IN:  [TCP segment of reassembled PDU]
OUT: [ACK] Seq=1 Ack=34 Win=8190 Len=0
OUT: HTTP:
        GET /en/us/default.aspx HTTP/1/1\n
        HOST: www.microsoft.com\n
        \n
IN:  [ACK] Seq=1 Ack=59 Win=63009 Len=0
...then nothing...


There is very little difference as far as I can see between the data
that's being sent - the Linux machine sends TSV, TSER, WS in the first
packet and the MSS and window sizes are different, but everything else
is identical. None of this should stop me receiving the HTTP response
should it?

The fact it works from the Linux machine itself is making me wonder if
it's firewall related - could there be anything there that'd stop this
working? Just to clarify, the dump above is of incoming traffic on the
WAN interface so we are definitely sending the request, getting ACKs
and the response is never received for the request sent from the LAN
machine. It is also not being dropped by the firewall, as first that's
a dump of what's coming into/leaving the machine on the WAN port and
secondly I log anything that's dropped and nothing is showing up in
the logs.

Here's a dump of my firewall rules using -t nat -l and -t filter -l:
eth0 == LAN
eth1 == WAN
eth2 == WLAN
tun0 == VPN

Table: nat
Chain PREROUTING (policy ACCEPT 5224 packets, 273K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 3477 packets, 190K bytes)
 pkts bytes target     prot opt in     out     source               destination
 3048  241K SNAT       0    --  *      eth1    0.0.0.0/0
0.0.0.0/0           to:81.174.234.210

Chain OUTPUT (policy ACCEPT 3916 packets, 306K bytes)
 pkts bytes target     prot opt in     out     source               destination

Table: filter
Chain INPUT (policy DROP 30 packets, 7715 bytes)
 pkts bytes target     prot opt in     out     source               destination
 175K  127M ACCEPT     0    --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
  996 69294 ACCEPT     0    --  lo     *       0.0.0.0/0            0.0.0.0/0
   39  5681 ACCEPT     0    --  eth0   *       0.0.0.0/0            0.0.0.0/0
   36  5641 ACCEPT     0    --  eth2   *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     0    --  tun0   *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           state NEW tcp dpt:22
   30  7715 LOG        0    --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 6 level 3 prefix `[INPUT DROP] : '

Chain FORWARD (policy DROP 2 packets, 131 bytes)
 pkts bytes target     prot opt in     out     source               destination
16254 7124K ACCEPT     0    --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
   50  3120 ACCEPT     0    --  eth0   *       0.0.0.0/0            0.0.0.0/0
 2618  126K ACCEPT     0    --  eth2   *       0.0.0.0/0            0.0.0.0/0
    0     0 ACCEPT     0    --  tun0   *       0.0.0.0/0            0.0.0.0/0
    1    40 LOG        0    --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 6 level 3 prefix `[FORWARD DROP] : '

Chain OUTPUT (policy ACCEPT 177K packets, 247M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       icmp --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID


Just in case it was the router which is connected to the Linux
machine's WAN port, I've already disabled the iptables based firewall
on that by setting all the chain policies to ACCEPT and flushing all
the chains.


Rgds,
-Steve
