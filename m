From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: False alarms of invalid packets
Date: Wed, 23 Feb 2005 10:48:44 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0502231015000.8085@l01.thnet>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello!

As of kernel 2.6.10 ( AFAIK it didn't happen with 2.6.6 ) I'm frequently 
noting valid packets that are matched by

-A FORWARD -i $INET_IF -p tcp ! --syn -m conntrack --ctstate NEW -j LOG --log-tcp-sequence --log-tcp-options --log-ip-options --log-prefix \"ILLEGAL CONNECT \"
-A FORWARD -i $INET_IF -p tcp ! --syn -m conntrack --ctstate NEW -j DROP

The log then reports:

ILLEGAL CONNECT IN=eth0 OUT=eth4 SRC=... DST=... LEN=88 TOS=0x00 PREC=0x00 TTL=54 ID=51407 DF PROTO=TCP SPT=59161 DPT=993
SEQ=419025884 ACK=1649134821 WINDOW=65535 RES=0x00 ACK PSH URGP=0 OPT (0101080A8B9F9B5983C5BFAB)

This happens for connections established for a longer time, such as IMAP, 
HTTP or SSH .

Thanks in advance,
Michael

