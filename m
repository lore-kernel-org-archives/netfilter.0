From: Marcus Zoller <Marcus.Zoller@idnt.net>
Subject: ICMP type 3 input not related?
Date: 10 Jun 2002 17:37:38 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023723458.5925.61.camel@Snoopy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi!

my rules allow related icmp type 3 input but this seems to be broken for
the following:

IN=eth2 OUT= MAC=... SRC=[remote] DST=[local] LEN=56 TOS=0x00 PREC=0x00 TTL=141 
	ID=0 PROTO=ICMP TYPE=3 CODE=3 
	[SRC=[local] DST=[remote] LEN=204 TOS=0x00 PREC=0x00 TTL=54 ID=0 DF 
	PROTO=UDP SPT=1 DPT=500 LEN=184 ]

iptables 1.2.6a, kernel 2.4.18 (with 2.4.19-pre6_icmp-nat.patch)

This works for anything else, just the ICMP reply to an connection from UDP SPT=1 to 
DST=500 is not caught as related...

Someone with an idea why this is not handled as related?

thanks!
-marcus



- IDNT Antivirus Solutions -
This messages was scanned for virus infection on the IDNT Gateway Series. For more informations on how to protect your network see http://idnt.net/de/security/vprot.xsm or call us now: +49 6403 9526 0.

