From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: MARK unexpectedly changed
Date: Thu, 06 Aug 2009 08:00:42 -0400
Message-ID: <1249560042.6492.52.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, all.  We have been using the MARK match and target very
successfully in the ISCS open source network security management project
(http://iscs.sourceforge.net) to mark IPSec packets but have recently
hit a very strange problem where the marks we are setting are being
changed and we have no idea where.

We are seeing this on SnapGear SG565 devices (with which we have been
very pleased) since their move to the 2.6 kernel.  They still use KLIPS
for IPSec.

ISCS systems use modular rather than monolithic rules and are configured
so that the device controlling the tunnel ingress point makes the access
control decision.  In this way, we not only reduce the size of complex
rule sets ten-fold with more efficient processing but it allows us to
make security decisions across the entire WAN based upon extended
credentials (e.g., X.509 certs) rather than virtual IP address pools.
When the packet arrives at the other end of the tunnel, the destination
device simply accepts it as long is it coming out of a trusted tunnel.

We do this by marking the packets.  When they come in on eth0 as ip
protocol 50, we mark them with 0x80000000 (iptables -t mangle -A
PREROUTING -p 50 -j MARK --set-mark 2147483648).  We then look for this
one set bit to later allow the packet after it has been decrypted
(iptables -A VPN_ALLOW -m mark --mark 2147483648/2147483648 -m state
--state NEW -j ACCEPT).  We chose a bit far to the left to avoid
conflicts with other marks.  This corresponds to 0x80000000.

For some reason, the SG565 is changing the marks.  I have no idea where
and, as you can imagine, this is wreaking havoc on our access.  I set up
a logging rule to capture the marks and this is what I found:

TERRY PROB: IN=ipsec0 OUT=eth0 SRC=10.68.6.201 DST=10.68.6.133 LEN=60
TOS=0x00 PREC=0x00 TTL=126 ID=8241 PROTO=UDP SPT=1025 DPT=53 LEN=40
MARK=0xaeff0000
TERRY PROB: IN=ipsec0 OUT=eth0 SRC=10.68.6.201 DST=10.68.6.133 LEN=114
TOS=0x00 PREC=0x00 TTL=126 ID=8242 PROTO=UDP SPT=1675 DPT=53 LEN=94
MARK=0xaeff0000
TERRY PROB: IN=ipsec0 OUT=eth0 SRC=10.68.6.201 DST=10.68.6.133 LEN=188
TOS=0x00 PREC=0x00 TTL=126 ID=8243 PROTO=UDP SPT=1676 DPT=389 LEN=168
MARK=0xaeff0000
No Match: IN=ipsec0 OUT=eth0 SRC=10.68.6.201 DST=10.68.6.133 LEN=334
TOS=0x00 PREC=0x00 TTL=126 ID=8244 PROTO=UDP SPT=1677 DPT=88 LEN=314
MARK=0x2ef70000

All four packets have traversed the IPSec VPN.  All of them should have
mark 80000000 but none of them do! It just so happens that the first
three packets (DNS and LDAP) happen to include the 80000000 bit and so
are allowed.  The Kerberos packet does not and is thus dropped as No
Match.

Even more interestingly, the marks changed.  To try to get the users
working, I restarted iptables several times (did not seem to work) and
then restarted the ipsec tunnel.  Suddenly, it started working.  I also
noticed the marks changed.  In fact, later on, they changed again
without my doing anything.  Compare the above marks with these marks on
the same traffic a little later (the format is slightly different as one
is from vi and the other from tail:

<12>Aug  5 21:06:55 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=114 TOS=0x00 PREC=0x00 TTL=126
ID=20636 PROTO=UDP SPT=1690 DPT=53 LEN=94 MARK=0xaf1f0000
<12>Aug  5 21:06:55 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=188 TOS=0x00 PREC=0x00 TTL=126
ID=20637 PROTO=UDP SPT=1691 DPT=389 LEN=168 MARK=0xaf1f0000
<12>Aug  5 21:06:55 kernel: No Match: IN=ipsec0 OUT=eth0 SRC=10.68.6.201
DST=10.68.6.133 LEN=334 TOS=0x00 PREC=0x00 TTL=126 ID=20638 PROTO=UDP
SPT=1692 DPT=88 LEN=314 MARK=0x2f0f0000
<12>Aug  5 21:07:02 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=85 TOS=0x00 PREC=0x00 TTL=126
ID=20639 DF PROTO=TCP SPT=1604 DPT=445 WINDOW=64906 RES=0x00 ACK PSH
URGP=0 MARK=0xaf1f0000
<12>Aug  5 21:07:02 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=85 TOS=0x00 PREC=0x00 TTL=126
ID=20640 DF PROTO=TCP SPT=1604 DPT=445 WINDOW=64867 RES=0x00 ACK PSH
URGP=0 MARK=0xaf1f0000

Now notice the marks on this same traffic yet later:

<12>Aug  5 21:52:45 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=142 TOS=0x00 PREC=0x00 TTL=126
ID=27032 DF PROTO=TCP SPT=1604 DPT=445 WINDOW=65343 RES=0x00 ACK PSH
URGP=0 MARK=0xaf230000
<12>Aug  5 21:52:45 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=142 TOS=0x00 PREC=0x00 TTL=126
ID=27033 DF PROTO=TCP SPT=1604 DPT=445 WINDOW=65239 RES=0x00 ACK PSH
URGP=0 MARK=0xaf230000
<12>Aug  5 21:52:45 kernel: TERRY PROB: IN=ipsec0 OUT=eth0
SRC=10.68.6.201 DST=10.68.6.133 LEN=142 TOS=0x00 PREC=0x00 TTL=126
ID=27034 DF PROTO=TCP SPT=1604 DPT=445 WINDOW=65151 RES=0x00 ACK PSH
URGP=0 MARK=0xaf230000

What is going on? What is changing the marks? I was under the impression
marks were only set in the mangle table.  I've scoured the mangle table
and the only rule setting a mark is the one mention above which sets
0x80000000.

I've noticed the last two bytes are never changed.  I almost wonder if
something is thinking this is a two byte rather than four byte field and
filling in random data for the left most two bytes.  Any suggestions
(other than shifting our mark to the right which is what we will
temporarily do)? Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

