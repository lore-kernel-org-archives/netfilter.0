From: Mail Lists <lists@sapience.com>
Subject: subnet problem
Date: Sun, 18 Jul 2004 16:50:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040718205007.GA7576@sapience.com>
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
To: netfilter@lists.netfilter.org


  I'd appreciate help here.

  I disallow iana reserved and some rfc 1918 from my firewall.

  The line in question is this:

  cRES_LDROP  all  --  172.16.0.0/12        0.0.0.0/0

  which I would expect to block 172.16 to 172.31. 

  However I get these in my log files:

  Jul 18 16:21:47 fw kernel:  [FW Drop-Res] IN=eth1 OUT= MAC=<xx> SRC=172.139.140.122 DST=<myip> LEN=48 TOS=0x00 PREC=0x00 TTL=109 ID=30189 DF PROTO=TCP SPT=3477 DPT=1025 WINDOW=16384 RES=0x00 SYN URGP=0

   I'm stumped - why did 172.139 get dropped here? Not that the packet 
 wouldn't have gotten dropped later anyway but this rule should not
 have matched?

 Suggestions?

  gene/







