From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: ip_conntrack_ftp in /proc/modules
Date: Thu, 26 Feb 2004 16:25:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226162547.35e51e6c.j.vriesman@prompt.nl>
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

Hi,

found something weird, seems like a bug to me. (kernel 2.4.24)

I wanted to mark ftp packets in the PREROUTING mangle table with:

iptables -t mangle -A PREROUTING -m helper --helper ftp -j MARK --set-mark 10

didn't work at first, but if I load the module "ip_conntrack_ftp" with insmod, and then make the rule (not the other way around), it does work.
So far so good, no problem.

But when I do "cat /proc/modules":

ip_conntrack_ftp        3984   0 (unused)
ip_conntrack           19812   2 (autoclean) [ip_conntrack_ftp ipt_helper ipt_CONNMARK]


Shouldn't it say that ip_conntrack_ftp is used by [ipt_helper] ?

Or at least, when using --helper ftp, it should autoload the ip_conntrack_ftp, since it doesn't seem to work without it.
The way it is now makes it possible to just rmmod ip_conntrack_ftp while you are using it, and without any warning, and when you insmod it, you have the remove the --helper ftp rule and put it again back in your firewall again to make it work.

Maybe this is just a 2.4.24 thing, does anyone here have a 2.6 kernel running? Wonder if it's still the same on 2.6

Cheers,
Jeroen.









