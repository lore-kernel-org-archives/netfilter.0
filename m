From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Asking again: string match fails to find anything
Date: Tue, 20 Jul 2004 14:37:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90511CF@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: gypsy <gypsy@iswest.com>, netfilter <netfilter@lists.netfilter.org>

is it possible that a rule above your "-m string --string $STRING" is =
matching the data packets of the connection; i.e, a "-m state --state =
ESTABLISHED -j ACCEPT" rule?

-j

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of gypsy
Sent: Tuesday, July 20, 2004 9:57 AM
To: netfilter
Subject: Asking again: string match fails to find anything


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


