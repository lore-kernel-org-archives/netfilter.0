From: Daniel Draper <boxen@usermail.com>
Subject: Complex problem
Date: 01 Apr 2003 00:35:35 +0930
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049123134.1781.1.camel@laptop>
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
To: netfilter@lists.samba.org

Hello everyone,

I am working on a complex problem and I'm not quite sure how to solve
it. I have a squid proxy and iptables set up on my server and I want to
account packets going to and from the server inside the LAN.

The accounting rules were easy but I needed to modify squid to set the
tos header depending on whether the requested page was a hit or a miss
(I have now almost done this: squid-gpm.sourceforge.net). Thus on the
OUPUT chain I accounted packets matching the ToS indicating a miss (that
is; it used the external interface) eg;

    iptables -A OUTPUT -p tcp --sport 3128 -d 192.168.0.0/24 -m tos
--tos 0x4

However, and here is the tricky bit, I want to account incoming data
from the clients too (ie; a page request) but only if squid is GOING to
assert the tos header to indicate a miss. How can I store the byte count
temporarily and then append it to the byte counter on the input chain if
and only if the right ToS value was detected on the return in the output
chain?

I don't mind hacking netfilter source code if I have to but can anyone
think of a way to do it without source code modification? If not, how
would I go about modifying the source.

Thanks for any suggestions.

Regards,

Daniel Draper,

Boxen Systems, Australia


