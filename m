From: Nigel Metheringham <Nigel.Metheringham@dev.InTechnology.co.uk>
Subject: NAT, ICMP and MTU issues
Date: Fri, 19 Sep 2003 16:41:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063986116.28941.41.camel@angua.localnet>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a somewhat complex setup where I am using a box running both
source and destination NAT as a demarcation point between 2 disparately
addressed networks [specifically this allows a customer to access a
service on our network, even through other customers that we connect to
may have networks with otherlapping address spaces - not always
"private" space]

So from the customer's point of view, they connect to 192.168.50.119
port 1500.
Our kit wants to see a connection from 10.0.1.0/24 to 10.0.2.2 port
2502.

In theory this works fine... but theres a wrinkle.  Our box is remote
from our data centre and connects to it using an IPSec link using
FreeSWAN.  The ipsec0 interface has an MTU on it of 1450 - this prevents
us fragmenting 1500 byte packets when they hit the ipsec engine (which
expands the packets up).  A 1450 MTU has historically worked well for
us.

What appears to be happening is that everything works while packets are
short, however when long packets come in they bounce off the lower MTU
interface, and the returned ICMP packet is not getting back to the
originator in a sane form.   So the connection freezes.

Having looked closer at this I find there is an ICMP dest unreach packet
emitted from my box back to the originator.  However inside the packet
the SNAT has been undone, but the DNAT is still in place.

Any ideas how I can fix this...?
This is all on a 2.4.21 kernel.

NAT rules I have in place are:-
  [root@t003 admin]# /sbin/iptables -t nat -n -L 
  Chain PREROUTING (policy ACCEPT)
  target     prot opt source         destination
  DNAT       tcp  --  0.0.0.0/0      192.168.50.119  tcp dpt:1500 to:10.0.2.2:2502
 
  Chain POSTROUTING (policy ACCEPT)
  target     prot opt source         destination
  SNAT       tcp  --  0.0.0.0/0      10.0.2.2        tcp dpt:2502 to:10.0.1.239-10.0.1.254

The ICMP packet I get back looks like this:-
 Frame 229 (590 bytes on wire, 590 bytes captured)
    Arrival Time: Sep 19, 2003 15:21:31.728906000
    Time delta from previous packet: 0.000019000 seconds
    Time relative to first packet: 70.396568000 seconds
    Frame Number: 229
    Packet Length: 590 bytes
    Capture Length: 590 bytes
 Ethernet II, Src: 00:02:a5:da:5f:7b, Dst: 00:10:db:ff:20:70
    Destination: 00:10:db:ff:20:70 (00:10:db:ff:20:70)
    Source: 00:02:a5:da:5f:7b (00:02:a5:da:5f:7b)
    Type: IP (0x0800)
 Internet Protocol, Src Addr: 192.168.50.119 (192.168.50.119), Dst Addr: 172.16.28.5 (172.16.28.5)
    Version: 4
    Header length: 20 bytes
    Differentiated Services Field: 0xc0 (DSCP 0x30: Class Selector 6; ECN: 0x00)
        1100 00.. = Differentiated Services Codepoint: Class Selector 6 (0x30)
        .... ..0. = ECN-Capable Transport (ECT): 0
        .... ...0 = ECN-CE: 0
    Total Length: 576
    Identification: 0x8d00 (36096)
    Flags: 0x00
        .0.. = Don't fragment: Not set
        ..0. = More fragments: Not set
    Fragment offset: 0
    Time to live: 64
    Protocol: ICMP (0x01)
    Header checksum: 0x2fc8 (correct)
    Source: 192.168.50.119 (192.168.50.119)
    Destination: 172.16.28.5 (172.16.28.5)
 Internet Control Message Protocol
    Type: 3 (Destination unreachable)
    Code: 4 (Fragmentation needed)
    Checksum: 0x8479 (correct)
    MTU of next hop: 1450
    Internet Protocol, Src Addr: 172.16.28.5 (172.16.28.5), Dst Addr: 10.0.2.2 (10.0.2.2)
        Version: 4
        Header length: 20 bytes
        Differentiated Services Field: 0x00 (DSCP 0x00: Default; ECN: 0x00)
            0000 00.. = Differentiated Services Codepoint: Default (0x00)
            .... ..0. = ECN-Capable Transport (ECT): 0
            .... ...0 = ECN-CE: 0
        Total Length: 1500
        Identification: 0x7749 (30537)
        Flags: 0x04
            .1.. = Don't fragment: Set
            ..0. = More fragments: Not set
        Fragment offset: 0
        Time to live: 62
        Protocol: TCP (0x06)
        Header checksum: 0xcda0 (correct)
        Source: 172.16.28.5 (172.16.28.5)
        Destination: 10.0.2.2 (10.0.2.2)
    Transmission Control Protocol, Src Port: 50794 (50794), Dst Port: 2502 (2502), Seq: 3025715234, Ack: 3268150508
        Source port: 50794 (50794)
        Destination port: 2502 (2502)
        Sequence number: 3025715234
        Acknowledgement number: 3268150508
        Header length: 32 bytes
        Flags: 0x0010 (ACK)
            0... .... = Congestion Window Reduced (CWR): Not set
            .0.. .... = ECN-Echo: Not set
            ..0. .... = Urgent: Not set
            ...1 .... = Acknowledgment: Set
            .... 0... = Push: Not set
            .... .0.. = Reset: Not set
            .... ..0. = Syn: Not set
            .... ...0 = Fin: Not set
        Window size: 6432
        Checksum: 0xb25c (incorrect, should be 0x4b3b)
        Options: (12 bytes)
            NOP
            NOP
            Time stamp: tsval 19647219, tsecr 1709539721
    Data (496 bytes)


Cheers
	Nigel.
-- 
[ Nigel Metheringham           Nigel.Metheringham@InTechnology.co.uk ]
[ - Comments in this message are my own and not ITO opinion/policy - ]


