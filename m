From: Martin Whinnery <martin.whinnery@sbirmc.ac.uk>
Subject: transparent proxy with captive page - ipt_recent?
Date: Mon, 25 Jun 2007 16:40:20 +0100
Message-ID: <467FE1E4.2040306@sbirmc.ac.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

Here's what I'm trying to do:

I've got a gateway box, running squid on port 8080, and apache on port 82.

I've got transparent proxying working fine, using a redirect rule in the 
prerouting table.

What I'd like to do is, the first time a web connection from IP 'n' 
comes in, they get a page from apache, telling users a proxy address 
they may want to set, in which case they'll get https proxying etc.

But if they don't bother, I'd like further web requests redirected to 
the proxy for transparent proxying, until a certain amount of idleness 
has gone by, when we revert to the local page again.


So everyone gets proxy instructions when they start browsing, and the 
lazy ones get transparent proxying.

I thought I could do this with ipt_recent, but it's not happening.

Here's me rules:

/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -m recent --rcheck 
--seconds 30 -j REDIRECT --to-ports 8080
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -m recent --set -j 
REDIRECT --to-ports 82

So I thought the first rule wouldn't match first time around. Then the 
second rule would provide the proxy instructions page, and make the 
/proc/sys/net/ipt_recent/DEFAULT entry. This works fine.

But the first rule should match on the next request. And it doesn't seem 
to. And I don't understand.

Any thoughts?

Mart

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


