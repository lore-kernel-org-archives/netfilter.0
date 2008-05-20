From: "Jaroslav Rakhmatoullin" <jazzoslav@gmail.com>
Subject: iptables -t raw [conditions] -j TRACE is not logging
Date: Tue, 20 May 2008 07:32:09 +0200
Message-ID: <9a7fd99c0805192232o2399fd48rb462a131da9fd2f6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=lqukpqpeC/Mr4j/8bDC4q2iaKbASgm3TpVLgwrmZRHg=;
        b=dwv3BrHXSVRalFwBmwFfOGeBfGxTgYXpVLX6y4+46y//rdsxsamTIIxJU2sM2/1+K93SgPlw+esWU8cmEGom53fnOj2SfdHBHDHIOCGovdNKIbYTJZG0kThMRTAd0ZLcaOl9VS/LNjzsRgch8J0F3tZ6h1TllBnSAqKm4w7LKgs=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Host description

distro: gentoo 2007.0 amd64
kernel: linux 2.6.23-gentoo-r8
ntfltr: iptables v1.4.0
logger: syslog-ng 2.0.6

Problem description
iptables TRACE target never gives any output through ipt_LOG and syslog-ng

I have successfully configured masquerading on the gateway with stuff
like browsing, counter-strike:source, azureus and samba/nfs working
behind it. To account for my lack in experience with netfilter I've
set up logging through both ipt_LOG and ipt_ULOG to monitor dropped
and rejected traffic. This has gotten me pretty far, but now I'm
stuck. That is, I need more diagnostics/debugging over the netfilter
rules.

I installed the latest iptables package which supports the -j TRACE
target. The kernel has support for this too. I can actually run

iptables -t raw -A PREROUTING -p tcp --dport 80 -j TRACE
iptables -t raw -A OUTPUT -p tcp --dport 80 -j TRACE

without errors about illegal/missing chains/targets/matches.
Logging through syslog-ng and ulogd works because I see stuff like

May 20 04:07:46 raptor a   ping  IN=eth0 OUT= MAC=00  SRC=10.3.0.1
DST=10.3.0.5 LEN=84 TOS=00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP TYPE=8
CODE=0 ID=1906 SEQ=5
May 20 05:33:10 raptor a   loop  IN=lo OUT= MAC=00  SRC=10.3.0.5
DST=10.3.0.5 LEN=80 TOS=00 PREC=0xC0 TTL=64 ID=16564 PROTO=ICMP TYPE=3
CODE=3

in my ulogd [LOGEMU] file and

05 20 04:06:43 tryggve kernel TRACE target: only valid in raw table, not filter
05 20 04:08:20 tryggve kernel a  Lping IN= OUT=eth1 SRC=10.3.0.1
DST=10.3.0.5 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=ICMP
TYPE=8 CODE=0 ID=1906 SEQ=1

in /var/log/messages. (Dont mind the TRACE error above, I was using -t filter.)
The expected behavior of -j TRACE is do dump iptables rules a given
packet goes through to syslog. Surprisingly i get nothing even when
specifying port 80 traffic to be TRACEd.


If anyone has made this work for them I am very curious as to how they
did it. If you want to have a look at my kernel .config or
syslog-ng.conf or anything else on my system don't hesitate to ask,
but I can't imagine the problem is rooted in the daemon configs.
