From: Diego Billi <dbilli@cs.unibo.it>
Subject: chains and IP checksum
Date: Tue, 16 Mar 2004 18:16:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0403161812220.27181-100000@remendado.cs.unibo.it>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,
  i'm working with iptables and libipq for a project and I
have a "problem" with IP checksum.

My scenario
-----------

I'm working with the 2.4.18 kernel. I know, it's hold, but
i think the problem is not here :-)

My host is on a simple home lan. I also have a virtual
network with a single "UserModeLinux" host connected with
my real host throw tuntap transport.

      +-------+                            +-----+
      |       | 192.168.1.1    192.168.1.2 |     |
      | my PC |----------------------------| UML |
      |       | tuntap                eth0 |     |
      +-------+                            +-----+
     eth0 | 192.168.0.59
          |
          |
   my home lan (192.168.0/24)

For my questions i will not care about my home lan, but
i think it's better more than less.


What i'm doing
--------------

I have a very simple "echo" server on my UML host. It is
listening on (192.168.1.2, 12345).

With 'libipq' i'm simply sniffing packets from chains and
printing them on output.

My sniffer prints to stdout TCP/IP informations from the
packet, checksum included.
(I have also modified my sniffer that is now able to
print mark value of the ipq_packet_msg structure, so
i can see when packets change chain.)

Inside the sniffer, I set IP checksum to 0 and
recalculate it and set the field with the my new value.
I  do the same thing with TCP checksum.

After this is i set NF_ACCEPT verdict for the packet.

I have added these rules:

iptables -t mangle -A OUTPUT -j MARK --set-mark 1
iptables -t filter -A OUTPUT -j QUEUE
iptables -t nat    -A OUTPUT -j QUEUE

iptables -t mangle -A POSTROUTING -j MARK --set-mark 2
iptables -t mangle -A POSTROUTING -j QUEUE


Now i open a new connection and here the sniffer output:


 +- mark value                               +- IP checksum from packet
 |                                           |    +-- my calculated checksum
 |                                           |    |
 |                                           |    |      +- TCP checksum from packet
 |                                           |    |      |    +- my checksum
 |     IP SRC     IP DST      P.SRC P.DST    |    |      |    |

1 | 192.168.1.1 192.168.1.2 |  1075 12345 |    0 68F1 | 81F2 81F2 | syn=1 OUTPUT filter
1 | 192.168.1.1 192.168.1.2 |  1075 12345 | 68F1 68F1 | 81F2 81F2 | syn=1 OUTPUT nat
2 | 192.168.1.1 192.168.1.2 |  1075 12345 | 9E6C 9E6C | 81F2 81F2 | syn=1 POSTROUTING mangle

1 | 192.168.1.1 192.168.1.2 |  1075 12345 |  201 C836 | DAE1 DAE1 | syn=0 OUTPUT filter
2 | 192.168.1.1 192.168.1.2 |  1075 12345 | A56C A56C | DAE1 DAE1 | syn=0 POSTROUTING mangle


You can see the output for the first and third three-way
handshake packets of my connection. (I have not filtered
packet on INPUT so the second packet of connection is not
printed).

(I can't see the third packet and following packets on 'nat'
OUTPUT but this is normal).

Now:
- IP checksum calculated from kernel before 'filter' OUTPUT
  is different  from my calculated checksum.
- It doesn't change from 'filter' OUTPUT to 'nat' OUTPUT
- It's changed again before 'mangle' POSTROUTING, but it's well
  calculated (no difference from my checksum), not like
  before 'filter' OUTPUT.

This is true for the first packet, and also all other packets
of my connection.

 1 | 192.168.1.1  192.168.1.2 |  1075 12345 |   10 6EF7 | E5ED E5ED | syn=0
 2 | 192.168.1.1  192.168.1.2 |  1075 12345 | A26C A26C | E5ED E5ED | syn=0

 1 | 192.168.1.1  192.168.1.2 |  1075 12345 | 7406 6FF6 | 8C05 8C05 | syn=0
 2 | 192.168.1.1  192.168.1.2 |  1075 12345 | A36C A36C | 8C05 8C05 | syn=0
 ...
 ...

I have tested this also between two real host.

Why this behaviour on IP checksum?
It's to reduce the number of time the IP checksum have to be
recalculated after any manipulation of IP header? If so,
why it's not the same for TCP checksum? It's calculated with
IP pseudo header. If we change ip destination or source
address in nat chains why have to recalculate it.

When IP checksum is calculated? When and where (what chains)
i have to calculate IP checksum if i change packets from
user-space without add unuseful overhead?

I believe i have seen an other message about this subject,
but there was not a full description about this "problem".

Thanks to everyone, and sorry for the verbosity and for my
bad english.

Diego Billi




