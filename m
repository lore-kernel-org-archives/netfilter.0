From: Karl Juchen <karl.juchen@gmx.de>
Subject: traceroute, state, bug?
Date: Wed, 09 Oct 2002 19:27:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA4671B.10704@gmx.de>
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
To: netfilter@lists.netfilter.org

Hello!

I'm using iptables 1.2.6a, kernel 2.4.18 and have a problem with the 
connection tracking state extension.
I want to allow traceroute from my local network, so I configured my 
firewall to accept outgoing UDP packets on ports 33434+x.
I also accept certain types of ICMP packets to pass, especially 
time-exceeded:

iptables -A chain -p icmp -m state ESTABLISHED -j ACCEPT
iptables -A chain -p icmp -m state RELATED -j ACCEPT
...
iptables -A chain -p icmp [-s source] [-d destination] --icmp-type 
time-exceeded -m state NEW -j ACCEPT
...

I read at
  http://www.sns.ias.edu/~jns/security/iptables/iptables_conntrack.html
that the state NEW does not exist for time-exceeded packages.
So the last rule will never be matched and seems to be abundant.

However, at this time a traceroute from my local network to an external 
host looks like that:

  1  * * *
  ...
  9  scratchy.onlinekosten.de (217.172.162.11)  66 ms  66 ms  66 ms

So only the time-exceeded answers originating from the firewall are 
blocked. I found out, that's because these answers have the state 
INVALID, instead of RELATED like corresponding packets from other hops.

I manually added certain logging rules to check what happens:

  Oct  9 20:10:31 mg1000-2 kernel: ***PREROUTING*** IN=eth2 OUT= MAC= 
SRC=192.168.0.2 DST=62.153.159.89 LEN=40 TOS=0x00 PREC=0x00 TTL=1 
ID=24178 PROTO=UDP SPT=33883 DPT=33435 LEN=20
  Oct  9 20:10:31 mg1000-2 kernel: out-INTERN REJECT IN= OUT=eth2 
SRC=192.168.0.1 DST=192.168.0.2 LEN=68 TOS=0x00 PREC=0xC0 TTL=255 
ID=50358 PROTO=ICMP TYPE=11 CODE=0 [SRC=192.168.0.2 DST=62.153.159.89 
LEN=40 TOS=0x00 PREC=0x00 TTL=1 ID=24178 PROTO=UDP SPT=33883 DPT=33435 
LEN=20 ]
  ...
  Oct  9 20:10:40 mg1000-2 kernel: ***PREROUTING*** IN=eth2 OUT= MAC= 
SRC=192.168.0.2 DST=62.153.159.89 LEN=40 TOS=0x00 PREC=0x00 TTL=2 
ID=24181 PROTO=UDP SPT=33883 DPT=33438 LEN=20
  Oct  9 20:10:40 mg1000-2 kernel: INTERN-EXTERN ACCEPT IN=eth2 OUT=ppp0 
SRC=192.168.0.2 DST=62.153.159.89 LEN=40 TOS=0x00 PREC=0x00 TTL=1 
ID=24181 PROTO=UDP SPT=33883 DPT=33438 LEN=20
  Oct  9 20:10:40 mg1000-2 kernel: ***POSTROUTING*** IN= OUT=ppp0 
SRC=192.168.0.2 DST=62.153.159.89 LEN=40 TOS=0x00 PREC=0x00 TTL=1 
ID=24181 PROTO=UDP SPT=33883 DPT=33438 LEN=20
  Oct  9 20:10:40 mg1000-2 kernel: EXTERN-INTERN RELATE IN=ppp0 OUT=eth2 
SRC=217.5.98.70 DST=192.168.0.2 LEN=56 TOS=0x00 PREC=0x00 TTL=59 ID=0 
PROTO=ICMP TYPE=11 CODE=0 [SRC=80.135.184.250 DST=62.153.159.89 LEN=40 
TOS=0x00 PREC=0x00 TTL=1 ID=24181 PROTO=UDP SPT=33883 DPT=33438 LEN=20 ]

The first entry shows, that the request goes through the nat PREROUTING 
chain and seems to be dropped afterwards because of TTL=1.
The answer from the firewall box is REJECTED by my rules because the 
packet is not recognized as RELATED but INVALID, altough iptables seems 
to remember the original request.

A traceroute to the firewall itself looks like this:

  1  192.168.0.1 (192.168.0.1)  0 ms  0 ms  0 ms

This time the destination-unreachable answer is treated correctly as 
RELATED.

So why does the time-exceeded answer in the first case have the state 
INVALID, though it should be RELATED as far as i can see it?
Am I doing something wrong or is it even an iptables bug?


Thanks for any ideas,
Karl


