From: Evan Harris <eharris@puremagic.com>
Subject: Problem/Question with DNAT on OUTPUT chain (-t nat -A OUTPUT)
Date: Thu, 9 Oct 2003 16:26:50 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310091616530.1382-100000@kinison.puremagic.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I'm trying to setup a linux kernel box that runs a proxy to DNAT certain
types of traffic to a different IP address that is on a different interface.

I have no problem creating PREROUTING nat table entries, but when I change
it to OUTPUT (to mangle locally generated packets), iptables gives me
"iptables: Invalid argument".

Here are example simplified commands, the first works, the second fails.

# iptables -v -t nat -A PREROUTING -p tcp  -d tunnelserver -j DNAT --to-destination 172.31.255.1
DNAT  tcp opt -- in * out *  0.0.0.0/0  -> 10.100.100.101  to:172.31.255.1

# iptables -v -t nat -A OUTPUT -p tcp  -d tunnelserver -j DNAT --to-destination 172.31.255.1
DNAT  tcp opt -- in * out *  0.0.0.0/0  -> 10.100.100.101  to:172.31.255.1
iptables: Invalid argument

What am I doing wrong?  What is the proper way to DNAT locally generated
packets?

I am using linux kernel 2.4.20, with iptables 1.2.8.  Both of these are
recent enough that I wouldn't expect a bug, so it's probably my usage.  But
from the manpage it looks like my syntax is correct.

Please CC me, as I am not on the mailing list.

Evan


