From: Zen Kato <zenkato@pis.bekkoame.ne.jp>
Subject: iptables SNAT and sip "REGISTER"
Date: Mon, 01 Sep 2003 08:29:01 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030901082901R.zenkato@pis.bekkoame.ne.jp>
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


[root@sp98n zenkato]# /usr/sbin/tcpdump -i eth0
tcpdump: listening on eth0
17:53:00.055194 192.168.100.7.5071 > fe229.ade.ttcn.ne.jp.5064:  udp 532 (DF)
17:53:00.055463 fe229.ade.ttcn.ne.jp > 192.168.100.7: icmp: fe229.ade.ttcn.ne.jp udp port 5064 unreachable [tos 0xc0] 
                ^^^^^^^^^^^

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
        0000 00.. = Dethereal-test-udp-1


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

Zen





