From: cc <cc@kdtc.net>
Subject: Re: Adding Telnet to a Working Setup
Date: Fri, 29 Aug 2003 16:33:15 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4F0FCB.3050402@kdtc.net>
References: <023a01c36ca1$54a1f320$0500a8c0@emph05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <023a01c36ca1$54a1f320$0500a8c0@emph05>
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
To: Netfilter Group <netfilter@lists.netfilter.org>

Alyn Ashworth wrote:

> I have a working iptables setup that uses the following script, and that I
> would like to change to allow telnet connexions from the local network
> (eth0) but nor from ppp0. Can anyone suggest the best way to do this

Telnet connections into your firewall from the local net?

But haven't you already done that already with your first INPUT rule and
your  3rd Output rule?

> iptables -A INPUT -p ALL -i eth0 -s 192.168.0.0/16 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT

Or did I completely miss the point?

> # (3) INPUT chain rules
> 
> # Rules for incoming pakets from LAN
> iptables -A INPUT -p ALL -i eth0 -s 192.168.0.0/16 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.0.0/16 -j ACCEPT

I don't understand why or how packets from 'lo' could
come from anything but 127.0.0.1?  Isn't the 3rd rule meaningless?
Or am I seriously mistaken?

> # (5) OUTPUT chain rules
> # only output packets with local addreses (no spoofing)
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.88 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT

Isn't the 2nd made redundant by the 3rd rule?  If given
rule #3, you don't need rule #2.

It's definitely a good way to learn if someone can correct
my mistakes in understanding your scripts.

Thanks









