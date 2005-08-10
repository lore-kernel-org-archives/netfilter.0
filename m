From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: BUG tc_util.c print_rate prints bytes as bits
Date: Wed, 10 Aug 2005 06:42:55 -0500
Message-ID: <20050810114255.GA12356@pog.tecnopolis.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

The output of "tc -s class show dev ppp0" shows current flow rates like
"rate 2009bit 3pps".  The "bit" text should read "byte".  The number given 
is Bytes per second (Bps), not bps.  This is obvious from empirical study 
as well as in the source:

pkt_sched.h : struct tc_stats
  __u32   bps;                    /* Current flow byte rate */

tc_qdisc.c : print_tcstats_attr
  fprintf(fp, "%s ", sprint_rate(st.bps, b1));
  (st is struct tc_stats and so bps is BYTES as per comment above)

tc_util.c : print_rate
  double tmp = (double)rate*8;
  (is bogus since it's already bytes, by are we * 8??)

  snprintf(buf, len, "%ubit", rate);
  (rate unmodified is bytes, not bits, and why do we use tmp for the other 
  snprintfs but not here?)


The easy solution is change print_rate to operate on rate in bytes, not do 
any *8 and change the literal strings to reflect this fact.

Please see this bug also at:
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=165544

