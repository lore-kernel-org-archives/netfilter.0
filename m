From: Johannes Graumann <graumann@caltech.edu>
Subject: patch-o-matic-ng questions and remarks from newbie
Date: Thu, 4 Nov 2004 20:20:34 -0800
Message-ID: <20041104202034.705cddcb@localhost>
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

Hello,

In order to use my shorewall/2.6 based firewall to route IPSECed
(openswan) wireless, I need to apply these patches from the
patch-o-matic-ng (extra):
1) ipsec-01-output-hooks
2) ipsec-02-input-hooks
3) ipsec-03-policy-lookup
4) ipsec-04-policy-checks
5) policy

It took me a whole night to figure out that these are only cleanly
applicable to a 2.6.6 kernel and nothing later - which is ok with me ...
if I only would have managed to find this information without loading
down 2.6.9, 2.6.8, 2.6.7 and 2.6.6 source and testing the patch-o-matic
with every single one of these! Can somebody please help me dummy in
finding this information? Are these patches expected to get a revamp to
be capable to cope with 2.6.9?
On another note: are/when are these features scheduled to go into the
2.6 series?

Thanks for any hints,

Joh


