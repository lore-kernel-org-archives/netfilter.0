From: Graham Swallow <Information-Cascade@ntlworld.com>
Subject: INCOMPLETE [ 8bytes] with two src addresses!
Date: Fri, 27 Feb 2004 17:56:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
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

I've never seen this log before (split lines).
Is it simply someones modem noise
How can it have two SRC addresses?

Feb 27 17:50:37 sky1 kernel: fw-drop IN=eth1
OUT= MAC=....
SRC=216.200.115.66
DST=80.5.144.39
LEN=56
TOS=0x00
PREC=0x00
TTL=247
ID=0
PROTO=ICMP
TYPE=11
CODE=0
[SRC=80.5.144.39 DST=200.179.192.14 LEN=40 TOS=0x00 PREC=0x00 TTL=1 ID=12701 PROTO=TCP INCOMPLETE [8 bytes] ] 


-- 
   regards
--
   Graham
   Information-Cascade (at) ntlworld.com

