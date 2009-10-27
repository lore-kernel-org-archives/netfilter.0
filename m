From: codingfreak <adapa.ajith@gmail.com>
Subject: IPtables  and SNAT
Date: Mon, 26 Oct 2009 22:08:32 -0700 (PDT)
Message-ID: <ee114c7a-303d-4776-8562-314387348ec8@g1g2000pra.googlegroups.com>
References: <95ac437a-3f19-490a-80d0-3ce0a20850ed@y10g2000prg.googlegroups.com> 
	<46ee7b1c0910212155pd99519cw9831d4bb7d7f3064@mail.gmail.com> 
	<b8dec168-132d-4fba-9d09-fbb5554c339d@m7g2000prd.googlegroups.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b8dec168-132d-4fba-9d09-fbb5554c339d@m7g2000prd.googlegroups.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: codingfreak <adapa.ajith@gmail.com>
Cc: netfilter@vger.kernel.org

Hi

I am a newbie to iptables with NAT. My network setup is as shown below


                      linuxbox2 (192.x.y.a)
                                    |
    (194.160.1.1)             |
    linuxbox1(eth1)-------- Switch ----- ftpserver
    (192.x.y.b)

BOX1 and BOX2 are in VLAN tagging via switch. BOX1 is in a VLAN tag
with FTPserver. So BOX2 inorder to connect to the FTPserver should
route via BOX1 which should has to do POSTROUTING(SNAT) and send the
FTP packets to FTPserver.

eth1 interface is configured with 2 ip-addresses one public and one
private addresses.

All the traffic from BOX2 is routed to BOX1. I added following rules
in my iptables setup present in BOX1

    $IPTABLES -t mangle -A PREROUTING -p tcp --dport 21 -s 192.x.y.a -
j ACCEPT
    $IPTABLES -t mangle -A FORWARD -p tcp --dport 21 -s 192.x.y.a -m
conntrack --ctstate NEW,ESTABLISHED,RELATED -j ACCEPT
    $IPTABLES -t nat -A POSTROUTING -s 192.x.y.a -p tcp --dport 21 -j
SNAT --to-source 194.160.1.1

If I ping from BOX2 to BOX1 it is working fine. If I try to perform
ftp to the Ftpserver then NAT table in iptables script present in BOX1
is invoked and ftp is not successfull.

If I do the tcpdump at eth1 I do see ftp packets coming from BOX2 to
BOX1 but no packets leaving from BOX1 to ftpserver.

    IP 192.x.y.a.45388 > 10.p.q.r.21(ftpserver): S
1380128644:1380128644(0)
    win 5840 <mss 1460,sackOK,timestamp 16897 0,nop,wscale 2>
    IP 192.x.y.a.45388 > 10.p.q.r.21: S 1380128644:1380128644(0)
    win 5840 <mss 1460,sackOK,timestamp 17647 0,nop,wscale 2>
    IP 192.x.y.a.45388 > 10.p.q.r.21: S 1380128644:1380128644(0)
    win 5840 <mss 1460,sackOK,timestamp 19147 0,nop,wscale 2>

Actually 3 packets are sent from BOX2 to BOX1. Counters for various
chains like prerouting, forward shows count as 3 while POSTROUTING
chain in NAT table shows a count of 1. But TCPDUMP doesnt show any
packet leaving to FTPSERVER.

So is the packet that entered the POSTROUTING chain dropped ??

**NOTE: All my IPTABLE rules should be based on ip-address but not on
interface as there is a chance of change in interface names but in ip-
addresses.**
