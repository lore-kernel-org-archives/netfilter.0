From: "Amadej Bukorovic" <amadej@minet.si>
Subject: "NET: 218 messages suppressed" and "TCP: drop open request from"
Date: Sat, 9 Nov 2002 00:22:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006601c2877d$a999dcd0$0301010a@nexus>
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

Hello everyone
I'm hoping someone can explain to me the following flood of messages I
found in my kernel log file:

A lot of:
"Nov  8 15:47:19 mybox kernel: New,not syn:IN=eth0 OUT=
MAC=00:50:8b:bd:05:1b:00:00:0c:5d:46:57:08:00 SRC=212.30.69.131
DST=<XXX> LEN=40 TOS=0x00 PREC=0x00 TTL=124 ID=26922 PROTO=TCP SPT=3264
DPT=80 WINDOW=0 RES=0x00 ACK URGP=0
Nov  8 15:47:20 mybox kernel: New,not syn:IN=eth0 OUT=
MAC=00:50:8b:bd:05:1b:00:00:0c:5d:46:57:08:00 SRC=212.30.69.131
DST=<XXX> LEN=40 TOS=0x00 PREC=0x00 TTL=124 ID=26982 PROTO=TCP SPT=3266
DPT=80 WINDOW=0 RES=0x00 ACK URGP=29742
Nov  8 15:47:31 mybox kernel: New,not syn:IN=eth0 OUT=
MAC=00:50:8b:bd:05:1b:00:00:0c:5d:46:57:08:00 SRC=212.30.69.131
DST=<XXX> LEN=40 TOS=0x00 PREC=0x00 TTL=124 ID=28212 PROTO=TCP SPT=3283
DPT=80 WINDOW=0 RES=0x00 ACK URGP=0
Nov  8 15:47:31 mybox kernel: New,not syn:IN=eth0 OUT=
MAC=00:50:8b:bd:05:1b:00:00:0c:5d:46:57:08:00 SRC=212.30.69.131
DST=<XXX> LEN=40 TOS=0x00 PREC=0x00 TTL=124 ID=28214 PROTO=TCP SPT=3284
DPT=80 WINDOW=0 RES=0x00 ACK URGP=0"

and after a while followed by:
"Nov  8 15:47:51 mybox kernel: TCP: drop open request from
212.30.69.131/4824
Nov  8 15:47:51 mybox kernel: TCP: drop open request from
212.30.69.131/4825
Nov  8 15:47:51 mybox kernel: TCP: drop open request from
212.30.69.131/4826
Nov  8 15:47:51 mybox kernel: TCP: drop open request from
212.30.69.131/4827
Nov  8 15:47:52 mybox kernel: TCP: drop open request from
193.77.246.66/4389"

and finally a bunch of this type of messages:

"Nov  8 15:47:56 mybox kernel: NET: 148 messages suppressed.
Nov  8 15:48:11 mybox kernel: NET: 232 messages suppressed."

212.30.69.131 was the client's IP address, never mind the <XXX> in DST ,
I changed it (don't hold it against me).
It seems my Linux machine was flooded by the number of bad packages this
client sent (well at least that's what I think).. can someone explain
this to me - was this an accident (and how it happened) or was it some
kind of a DOS attempt?

Any info on this would be appreciated..
Regards, 
Amadej.




