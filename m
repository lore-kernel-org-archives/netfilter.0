From: "it clown" <suse@mailbox.co.za>
Subject: irc+iptables
Date: Sat, 02 Oct 2004 11:03:08 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-460534879@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi All,

i am having some trouble in getting irc working through
iptables and squid.When i put a forwarder in my iptables
rule i can connect to irc but when i want to go through the
proxy i have no luck.I have loaded the ip_nat_irc and
tried:

-t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT
--to-ports 3128.

I have made the changes in squid to allown port 6667.
Port 6667 is allowed OUT.

Regards
_____________________________________________________________________
For super low premiums ,click here http://www.dialdirect.co.za/quote

