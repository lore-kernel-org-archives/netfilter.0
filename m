From: gypsy <gypsy@iswest.com>
Subject: Asking again: string match fails to find anything
Date: Tue, 20 Jul 2004 06:56:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FD24A4.CD697B16@iswest.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Facts:
iptables 1.2.9 built against kernel v 2.4.25 or .26 depending on which
computer.
kernel 2.4.26
os fingerprinting only works on the internal interface,  not eth1.
"tcpdump -n -i eth1 -w /tmp/dump" clearly shows the text I am attempting
to match.
I have a test bed with very little traffic so that using a string match
will not bog down.
Repeats on 3 different computers all running Slackware 9.1.
Several other POM / POM-NG modules are installed.
When I "make modules", the only issue with ipt_string is:
in function `search_sublinear':
:55: warning: subscript has type `char'
:80: warning: subscript has type `char'
(referring to needle and haystack)

Problem:
No matter what text is in $STRING, iptables fails to see the match.

iptables -I INPUT -m string --string $STRING -j LOG

"iptables -nvL | grep STRING" has zeros in the counters.

Example:
Replace $STRING with "oreilly".  From a remote computer run "lynx
http://myurl/oreilly" and variants until at least 30 pages have been
displayed to be certain that at least one packet is not so fragmented
that "oreilly" isn't there (see also Facts above).  On the "myurl"
computer iptables counters are zero.

QUESTION:
How can I find out why the string match fails to find the intended
text?  (Later on I may ask how to fix that...)

gypsy

