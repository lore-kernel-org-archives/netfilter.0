From: cc <cc@kdtc.net>
Subject: PCAnywhere and netfilter
Date: Fri, 27 Jun 2003 17:22:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFC0CBC.4000207@kdtc.net>
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

I am having some troubles figuring out how to get a remote
PCAnywhere station log onto a local pcanywhere station.

Here's my config:

Firewall  :  (eth0 : external IP) - a.b.c.d
             (eth1 : internal IP - 192.168.5.17)
Int IP (one with PCAnywhere) : 192.168.5.31

Here's my attempt at a netfilter script for this:

iptables -A INPUT -i eth0 -d 192.168.5.31 -p tcp --dport "5631:5632" -j
ACCEPT
iptables -A INPUT -i eth0 -d 192.168.5.31 -p udp --dport "5631:5632" -j
ACCEPT

iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p tcp --dport
"5631:5632" -j DNAT --to 192.168.5.31
iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p udp --dport
"5631:5632" -j DNAT --to 192.168.5.31


I actually got this off the net and am still trying to disect it.
Am I supposed to have Output, or just forward chains since in essence
I'm just forwarding the PCA packets to a different station?

I'm still barely understanding Netfilters.  For the other services
(smtp, www, etc...) they are working.  I don't understand why I'm
having so much trouble with PCAnywhere.

Thanks

Edmund



