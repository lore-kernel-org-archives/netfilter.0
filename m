From: d l <popgojp@yahoo.co.jp>
Subject: Cannot use iptable extensions
Date: Mon, 20 Sep 2004 17:20:59 +0900 (JST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040920082059.57559.qmail@web805.mail.yahoo.co.jp>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I am using vanilla Fedora Core 2, without configuring
firewall in anaconda during initial install.

Simple rules seems to works with built in modules. e.g. 
iptables -A INPUT -p ICMP -j DROP

However when I tried to use extension modules like
<connlimit> and <owner>, iptables always gives me error.

For <owner>:
iptables -m owner --help
.......
OWNER match v1.2.9 options:
[!] --uid-owner userid     Match local uid
[!] --gid-owner groupid    Match local gid
[!] --pid-owner processid  Match local pid
[!] --sid-owner sessionid  Match local sid
[!] --cmd-owner name       Match local command name

# iptables -A INPUT -m owner --cmd-owner mlnet -j test
iptables: Invalid argument

# iptables -m owner --cmd-owner
iptables v1.2.9: Unknown arg `--cmd-owner'
Try `iptables -h' or 'iptables --help' for more
information.

And similar results with <connlimit> extension.

There are corresponding so files in /lib/iptables for that
2 extensions.
/lib/iptables/libipt_connlimit.so
/lib/iptables/libipt_owner.so

So what is wrong with my iptables? It looks like that it
didn't load the extensions properly to me.

Any help is appreciated.

Regards,
Dil Lee

__________________________________
TSUKAME EIKOU! KAGAYAKE EGAO!
Yahoo! JAPAN JPC OFFICIAL INTERNET PORTAL SITE
http://pr.mail.yahoo.co.jp/para/


