From: John Desmond <jmdroot-leaf@yahoo.com>
Subject: Odd date field in netfilter logs
Date: Wed, 28 Jul 2004 09:21:56 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040728162156.59559.qmail@web14204.mail.yahoo.com>
Reply-To: jmdroot-leaf@yahoo.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm using the LEAF firewall (Bering) and I see entries
in my logs where the date field has been zeroed out,
probably defaulting to 1/1/70 00:00:00 UTC, which then
translates to 12/31/69 19:00:00 in my time zone.

Here's a sample:

Jul 27 11:50:56 firewall Shorewall:net2all:DROP:
IN=ppp0 OUT= MAC= SRC=219.150.118.21 DST=138.88.147.32
LEN=1147 TOS=00 PREC=0x00 TTL=107 ID=60031 CE
PROTO=UDP SPT=15008 DPT=1026 LEN=1127
Dec 31 19:00:00 firewall Shorewall:all2all:REJECT: IN=
OUT=eth1 MAC= SRC=192.168.1.254 DST=192.168.1.185
LEN=331 TOS=00 PREC=0x00 TTL=64 ID=46672 CE DF
PROTO=UDP SPT=67 DPT=68 LEN=311
Dec 31 19:00:00 firewall Shorewall:all2all:REJECT: IN=
OUT=eth1 MAC= SRC=192.168.1.254 DST=192.168.1.185
LEN=331 TOS=00 PREC=0x00 TTL=64 ID=34851 CE DF
PROTO=UDP SPT=67 DPT=68 LEN=311
Jul 27 12:01:16 firewall Shorewall:net2all:DROP:
IN=ppp0 OUT= MAC= SRC=218.78.209.68 DST=138.88.147.32
LEN=1108 TOS=00 PREC=0x00 TTL=108 ID=48679 CE
PROTO=UDP SPT=18585 DPT=1026 LEN=1088

It seems to happen only in REJECTs. Could this
possibly be caused by a misconficuration? a bad
iptable statement?

I'm not the only one experiencing this. A google for
these date strings shows that they are in a lot of
logs.

-John


