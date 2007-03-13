From: richard lucassen <mailinglists@lucassen.org>
Subject: time module
Date: Tue, 13 Mar 2007 10:16:04 +0100
Message-ID: <20070313101604.6db3dc22.mailinglists@lucassen.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I try to compile iptables-1.3.7 with the time module. AFAICS there is no
need anymore for the patch-o-matic. There is a libipt_time.c in the
extensions directory but no libipt_time.h in the
include/linux/netfilter_ipv4 directory.

I searched here and there and found the extensions/Makefile. I added the
time module to this Makefile, but with this result:

Unable to resolve dependency on linux/netfilter_ipv4/ipt_time.h.

Anyone a hint?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

