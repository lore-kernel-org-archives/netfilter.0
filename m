From: Zoilo <zoilo@xs4all.nl>
Subject: NAT PREROUTING chain ignored on returning traffic ??
Date: Fri, 29 Aug 2003 20:57:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4FA204.6010605@xs4all.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: zoilo@xs4all.nl, netfilter@lists.netfilter.org

I have 2 machines connected via a LAN: 192.168.192.254 and 
192.168.192.123. I will call the '254' and '123' from now on.

For the sake of it, I decided to 'rehearse' my netfilter theory, and ran 
the following script on .123:

#!/bin/bash

iptables -t filter -I INPUT -j LOG --log-prefix "filter INPUT: "
iptables -t filter -I OUTPUT -j LOG --log-prefix "filter OUTPUT: "
iptables -t filter -I FORWARD -j LOG --log-prefix "filter FORWARD: "

iptables -t nat -I PREROUTING -j LOG --log-prefix "nat PREROUTING: "
iptables -t nat -I OUTPUT -j LOG --log-prefix "nat OUTPUT: "
iptables -t nat -I POSTROUTING -j LOG --log-prefix "nat POSTROUTING: "

iptables -t mangle -I PREROUTING -j LOG --log-prefix "mangle PREROUTING: "
iptables -t mangle -I INPUT -j LOG --log-prefix "mangle INPUT: "
iptables -t mangle -I FORWARD -j LOG --log-prefix "mangle FORWARD: "
iptables -t mangle -I OUTPUT -j LOG --log-prefix "mangle OUTPUT: "
iptables -t mangle -I POSTROUTING -j LOG --log-prefix "mangle POSTROUTING: "

There is nothing else in the configuration.

Then I did a single 'ping' from one to the other, and vice versa, while 
logging at 123.

I) Here is the log on 123 in response to a 'ping -c 1 192.168.192.123' 
issued from 254:

Aug 29 20:07:04 lfs kernel: mangle PREROUTING: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP 
TYPE=8 CODE=0 ID=4615 SEQ=0
Aug 29 20:07:04 lfs kernel: nat PREROUTING: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP 
TYPE=8 CODE=0 ID=4615 SEQ=0
Aug 29 20:07:04 lfs kernel: mangle INPUT: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP 
TYPE=8 CODE=0 ID=4615 SEQ=0
Aug 29 20:07:04 lfs kernel: filter INPUT: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP 
TYPE=8 CODE=0 ID=4615 SEQ=0
Aug 29 20:07:04 lfs kernel: mangle OUTPUT: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=45404 PROTO=ICMP TYPE=0 CODE=0 ID=4615 SEQ=0
Aug 29 20:07:04 lfs kernel: filter OUTPUT: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=45404 PROTO=ICMP TYPE=0 CODE=0 ID=4615 SEQ=0
Aug 29 20:07:04 lfs kernel: mangle POSTROUTING: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=45404 PROTO=ICMP TYPE=0 CODE=0 ID=4615 SEQ=0

II) Here is the log on 123 in response to a 'ping -c 1 192.168.192.254' 
issued from 123 itself:

Aug 29 20:07:57 lfs kernel: mangle OUTPUT: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: nat OUTPUT: IN= OUT=eth0 SRC=192.168.192.123 
DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP 
TYPE=8 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: filter OUTPUT: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: mangle POSTROUTING: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: nat POSTROUTING: IN= OUT=eth0 
SRC=192.168.192.123 DST=192.168.192.254 LEN=84 TOS=0x00 PREC=0x00 TTL=64 
ID=0 DF PROTO=ICMP TYPE=8 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: mangle PREROUTING: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=39819 PROTO=ICMP 
TYPE=0 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: mangle INPUT: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=39819 PROTO=ICMP 
TYPE=0 CODE=0 ID=3105 SEQ=0
Aug 29 20:07:57 lfs kernel: filter INPUT: IN=eth0 OUT= 
MAC=00:40:63:ca:ee:3c:00:c0:4f:a6:7c:58:08:00 SRC=192.168.192.254 
DST=192.168.192.123 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=39819 PROTO=ICMP 
TYPE=0 CODE=0 ID=3105 SEQ=0

To my astonishment, in II) the returning ICMP packets do *not* travel 
through the NAT PREROUTING chain! In I) however, the incoming packets 
*do* travel through the NAT PREROUTING chain, as expected.

Fortunately, the behaviour is the same when the test is run on the other 
machine, so I am the problem, and not iptables (of course).

So why does a returning packet not travel through the NAT PREROUTING 
chain, whereas a new incoming ping does travel through the NAT 
PREROUTING chain? Both packets have exactly the same destination, huh?

Z.



