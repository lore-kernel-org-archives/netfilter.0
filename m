From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Connections to portmapper over TCP
Date: Mon, 26 Apr 2004 11:26:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408D384E.80702@pbl.ca>
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

Hi,

I've stumbled accross one interesting problem with portmapper.  I have 
rules to allow connections to portmapper.  The connection goes through 
three way handshake, however as soon as handshake is over, packets are 
being dropped by Netfiler.

The relevant rules on host named "client" look something like this 
(edited a bit for clarity):

/sbin/iptables -A OUTPUT -p udp -s client --sport 0:1023
    -d server --dport sunrpc
    -o eth0 -m rpc --rpcs list_of_services -j ACCEPT

/sbin/iptables -A INPUT -p udp -s server --sport sunrpc
    -d client --dport 0:1023
    -i eth0 -m state --state ESTABLISHED -j ACCEPT

/sbin/iptables -A OUTPUT -p tcp -s client --sport 0:1023
    -d server --dport sunrpc
    -o eth0 -m rpc --rpcs list_of_services -j ACCEPT

/sbin/iptables -A INPUT -p tcp -s server --sport sunrpc
    -d client --dport 0:1023
    -i eth0 -m state --state ESTABLISHED -j ACCEPT

So, this should allow for both TCP and UDP connections to portmapper on 
host "server".  It should also allow me to allow only connections to 
specified RPC services in subsequent rules.  Well, UDP part works.  But 
TCP doesn't work exactly as expected.

I've added some logging rules that will log all portmapper packets with 
either "RPC UDP" or "RPC TCP" prefix, and placed them before above 
mentioned rules.  Also added logging rules that will log dropped packets 
with "OUTPUT" or "INPUT" prefix (depending in which chain they were 
dropped) and placed them at the very end of my rules, just before the 
unmatched packets are dropped by default policy.

What I can see from log files is that three way handshake goes well. 
Edited and formated a bit for clarity:

RPC TCP IN= OUT=eth0 SRC=client DST=server
     LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=11551 DF
     PROTO=TCP SPT=690 DPT=111 WINDOW=5840 RES=0x00 SYN URGP=0

RPC TCP IN=eth0 OUT= SRC=server DST=client
     LEN=64 TOS=0x00 PREC=0x00 TTL=63 ID=12081 DF
     PROTO=TCP SPT=111 DPT=690 WINDOW=33304 RES=0x00 ACK SYN URGP=0

RPC TCP IN= OUT=eth0 SRC=client DST=server
     LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=49320 DF
     PROTO=TCP SPT=690 DPT=111 WINDOW=5840 RES=0x00 ACK URGP=0

However, all subsequent packets are being dropped (this two lines are 
for the same packet, logged as it entered the chain, and again just 
before it was dropped by default policy):

RPC TCP IN= OUT=eth0 SRC=client DST=server
     LEN=96 TOS=0x00 PREC=0x00 TTL=64 ID=25452 DF
     PROTO=TCP SPT=690 DPT=111 WINDOW=5840 RES=0x00 ACK PSH URGP=0

OUTPUT IN= OUT=eth0 SRC=client DST=server
     LEN=96 TOS=0x00 PREC=0x00 TTL=64 ID=25452 DF
     PROTO=TCP SPT=690 DPT=111 WINDOW=5840 RES=0x00 ACK PSH URGP=0

The above two lines are repeating several times, until client gives up. 
  After that, client fails over to UDP, and from that point on 
everything works as expected.

Using tcpdump basically gives same information (I can see three way 
handshake going on the wire, and after it there's silence).

I've tried adding "-m state --state NEW,ESTABLISHED" to the third line 
of my rules (the one allowing outgoing TCP portmapper requests).  And 
got same results.  For some reason, Netfilter "forgets" that there's 
established connection between cilent and server, and simply starts to 
drop packets.

Has anybody else run across this problem?  Or am I doing something 
obviously wrong?  I've tried digging around in documentation, Googling, 
experimenting, always with the same end result.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

