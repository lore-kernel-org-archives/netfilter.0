From: "Sebastian" <netfilter@basti79.de>
Subject: Allow Proxy connection
Date: Wed, 18 Jun 2003 15:21:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c3359c$925ca020$0200a8c0@basti79>
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi list...

I've got a gateway with iptables and squid proxy. All forwarding is
DROPed, so internal clients can only use the proxy for internet
connection. I've got the following rule in INPUT/OUTPUT chains to allow
the porxy to fetch the web sites:

iptables -A OUTPUT -o eth0 -p tcp --dport 80 -m state --state
NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -i eth0 -p tcp --sport 80 -m state --state
ESTABLISHED     -j ACCEPT

But this works only if the webserver in the internet is running on port
80. So i tried to use the -m owner --uid-owner option to match all
packets from the proxy user. The i had to accept all ESTABLISHED packets
in the INPUT chain, because the owner match works only in OUTPUT chain.

What i did now is the following:

iptables -A OUTPUT -o eth0 -p tcp -m owner --uid-owner proxy -m state
--state NEW -j CONNARK --set-mark 1
iptables -A OUTPUT -o eth0 -m connmark --mark 1 -j ACCEPT
iptables -A INPUT  -i eth0 -m connmark --mark 1 -j ACCEPT

This seems to work, but what i wann know now:
 - Is this solution secure?
 - Anybody got a better solution?

Regards
Sebastian.


