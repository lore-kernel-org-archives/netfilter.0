From: <mlist@libero.it>
Subject: Difference between arp proxy and dnat?
Date: Tue, 5 Oct 2004 14:35:19 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <34146.5325364426$1096979747@news.gmane.org>
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
To: netfilter@lists.netfilter.org

Hi

Reading emails in this mailing list and with some google searches, I
understood that to provide public access to servers in a dmz there are
several ways.

1) use of subnetting
2) use of dnat with rules like this:
(iptables -t nat -A PREROUTING --destination w.x.y.z -j DNAT --to
${My_NEW_ADDR})
3) use of proxy arp

I always used DNAT when possible but in one of our office, there is a
Checkpoint Firewall (that I would like to replace with iptable) that use
proxyarp.... because I think Checkpoint can only use proxy arp.
Moreover, reading ASTARO documentation is explained that it can use proxy
arp but it doesn't explain when use it.

What I never understood is the difference between dnat and proxy arp.
Unfortunately I'n not a network guru thus, can someone answer (AS SIMPLE AS
POSSIBLE) to my stupid questions?

a) What is the difference between them?
b) Are there situation in which I could be forced to use one of them?
c) What is the best?
d) Why lot of famous firewall suggest to use arp proxy?


Thanks in advance

Marco
Italy

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.772 / Virus Database: 519 - Release Date: 01/10/2004
 



