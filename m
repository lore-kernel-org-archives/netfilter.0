From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: physdev match
Date: Thu, 23 Sep 2004 17:03:43 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a040923070324faf49f@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Ok, I got a stock kernel 2.4.27 patched with ebtables-bnrf, and
noticed that it has added physdev match.
But whenever I try to test a rule with -m physdev --physdev-in <int> 
it gives me

iptables: Invalid argument

Any special requirements to use it ??

-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

