From: Willy Tarreau <willy@w.ods.org>
Subject: [PATCH-2.4-POM] sessions stuck in CLOSE_WAIT state
Date: Wed, 8 Oct 2003 00:18:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031007221817.GA487@alpha.home.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: kadlec@blackhole.kfki.hu
Cc: netfilter@lists.netfilter.org, laforge@netfilter.org

Hello !

I have installed 2 new Netfilter-based firewalls at a customer's a few weeks
ago. They use mainline 2.4.22 + the tcp_window_tracking patch from
pom-20030912. They're being load-balanced by external equipments (alteon)
and used only for incoming HTTP connections.

Since they're in production, I have been noticing some quirks that didn't
show up on the homologation platform, nor development platform, despite a
ten-fold load for the later :
  - under a load of about 500 hits/s/firewall, I got almost every second one
    of those common messages "out of window data", "invalid scale", ...
  - I noticed a *LOT* of drops (about 2.5% of all logs ; only accepted SYNs
    and drops are logged).
  - there are a *LOT* of CLOSE_WAIT sockets in /proc/net/ip_conntrack (about
    40000 per firewall with the default 3 days timeout).

I had some time this evening to dig through the logs, but only noticed that
some packets were dropped for unknown reasons, such as FIN/ACKs or RSTs,
most of which were coming from our servers.

So I set up a test platform between two PCs to try to reproduce. The client
injected at about 400 hits/s on the server (thttpd), which BTW also hosted
4 rules which logged the session state (NEW, ESTABLISHED, RELATED, INVALID).
No problem showed up without the tcp_windows_tracking patch. Interestingly,
with it, as soon as the client ports were reused, I began to get INVALID
entries in my logs. And long before that, I already had many CLOSE_WAIT
sessions while neither the client nor the server had any of them left.

Fortunately, tcpdump showed to me that all stuck sessions had in common the
fact that the server aborted them with an RST after the first FIN+ACK, so
in CLOSE_WAIT. Others which were aborted with an RST just before or just after
were destroyed without any problem.

Then I enabled full debugging in ip_conntrack_proto_tcp.c and could capture
this session :

=== begin cut here ===

Oct  7 20:22:24 wta-tig tcp_in_window: START
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441844 ack=0 sack=0 win=5840 end=379441845
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379441845 maxwin=5840 scale=0 receiver end=0 maxend=0 maxwin=1 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441844 ack=0 sack=0 win=5840 end=379441845
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379441845 maxwin=5840 scale=0 receiver end=0 maxend=0 maxwin=1 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: I=1 II=1 III=1 IV=1
Oct  7 20:22:24 wta-tig tcp_in_window: res=1 sender end=379441845 maxend=379441845 maxwin=5840 receiver end=0 maxend=5840 maxwin=1
Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.1:53541 dst=10.0.0.2:80 syn=1 ack=0 fin=0 rst=0 old=1 new=1

Oct  7 20:22:24 wta-tig NEW IN=eth0 OUT= MAC=00:04:76:11:b6:86:08:00:46:6f:30:d9:08:00 SRC=10.0.0.1 DST=10.0.0.2 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=43524 DF PROTO=TCP SPT=53541 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0 

Oct  7 20:22:24 wta-tig tcp_in_window: START
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.2:80 dst=10.0.0.1:53541 seq=4059370607 ack=379441845 sack=379441845 win=5792 end=4059370608
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=0 maxend=5840 maxwin=1 scale=0 receiver end=379441845 maxend=379441845 maxwin=5840 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.2:80 dst=10.0.0.1:53541 seq=4059370607 ack=379441845 sack=379441845 win=5792 end=4059370608
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=4059370608 maxend=4059370608 maxwin=5792 scale=0 receiver end=379441845 maxend=379441845 maxwin=5840 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: I=1 II=1 III=1 IV=1
Oct  7 20:22:24 wta-tig tcp_in_window: res=1 sender end=4059370608 maxend=4059370608 maxwin=5792 receiver end=379441845 maxend=379447637 maxwin=5840
Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.2:80 dst=10.0.0.1:53541 syn=1 ack=1 fin=0 rst=0 old=1 new=2
Oct  7 20:22:24 wta-tig tcp_new: sender end=389142051 maxend=389142051 maxwin=5840 scale=0 receiver end=0 maxend=0 maxwin=1 scale=0

Oct  7 20:22:24 wta-tig tcp_in_window: START
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441845 ack=4059370608 sack=4059370608 win=5840 end=379441845
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379447637 maxwin=5840 scale=0 receiver end=4059370608 maxend=4059370608 maxwin=5792 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441845 ack=4059370608 sack=4059370608 win=5840 end=379441845
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379447637 maxwin=5840 scale=0 receiver end=4059370608 maxend=4059370608 maxwin=5792 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: I=1 II=1 III=1 IV=1
Oct  7 20:22:24 wta-tig tcp_in_window: res=1 sender end=379441845 maxend=379447637 maxwin=5840 receiver end=4059370608 maxend=4059376448 maxwin=5792
Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.1:53541 dst=10.0.0.2:80 syn=0 ack=1 fin=0 rst=0 old=2 new=3

Oct  7 20:22:24 wta-tig tcp_in_window: START
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.2:80 dst=10.0.0.1:53541 seq=4059370608 ack=379441845 sack=379441845 win=5792 end=4059370609
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=4059370608 maxend=4059376448 maxwin=5792 scale=0 receiver end=379441845 maxend=379447637 maxwin=5840 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.2:80 dst=10.0.0.1:53541 seq=4059370608 ack=379441845 sack=379441845 win=5792 end=4059370609
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=4059370608 maxend=4059376448 maxwin=5792 scale=0 receiver end=379441845 maxend=379447637 maxwin=5840 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: I=1 II=1 III=1 IV=1
Oct  7 20:22:24 wta-tig tcp_in_window: res=1 sender end=4059370609 maxend=4059376448 maxwin=5792 receiver end=379441845 maxend=379447637 maxwin=5840
Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.2:80 dst=10.0.0.1:53541 syn=0 ack=1 fin=1 rst=0 old=3 new=4

Oct  7 20:22:24 wta-tig tcp_in_window: START
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441845 ack=4059370609 sack=4059370609 win=5840 end=379441845
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379447637 maxwin=5840 scale=0 receiver end=4059370609 maxend=4059376448 maxwin=5792 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441845 ack=4059370609 sack=4059370609 win=5840 end=379441845
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379447637 maxwin=5840 scale=0 receiver end=4059370609 maxend=4059376448 maxwin=5792 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: I=1 II=1 III=1 IV=1
Oct  7 20:22:24 wta-tig tcp_in_window: res=1 sender end=379441845 maxend=379447637 maxwin=5840 receiver end=4059370609 maxend=4059376449 maxwin=5792
Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.1:53541 dst=10.0.0.2:80 syn=0 ack=1 fin=0 rst=0 old=4 new=5

Oct  7 20:22:24 wta-tig tcp_in_window: START
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441845 ack=4059370609 sack=4059370609 win=5840 end=379441959
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379447637 maxwin=5840 scale=0 receiver end=4059370609 maxend=4059376449 maxwin=5792 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: src=10.0.0.1:53541 dst=10.0.0.2:80 seq=379441845 ack=4059370609 sack=4059370609 win=5840 end=379441959
Oct  7 20:22:24 wta-tig tcp_in_window: sender end=379441845 maxend=379447637 maxwin=5840 scale=0 receiver end=4059370609 maxend=4059376449 maxwin=5792 scale=0
Oct  7 20:22:24 wta-tig tcp_in_window: I=1 II=1 III=1 IV=1
Oct  7 20:22:24 wta-tig tcp_in_window: res=1 sender end=379441959 maxend=379447637 maxwin=5840 receiver end=4059370609 maxend=4059376449 maxwin=5792
Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.1:53541 dst=10.0.0.2:80 syn=0 ack=1 fin=0 rst=0 old=5 new=5

Oct  7 20:22:24 wta-tig tcp_conntracks: src=10.0.0.2:80 dst=10.0.0.1:53541 syn=0 ack=0 fin=0 rst=1 old=5 new=10
Oct  7 20:22:24 wta-tig ip_conntrack_tcp: Invalid dir=1 index=4 conntrack=5

=== end cut here ===

(value 5 is CLOSE_WAIT, and 10 is INVALID or TCP_CONNTRACK_MAX). You see that
an RST has been handled very early in the code path, on the last two lines.

In fact, the thttpd server was rejecting some connections, sending an RST and
closing its local connection. The client normally terminated its connection,
and only the firewall kept it in CLOSE_WAIT. Then, when the client wanted to
reuse the port later (since the session did no longer exist), the firewall
noticed that a session still existed for this port, and that sequence numbers 
did not match, which led to some more logs, and to the client not being able
to connect.

The code without tcp_window_tracking correctly sets the session to the CLOSE
state when receiving an RST in CLOSE_WAIT. This is why I could never make it
complain :

/*     REPLY */
/*       sNO, sES, sSS, sSR, sFW, sTW, sCL, sCW, sLA, sLI      */
/*syn*/ {sSR, sES, sSR, sSR, sSR, sSR, sSR, sSR, sSR, sSR },
/*fin*/ {sCL, sCW, sSS, sTW, sTW, sTW, sCL, sCW, sLA, sLI },
/*ack*/ {sCL, sES, sSS, sSR, sFW, sTW, sCL, sCW, sCL, sLI },
/*rst*/ {sCL, sCL, sCL, sCL, sCL, sCL, sCL, sCL, sLA, sLI },
/*none*/{sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV }

But the tcp_window_tracking patch changes this behaviour, I think because of
a typo, since I see no other reason not to terminate a session upon RST :

/*          sNO, sSS, sSR, sES, sFW, sCW, sLA, sTW, sCL, sLI   */
/*rst*/   { sIV, sCL, sCL, sCL, sCL, sIV, sCL, sCL, sCL, sIV },
/*none*   { sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV }

BTW, is it normal that an RST received in TIME_WAIT state terminates the
session ? I would have thought that we should keep it in TIME_WAIT anyway.

So I simply applied this trivial patch, and could never trigger the problem
anymore, even at 2500 hits/s : all sessions properly terminate, and I don't
even get any "Out of window" message on my test platform anymore. I will
soon patch the homologation then the production machines with it.

Here it is :

--- linux-2.4.23-pre6-pom-20030912/net/ipv4/netfilter/ip_conntrack_proto_tcp.c.orig	Tue Oct  7 23:06:49 2003
+++ linux-2.4.23-pre6-pom-20030912/net/ipv4/netfilter/ip_conntrack_proto_tcp.c	Tue Oct  7 23:07:12 2003
@@ -271,7 +271,7 @@
  *	sCL -> sCL
  */
 /* 	     sNO, sSS, sSR, sES, sFW, sCW, sLA, sTW, sCL, sLI	*/
-/*rst*/    { sIV, sCL, sCL, sCL, sCL, sIV, sCL, sCL, sCL, sIV },
+/*rst*/    { sIV, sCL, sCL, sCL, sCL, sCL, sCL, sCL, sCL, sIV },
 /*none*/   { sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV, sIV }
 	}
 };

Could you please review and/or apply it to recent patch-o-matic ?

BTW, I noticed that the tcp_conntracks[] array takes some memory because every
entry takes one full int. This is 480 bytes on x86. Wouldn't it be more cache-
friendly to use compact structures with bit fields instead ?

For example, either something like this (byte-aligned) :
  u8 tcp_conntracks[6][10] = { (REPLY_STATE)<<4 | (ORIGINAL_STATE), ... }
   -> read it from (tcp_conntrack[flag][old_state] >> dir?4:0) & 0xF

or (u32 aligned) 80 bytes :
  int tcp_conntracks[2][10] = { /* original */
                                { /* old sNO */
                                  sSS << SYN | sTW << FIN | sES << ACK ...
  -> read id from (tcp_conntrack[dir][old_state] >> flag*4) & 0xF.

Same could be done on unclean(). If someone's interested, I can try to look
at what seems possible, and propose something.

Regards,
Willy


