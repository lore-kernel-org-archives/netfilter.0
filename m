From: "John Paul" <john@pinoylinux.sytes.net>
Subject: pptp broken after POM
Date: Thu, 13 Nov 2003 09:12:37 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00cd01c3a983$3a96ff10$63000a0a@pooh>
References: <3FB2C509.5070703@yahoo.com>
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

Hello Folks,

I got my PPTP working before patching my kernel with POM. Below is the log
when trying to connect to the vpn server. Am i missing something after the
POM patch?

iptables-1.2.9rc1
linux-2.4.22

Thanks.
PJ.

Nov 13 09:11:17 mail pppd[8395]: pppd 2.4.1 started by root, uid 0
Nov 13 09:11:17 mail pppd[8395]: using channel 3
Nov 13 09:11:17 mail pppd[8395]: Using interface ppp1
Nov 13 09:11:17 mail pppd[8395]: Connect: ppp1 <--> /dev/pts/3
Nov 13 09:11:17 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:19 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:20 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:22 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:23 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:26 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:26 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:29 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:30 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:32 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:34 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:35 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:38 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:38 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:41 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:42 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:44 mail pppd[8395]: sent [LCP ConfReq id=0x1 <asyncmap 0x0>
<auth chap 81> <magic 0x65a9be36> <pcomp> <accomp>]
Nov 13 09:11:46 mail pptpd[8394]: GRE: Discarding for incorrect call
Nov 13 09:11:47 mail pppd[8395]: LCP: timeout sending Config-Requests
Nov 13 09:11:47 mail pppd[8395]: Connection terminated.
Nov 13 09:11:47 mail pppd[8395]: Exit.
Nov 13 09:11:47 mail pptpd[8394]: GRE: read(fd=5,buffer=804d920,len=8196)
from PTY failed: status = -1 error = Input/output error
Nov 13 09:11:47 mail pptpd[8394]: CTRL: PTY read or GRE write failed
(pty,gre)=(5,6)
Nov 13 09:11:47 mail pptpd[8394]: CTRL: Client 10.10.0.99 control connection
finished


