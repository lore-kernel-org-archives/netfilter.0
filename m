From: "big one" <bigone@qon.lao.net>
Subject: TCPFlags Option Error
Date: Sun, 16 Apr 2006 10:09:25 -0700
Message-ID: <20060416100925.9B4B33F0@resin04.mta.everyone.net>
Reply-To: bigone@qon.lao.net
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I had installed new kernel 2.6.16.5 on Debian knoppix 3.4 with all IP Tables kernel options enabled.

The setup is one interface: one PC with one external ethernet modem.

I use: Shorewall 3.0.6, IPTables: 1.3.5 

Everything is ok, except TCPFlags option at /etc/shorewall/interfaces:

#ZONE INTERFACE BROADCAST OPTIONS
#net  eth0      detect    norfc1918,routefilter,dhcp,blacklist
net   eth0      detect    norfc1918,routefilter,dhcp,blacklist,tcpflags

If I delete tcpflags, the shorewall started succesfully.

If I use tcpflags options:

(from trace / debug output):

+ run_iptables -A logflags -j REJECT --reject-with tcp-reset
+ '[' -n '' ']'
+ '[' -n Yes ']'
+ '[' -f /tmp/shorewall.SaCWSI/iprange ']'
+ /sbin/iptables -A logflags -j REJECT --reject-with tcp-reset
iptables: Unknown error 4294967295
+ '[' -z '' ']'
+ error_message 'ERROR: Command "/sbin/iptables -A' logflags -j REJECT --reject-with 'tcp-reset" Failed'
+ echo ' ERROR: Command "/sbin/iptables -A' logflags -j REJECT --reject-with 'tcp-reset" Failed'
ERROR: Command "/sbin/iptables -A logflags -j REJECT --reject-with tcp-reset" Failed
+ stop_firewall
+ '[' -n /var/lib/shorewall/shorewall.JIpwiX ']'
+ rm -f /var/lib/shorewall/shorewall.JIpwiX
+ set +x

How to solve this problem?
Thank you

_____________________________________________________________
= You want FREE web-based email ? 
= You want your own @qon.lao.net address??
= Then you want LaoNet's WebMail !
= Get it at http://webmail.lao.net !!

