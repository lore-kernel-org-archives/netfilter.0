From: Tom Eastep <teastep@shorewall.net>
Subject: FTP Conntrack Anomaly
Date: Fri, 7 Jun 2002 08:13:34 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206070746090.2566-100000@wookie.shorewall.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users List <netfilter@lists.samba.org>

I'm seeing an intermittent anomaly with FTP connection tracking. When the 
server initiates an outbound active mode connection, that connection 
fails to be recognized as RELATED to the corresponding inbound connection. 

Here are the relevant rules:

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 142K   21M eth0_fwd   all  --  eth0   *       0.0.0.0/0            0.0.0.0/0
 168K  105M eth1_fwd   all  --  eth1   *       0.0.0.0/0            0.0.0.0/0

Chain eth0_fwd (1 references)
 pkts bytes target     prot opt in     out     source               destination
 127K   12M net2dmz    all  --  *      eth1    0.0.0.0/0            0.0.0.0/0

Chain net2dmz (1 references)
 pkts bytes target     prot opt in     out     source               destination
 118K   11M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED
 7515  402K ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          multiport dports 80,25,21,113,443,993,53,2401 state NEW

Chain eth1_fwd (1 references)
 pkts bytes target     prot opt in     out     source               destination
 147K   98M dmz2net    all  --  *      eth0    0.0.0.0/0            0.0.0.0/0

Chain dmz2net (1 references)
 pkts bytes target     prot opt in     out     source               destination
 139K   97M ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED
    2   120 LOG        tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          state NEW tcp spt:20 dpts:1024:65535 LOG flags 0 level 6 prefix `Shorewall:dmz2net:ACCEPT:'
    2   120 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          state NEW tcp spt:20 dpts:1024:65535

As you can see, a couple of outbound connections have failed the first
rule in the 'dmz2net' chain. I added the other two rules to log and accept
the outbound connection; before I added these rules, log messages showed
that clients experiencing this problem were totally unable to use active
mode to access my server. This leads me to believe that the problem is
associated with a particular type of FTP client but given the anonymity of 
FTP cleints, it is difficult to pin down.

Here are the associated log messages:

Jun  7 05:36:11 dmz2net:ACCEPT:IN=eth1 OUT=eth0 SRC=206.124.146.177 DST=xxx.xxx.xxx.xxx LEN=60 TOS=0x08 PREC=0x00 TTL=63 ID=35630 DF PROTO=TCP SPT=20 DPT=61238 WINDOW=5840 RES=0x00 SYN URGP=0
Jun  7 05:36:44 dmz2net:ACCEPT:IN=eth1 OUT=eth0 SRC=206.124.146.177 DST=xxx.xxx.xxx.xxx LEN=60 TOS=0x08 PREC=0x00 TTL=63 ID=12481 DF PROTO=TCP SPT=20 DPT=61239 WINDOW=5840 RES=0x00 SYN URGP=0

The destination IP was identical in both cases. The FTP server is 
Pure-ftpd 1.0.8.

Is anyone else seeing this?

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


