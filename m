From: Robert Dahlem <Robert.Dahlem@gmx.net>
Subject: Matching IPSEC encapsulated traffic with connection tracking
Date: Tue, 04 Jan 2005 09:27:31 +0100
Message-ID: <41DA5373.5080404@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

sorry, this is a bit lengthy ...

There seems to be a problem with my understanding of Netfilter
connection tracking when encapsulating packets with IPSEC/AH.

My setup is (gory details left apart):

      Host A                       Host B
    +--------------+ eth1   eth1 +----------------+
    ! 10.133.126.6 +-------------+ 10.133.127.197 !
    +--------------+             +----------------+

Traffic between A and B must be transported with IPSEC/AH.
Host B must be able to initiate SSH connections to Host A.
We are only talking about netfilter rules an Host A.

I have a working scenario, where netfilter rules inspect packets whether
they belong to an already established connection and accepts them. The
only other rule is to accept packets coming from 10.133.127.197 and
targeted on port 22. IPSEC is inactive in this scenario.

I have another working scenario, where IPSEC/AH is active and netfilter
is inactive. Keys get exchanged, packets became AH-encapsulated.

The problem is to combine these two scenarios: make both netfilter and
IPSEC active at the same time.

My rule set is:
======================================================================
	IT=/usr/sbin/iptables
	INPUT="$IT -A $INPUT"
	OUTPUT="$IT -A $OUTPUT"
	ESTAB="-m state --state ESTABLISHED,RELATED"

	# Debug: Log all Packets
	$INPUT -i eth1 -j LOG --log-prefix 'Debug INPUT:'
	$OUTPUT -o eth1 -j LOG --log-prefix 'Debug OUTPUT:'

	# Allow IPSEC/AH traffic
	$INPUT -i eth1 -p ah -j ACCEPT
	$OUTPUT -o eth1 -p ah -j ACCEPT

	# Allow traffic on already established connections
	$INPUT -i eth1 $ESTAB -j ACCEPT
	$OUTPUT -o eth1 $ESTAB -j ACCEPT

	# Allow IPSEC key exchange
	$INPUT -i eth1 -p udp --sport 500 --dport 500 -j ACCEPT

	# Allow incoming SSH from 10.133.127.197
	$INPUT -i eth1 -p tcp -s 10.133.127.197 --dport 22 -j ACCEPT

	# Log and drop illegal traffic (which means: the rest)
	$INPUT -i eth1 -j LOG --log-prefix 'Ill. INPUT:'
	$OUTPUT -o eth1 -j LOG --log-prefix 'Ill. OUTPUT:'
	$INPUT -i eth1 -j DROP
	$OUTPUT -o eth1 -j DROP
======================================================================

Without IPSEC everything works fine. Kernel messages look like this:

======================================================================
# SYN packet
HostA kernel: Debug INPUT:IN=eth1 OUT=
	MAC=00:0a:5e:4d:0f:12:00:0a:5e:4d:10:42:08:00
	SRC=10.133.127.197 DST=10.133.126.6
	LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=5559 DF
	PROTO=TCP SPT=1023 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0

# SYN/ACK packet, ESTABLISHED rule matches
HostA kernel: Debug OUTPUT:IN= OUT=eth1
	SRC=10.133.126.6 DST=10.133.127.197
	LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
	PROTO=TCP SPT=22 DPT=1023 WINDOW=5792 RES=0x00 ACK SYN URGP=0

# ACK packet, ESTABLISHED rule matches
HostA kernel: Debug INPUT:IN=eth1 OUT=
	MAC=00:0a:5e:4d:0f:12:00:0a:5e:4d:10:42:08:00
	SRC=10.133.127.197 DST=10.133.126.6
	LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=5561 DF
	PROTO=TCP SPT=1023 DPT=22 WINDOW=1460 RES=0x00 ACK URGP=0

# first data packet, ESTABLISHED rule matches
HostA kernel: Debug OUTPUT:IN= OUT=eth1
	SRC=10.133.126.6 DST=10.133.127.197
	LEN=74 TOS=0x00 PREC=0x00 TTL=64 ID=4944 DF
	PROTO=TCP SPT=22 DPT=1023 WINDOW=1448 RES=0x00 ACK PSH URGP=0
======================================================================

By looking at the output of 'iptables -L -v -n' I can see that every
packet but one (the initial SYN packet) is accepted by the ESTABLISHED rule.

Now with IPSEC (racoon started, key exchange already done, SA+SP in place):

======================================================================
# SYN packet arriving from net, AH encapsulated
HostA kernel: Debug INPUT:IN=eth1 OUT=
	MAC=00:0a:5e:4d:0f:12:00:0a:5e:4d:10:42:08:00
	SRC=10.133.127.197 DST=10.133.126.6
	LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=57273 DF
	PROTO=AH SPI=0x776227d

# Kernel tries to answer, packet still has to become AH-encapsulated
HostA kernel: Debug OUTPUT:IN= OUT=eth1
	SRC=10.133.126.6 DST=10.133.127.197
	LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
	PROTO=TCP SPT=22 DPT=1023 WINDOW=5792 RES=0x00 ACK SYN URGP=0

# ESTABLISHED rule no longer matches!
# Note that this is the same packet as before, just logged a second
# time because ESTABLISHED rule did not match.
HostA kernel: Ill. OUTPUT:IN= OUT=eth1
	SRC=10.133.126.6 DST=10.133.127.197
	LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF
	PROTO=TCP SPT=22 DPT=1023 WINDOW=5792 RES=0x00 ACK SYN URGP=0
======================================================================

In this case the ESTABLISHED rule does not accept one single packet.

The output of 'iptables -L -v -n' looks like this
(irrelevant parts stripped off, rules numbered):

======================================================================
   Chain INPUT (policy ACCEPT 3 packets, 234 bytes)
    pkts target prot source         destination
#i1   1 LOG    all  0.0.0.0/0      0.0.0.0/0 LOG prefix `Debug INPUT:'
#i2   1 ACCEPT ah   0.0.0.0/0      0.0.0.0/0
#i3   0 ACCEPT all  0.0.0.0/0      0.0.0.0/0 state RELATED,ESTABLISHED
#i4   0 ACCEPT udp  0.0.0.0/0      0.0.0.0/0 udp spt:500 dpt:500
#i5   0 ACCEPT tcp  10.133.127.197 0.0.0.0/0 tcp dpt:22
#i6   0 LOG    all  0.0.0.0/0      0.0.0.0/0 LOG prefix `Ill. INPUT:'
#i7   0 DROP   all  0.0.0.0/0      0.0.0.0/0

   Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts target prot source         destination
#o1   1 LOG    all  0.0.0.0/0      0.0.0.0/0 LOG prefix `Debug OUTPUT:'
#o2   0 ACCEPT ah   0.0.0.0/0      0.0.0.0/0
#o3   0 ACCEPT all  0.0.0.0/0      0.0.0.0/0 state RELATED,ESTABLISHED
#o4   1 LOG    all  0.0.0.0/0      0.0.0.0/0 LOG prefix `Ill. OUTPUT:'
#o5   1 DROP   all  0.0.0.0/0      0.0.0.0/0
======================================================================

Note that rule #i5 never matched. It looks like the match by rule #i2
prevents any AH-encapsulated packet from being inspected later,
especially by the connection tracking.

The rules mentioned are only an illustrative example of a more
complicated situation but they describe the problem exactly. What I
would like to achieve is to gain control over the encapsulating IPSEC
traffic as well as the encapsulated payload traffic.

Is there any solution for this? Thanks in advance for every helpful pointer.

Kind regards,
              Robert



