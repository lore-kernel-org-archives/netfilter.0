From: Zen Kato <zenkato@pis.bekkoame.ne.jp>
Subject: iptables and sip REGISTER
Date: Sun, 31 Aug 2003 23:18:26 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030831231826A.zenkato@pis.bekkoame.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I configured iptables V1.2.5 as follows for sip hard/soft phones
could REGISTER, INVITE and could talk each other on the local
network(192.168.100.0/24) via 192.168.100.30 using SNAT and
dynamic DNS(tel.no-ip.com). 

I could send udp test data from .100.11(FreeBSD4.8) to .100.26(
sip proxy(SER-0.8.10), tel.no-ip.com:5064), but when BT101 sent
real "REGISTER" packet to .100.26, .100.30(eth0) just sent back
"destination unreachable" to .100.7.

(NOTE: http://tel.no-ip.com works fine on .100.11)

It looks like the same IP headers between SENDIP's udp test data
and BT101's udp "REGISTER" packet except data lengths.

My questions are:
(1) Why not BT101 can send udp packet to .100.26?
(2) Why SENDIP's trailer was changed from "2B2801...." to
    "000...." when it goes from (.100.11->.100.30) to
    (.100.30->.100.26)?



        ========
        Internet
        ========
           |global address(DHCP) 
       -----------
       | ADSL    |
       | modem   |
       | w/router|
       -----------
           |.1           192.168.0.0/24
      --------------------------------
                   |.30(eth1,eth1:0 tel.no-ip.com)
              -------------------
              | RHL7.3          |
              | Linux-2.4.18-3  |
              | iptables V1.2.5 |
              -------------------
                   |.30(eth0)     192.168.100.0/24
          ----------------------------------------
            |.11         |.7          |.26
         ------------  -------     ------------
         |FreeBSD4.8|  |BT101|     |FreeBSD4.8 |
         ------------  -------     |ser-0.8.10 |
         sendip        sip phone   -------------
                                    tel.no-ip.com:5064       


[root@sp98n zenkato]# /sbin/iptables -t nat -A PREROUTING -d 218.225.79.229 -p udp --dport 5064 -j DNAT --to 192.168.100.26
[root@sp98n zenkato]# /sbin/iptables -t nat -A POSTROUTING -d 192.168.100.26 -s 192.168.100.0/24 -p udp --dport 5064 -j SNAT --to 192.168.100.30

[root@sp98n zenkato]# /sbin/iptables -L -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  anywhere             fe229.ade.ttcn.ne.jptcp dpt:http to:192.168.100.26 
DNAT       udp  --  anywhere             fe229.ade.ttcn.ne.jpudp dpt:5064 to:192.168.100.26 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       tcp  --  192.168.100.0/24     tel.no-ip.com      tcp dpt:http to:192.168.100.30 
SNAT       udp  --  192.168.100.0/24     tel.no-ip.com      udp dpt:5064 to:192.168.100.30 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


[root@sp98n test]# /sbin/iptables -t nat -L -n -v
Chain PREROUTING (policy ACCEPT 1303 packets, 191K bytes)
 pkts bytes target     prot opt in     out     source               destination         
    9   858 DNAT       tcp  --  *      *       0.0.0.0/0            218.225.79.229     tcp dpt:80 to:192.168.100.26 
    0     0 DNAT       udp  --  *      *       0.0.0.0/0            218.225.79.229     udp dpt:5064 to:192.168.100.26 

Chain POSTROUTING (policy ACCEPT 551 packets, 43758 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    9   858 SNAT       tcp  --  *      *       192.168.100.0/24     192.168.100.26     tcp dpt:80 to:192.168.100.30 
    0     0 SNAT       udp  --  *      *       192.168.100.0/24     192.168.100.26     udp dpt:5064 to:192.168.100.30 

Chain OUTPUT (policy ACCEPT 5 packets, 376 bytes)
 pkts bytes target     prot opt in     out     source               destination         

[root@sp98n test]# /sbin/iptables  -L -n -v
Chain INPUT (policy ACCEPT 708 packets, 254K bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 461 packets, 43424 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 674 packets, 258K bytes)
 pkts bytes target     prot opt in     out     source               destination         

[root@sp98n zenkato]# /usr/sbin/tcpdump -i eth0
tcpdump: listening on eth0
17:53:00.055194 192.168.100.7.5071 > fe229.ade.ttcn.ne.jp.5064:  udp 532 (DF)
17:53:00.055463 fe229.ade.ttcn.ne.jp > 192.168.100.7: icmp: fe229.ade.ttcn.ne.jp udp port 5064 unreachable [tos 0xc0] 



ethereal-test-udp-1
===================
Frame 1 (574 bytes on wire, 574 bytes captured)
    Arrival Time: Aug 30, 2003 17:41:41.197996000
    Time delta from previous packet: 0.000000000 seconds
    Time relative to first packet: 0.000000000 seconds
    Frame Number: 1
    Packet Length: 574 bytes
    Capture Length: 574 bytes
Ethernet II, Src: 00:0b:82:00:27:33, Dst: 00:e0:18:80:4c:8f
    Destination: 00:e0:18:80:4c:8f (AsustekC_80:4c:8f)
    Source: 00:0b:82:00:27:33 (Grandstr_00:27:33)
    Type: IP (0x0800)
Internet Protocol, Src Addr: 192.168.100.7 (192.168.100.7), Dst Addr: 218.225.79.229 (218.225.79.229)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 560
    Identification: 0xf9cb (63947)
    Flags: 0x04
        .1.. = Don't fragment: Set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 254
    Protocol: UDP (0x11)
    Header checksum: 0x317a (correct)
    Source: 192.168.100.7 (192.168.100.7)
    Destination: 218.225.79.229 (218.225.79.229)
User Datagram Protocol, Src Port: 5071 (5071), Dst Port: 5064 (5064)
    Source port: 5071 (5071)
    Destination port: 5064 (5064)
    Length: 540
    Checksum: 0x185c (correct)
Session Initiation Protocol
    Request line: REGISTER sip:tel.no-ip.com:5064 SIP/2.0
        Method: REGISTER
    Message Header
        Via: SIP/2.0/UDP 218.225.79.229:5071
        From: <sip:1021@tel.no-ip.com:5064>;tag=cdf03f30-b546-903e-d833-74e21911d7e9
        To: <sip:1021@tel.no-ip.com:5064>
        Contact: <sip:1021@218.225.79.229:5071>
        Call-ID: 144a2ab4-9b04-aa6e-8a01-def3ec65c410@192.168.100.7
        CSeq: 100 REGISTER
        Expires: 180
        User-Agent: Grandstream SIP UA 1.0.3.81
        Warning: detected firewall/NAT type is full cone
        Max-Forwards: 70
        Allow: INVITE, ACK, CANCEL, BYE, NOTIFY, REFER, OPTIONS, INFO, SUBSCRIBE
        Content-Length: 0

0000  00 e0 18 80 4c 8f 00 0b 82 00 27 33 08 00 45 00   ....L.....'3..E.
0010  02 30 f9 cb 40 00 fe 11 31 7a c0 a8 64 07 da e1   .0..@...1z..d...
0020  4f e5 13 cf 13 c8 02 1c 18 5c 52 45 47 49 53 54   O........\REGIST
0030  45 52 20 73 69 70 3a 74 65 6c 2e 6e 6f 2d 69 70   ER sip:tel.no-ip
0040  2e 63 6f 6d 3a 35 30 36 34 20 53 49 50 2f 32 2e   .com:5064 SIP/2.
0050  30 0d 0a 56 69 61 3a 20 53 49 50 2f 32 2e 30 2f   0..Via: SIP/2.0/
0060  55 44 50 20 32 31 38 2e 32 32 35 2e 37 39 2e 32   UDP 218.225.79.2
0070  32 39 3a 35 30 37 31 0d 0a 46 72 6f 6d 3a 20 3c   29:5071..From: <
   (snip)

Frame 2 (590 bytes on wire, 590 bytes captured)
    Arrival Time: Aug 30, 2003 17:41:41.198382000
    Time delta from previous packet: 0.000386000 seconds
    Time relative to first packet: 0.000386000 seconds
    Frame Number: 2
    Packet Length: 590 bytes
    Capture Length: 590 bytes
Ethernet II, Src: 00:e0:18:80:4c:8f, Dst: 00:0b:82:00:27:33
    Destination: 00:0b:82:00:27:33 (Grandstr_00:27:33)
    Source: 00:e0:18:80:4c:8f (AsustekC_80:4c:8f)
    Type: IP (0x0800)
Internet Protocol, Src Addr: 218.225.79.229 (218.225.79.229), Dst Addr: 192.168.100.7 (192.168.100.7)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0xc0 (DSCP 0x30: Class Selector 6; ECN: 0x00)
        1100 00.. = Differentiated Services Codepoint: Class Selector 6 (0x30)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 576
    Identification: 0x1007 (4103)
    Flags: 0x00
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 255
    Protocol: ICMP (0x01)
    Header checksum: 0x597f (correct)
    Source: 218.225.79.229 (218.225.79.229)
    Destination: 192.168.100.7 (192.168.100.7)
Internet Control Message Protocol
    Type: 3 (Destination unreachable)
    Code: 3 (Port unreachable)
    Checksum: 0xbe02 (correct)
    Internet Protocol, Src Addr: 192.168.100.7 (192.168.100.7), Dst Addr: 218.225.79.229 (218.225.79.229)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 560
        Identification: 0xf9cb (63947)
        Flags: 0x04
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 254
        Protocol: UDP (0x11)
        Header checksum: 0x317a (correct)
        Source: 192.168.100.7 (192.168.100.7)
        Destination: 218.225.79.229 (218.225.79.229)
    User Datagram Protocol, Src Port: 5071 (5071), Dst Port: 5064 (5064)
        Source port: 5071 (5071)
        Destination port: 5064 (5064)
        Length: 540
        Checksum: 0x185c
    Data (520 bytes)

0000  00 0b 82 00 27 33 00 e0 18 80 4c 8f 08 00 45 c0   ....'3....L...E.
0010  02 40 10 07 00 00 ff 01 59 7f da e1 4f e5 c0 a8   .@......Y...O...
0020  64 07 03 03 be 02 00 00 00 00 45 00 02 30 f9 cb   d.........E..0..
0030  40 00 fe 11 31 7a c0 a8 64 07 da e1 4f e5 13 cf   @...1z..d...O...
0040  13 c8 02 1c 18 5c 52 45 47 49 53 54 45 52 20 73   .....\REGISTER s
0050  69 70 3a 74 65 6c 2e 6e 6f 2d 69 70 2e 63 6f 6d   ip:tel.no-ip.com
0060  3a 35 30 36 34 20 53 49 50 2f 32 2e 30 0d 0a 56   :5064 SIP/2.0..V
0070  69 61 3a 20 53 49 50 2f 32 2e 30 2f 55 44 50 20   ia: SIP/2.0/UDP 
 (snip)

-----------SENDIP trailer changed?-------------
Frame 1 (60 bytes on wire, 60 bytes captured)
    Arrival Time: Aug 30, 2003 22:09:44.395822000
    Time delta from previous packet: 0.000000000 seconds
    Time relative to first packet: 0.000000000 seconds
    Frame Number: 1
    Packet Length: 60 bytes
    Capture Length: 60 bytes
Ethernet II, Src: 00:80:c8:8a:73:dc, Dst: 00:e0:18:80:4c:8f
    Destination: 00:e0:18:80:4c:8f (AsustekC_80:4c:8f)
    Source: 00:80:c8:8a:73:dc (D-Link_8a:73:dc)
    Type: IP (0x0800)
    Trailer: 2B28010000010000000000000374656C...
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Internet Protocol, Src Addr: 192.168.100.11 (192.168.100.11), Dst Addr: 218.225.79.229 (218.225.79.229)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 28
    Identification: 0xa67e (42622)
    Flags: 0x00
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 255
    Protocol: UDP (0x11)
    Header checksum: 0xc5d7 (correct)
    Source: 192.168.100.11 (192.168.100.11)
    Destination: 218.225.79.229 (218.225.79.229)
User Datagram Protocol, Src Port: 5070 (5070), Dst Port: 5064 (5064)
    Source port: 5070 (5070)
    Destination port: 5064 (5064)
    Length: 8
    Checksum: 0x88cd (correct)

Frame 2 (60 bytes on wire, 60 bytes captured)
    Arrival Time: Aug 30, 2003 22:09:44.396098000
    Time delta from previous packet: 0.000276000 seconds
    Time relative to first packet: 0.000276000 seconds
    Frame Number: 2
    Packet Length: 60 bytes
    Capture Length: 60 bytes
Ethernet II, Src: 00:e0:18:80:4c:8f, Dst: 00:00:e8:77:50:06
    Destination: 00:00:e8:77:50:06 (AcctonTe_77:50:06)
    Source: 00:e0:18:80:4c:8f (AsustekC_80:4c:8f)
    Type: IP (0x0800)
    Trailer: 00000000000000000000000000000000...
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Internet Protocol, Src Addr: 192.168.100.30 (192.168.100.30), Dst Addr: 192.168.100.26 (192.168.100.26)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
        0000 00.. = Differentiated Services Codepoint: Default (0x00)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 28
    Identification: 0xa67e (42622)
    Flags: 0x00
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 254
    Protocol: UDP (0x11)
    Header checksum: 0xccc8 (correct)
    Source: 192.168.100.30 (192.168.100.30)
    Destination: 192.168.100.26 (192.168.100.26)
User Datagram Protocol, Src Port: 5070 (5070), Dst Port: 5064 (5064)
    Source port: 5070 (5070)
    Destination port: 5064 (5064)
    Length: 8
    Checksum: 0x8ebe (correct)
------------ end --------------------------------

Regards,

Zen Kato

