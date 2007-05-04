From: richard lucassen <mailinglists@lucassen.org>
Subject: conntrack: Operation failed: invalid parameters
Date: Fri, 4 May 2007 11:54:03 +0200
Message-ID: <20070504115403.0f5c023d.mailinglists@lucassen.org>
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

When using the 2.6.16.x branch (which is still maintained) I get an
error using conntrack:

# conntrack -L
Operation failed: invalid parameters

When using kernel 2.6.20.7 there's no problem. I'd like to use the
kernel 2.6.16.x branch, but I cannot find the patch which resolves the
above mentioned problem.

Does someone know which patch to apply to 2.6.16.x?

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

