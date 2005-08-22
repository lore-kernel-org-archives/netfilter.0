From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: AS_IPFW 4.0 released
Date: Mon, 22 Aug 2005 16:09:25 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508211037480.2412@yvahk01.tjqt.qr>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>


I am proud to announce the release of AS_IPFW 4.0. AS_IPFW is
designed to be a firewall API, but also has some rulesets that
can be used as-is in many situations. Version 4.0 adds support
for kernel-level iptables-based STEALTH SCAN (tcp half open)
detection -- a first according to my research (with a nameful
search engine). It also dramatically slows down TCP FNX
(FIN/NULL/XMAS) scans -- by more than 50000%, and UDP by more
than 65000%! On top, it provides back false information to do
the best in hindering and confusing hostile actions.

You are welcome to read the "Technical Details" I have written
if you are interested (that's what has delayed this release so
long). Some parts of AS_IPFW 4.0 have not yet received thorough
testing (as is usual with x.0 releases). You are encouraged to
do so, but beware, it takes kernel and iptables patches to get
it going.

A big thanks goes out to the creators of the CONNMARK, RANDOM,
REJECT, TARPIT and goo matches/targets, which make up the
essence of this release.


http://freshmeat.net/p/AS_IPFW/

