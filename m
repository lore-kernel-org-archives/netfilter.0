From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Lot of MAC Address
Date: Tue, 18 Feb 2003 13:07:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302181307.14726.netfilter@newkirk.us>
References: <1045576151.291.153.camel@bigblue> <05e701c2d764$08de8f20$13fcc5cb@Housecall>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <05e701c2d764$08de8f20$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>, netfilter <netfilter@lists.netfilter.org>

On Tuesday 18 February 2003 10:40 am, hare ram wrote:
> Hi  all
>
> In my LAN, i have lot of MAC address,  ( pc's)
> how do i make a rule for 100 MAC address (PC) to allow
> and any other MAC address to Deny
>
> any suggestions
> thanks
> hare

You have to match each MAC individually, one at a time.  If there is no=20
other acceptable filtering criteria (IP + incoming interface, for=20
example) then your best bet is something like this:

iptables -N MACtest
iptables -A MACtest -m mac --mac-source 00:11:22:33:44:55 -j RETURN
iptables -A MACtest -m mac --mac-source 00:11:22:33:44:66 -j RETURN
[... etc with all 100 MACs in individual rules, followed by ...]
iptables -A MACtest -j DROP

iptables -A FORWARD -m state --state ESTABLISHED,RELATED    \
-j ACCEPT
iptables -A FORWARD -i eth0 -m state --state NEW -j MACtest
iptables -A FORWARD {ordinary rules from here on in FORWARD}

This will take any NEW traffic coming from eth0 to be forwarded and pass=20
ALL of it to the user-defined MACtest chain, which will RETURN=20
acceptable MACs back to FORWARD for continued processing, and DROP any=20
that don't match up with one of the rules. ( This way only the NEW=20
packets have to traverse potentially 101 extra rules before ordinary=20
matching in FORWARD continues.)  You can call the same user-def chain=20
from INPUT as well, or instead.

Keep in mind that a script can build the MACtest chain in a loop, reading=
=20
the MAC addresses from a separate textfile and appending the DROP=20
'policy' after the loop completes.

j


