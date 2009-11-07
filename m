From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: TCPMSS - valid only in mangle table?
Date: Sat, 07 Nov 2009 13:33:04 +0100
Message-ID: <4AF56900.9040501@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

the man page of iptables says:

TCPMSS
       This target allows to alter the MSS value of TCP SYN packets, to 
control the maximum size for that connection (usually limiting it to 
your outgoing inter-
       face's  MTU  minus  40 for IPv4 or 60 for IPv6, respectively).  
Of course, it can only be used in conjunction with -p tcp.  It is only 
valid in the mangle
       table.

but when i put a TCPMSS rule into the filter table:

eris:~# iptables -I FORWARD -o eth2 -p tcp --syn -j TCPMSS --set-mss 1440

it shows up inserted:

eris:~# iptables -vnL FORWARD
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination
    2   104 TCPMSS     tcp  --  *      eth2    0.0.0.0/0            
0.0.0.0/0           tcp flags:0x17/0x02 TCPMSS set 1440
10758 6553K ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           state ESTABLISHED
    0     0 GLOBAL_INVALID_STATE  all  --  *      *       
0.0.0.0/0            0.0.0.0/0           state INVALID
  341 17732 BAD_TCP_PACKETS  tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0
    0     0 eth2_to_eth1  all  --  eth2   eth1    0.0.0.0/0            
0.0.0.0/0
  341 17732 eth1_to_eth2  all  --  eth1   eth2    0.0.0.0/0            
0.0.0.0/0
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           state RELATED
    0     0 LOG        all  --  *      *       0.0.0.0/0            
0.0.0.0/0           limit: avg 1/sec burst 3 LOG flags 0 level 6 prefix 
`IPT_DROP_FORWARD '
eris:~#

and it actually seems to work:

eris:~# tshark -n -i eth2 tcp port 80
273.366753 62.178.111.127 -> 193.99.144.85 TCP 1989 > 80 [SYN] Seq=0 
Len=0 MSS=1440 WS=0

So is the man page wrong?
 From what i know from the netfilter concept, packet alteration should 
be done in the mangle table, so the man page is right from theory, but 
practically the target extension does not care?

eris:~# uname -a
Linux eris 2.6.24-etchnhalf.1-686 #1 SMP Sat Aug 15 16:51:49 UTC 2009 
i686 GNU/Linux
eris:~# iptables --version
iptables v1.4.5

Thank you for clarification,

regards

Mart
