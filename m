From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables forwarding problems
Date: Sun, 23 Feb 2003 13:48:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302231348.10894.netfilter@newkirk.us>
References: <664D40A267DF6C4A8D5DAD9D901D51CF028B64DE@feb.bwamc.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <664D40A267DF6C4A8D5DAD9D901D51CF028B64DE@feb.bwamc.com>
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
To: Matt Riggs <matt.riggs@beasleyallen.com>, netfilter@lists.netfilter.org

On Friday 21 February 2003 01:46 pm, Matt Riggs wrote:
> I am confused. I am trying to port forward ftp from a specific host to
> a server on my private network.
>
> I was under the impression that specifying a rule such as $iptables -t
> nat -A PREROUTING -p tcp -s IP -d IP --dport 21 -j DNAT --to IP:21
> would allow this connection.
>
> The Catch ALL rule.
> $iptables -A INPUT -j DROP
> $iptables -A OUTPUT -j DROP
> $iptables -A FORWARD -j DROP
>
> I realize it says to DROP FORWARDs but I was under the assumption that
> since i declared a specific rule, it would DROP everything else( i.e.
> allow that one forward rule)
>
> Am I completely wrong...please explain....

Yes, actually.  PREROUTING is not FORWARD, they are separate chains of=20
rules.  The rule you have will DNAT FTP control port (but not any data!)=20
but you also need a rule in FORWARD to allow it.  You should usually=20
also set the DROP as POLICY instead of a catch-all rule.  Try these:

insmod ip_conntrack_ftp
insmod ip_nat_ftp

$iptables -P INPUT DROP
$iptables -P FORWARD DROP
$iptables -P OUTPUT DROP

$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -A FORWARD -d 3.4.5.6 -p tcp --dport 21 -j ACCEPT

$iptables -t nat -A PREROUTING -p tcp -s 1.2.3.4 -d 2.3.4.5 -p tcp  \
--dport 21 -j DNAT --to 3.4.5.6

The first two (if you're not doing this already) are needed so that=20
connection tracking and NAT of FTP will work properly.  The next three=20
set the DROP as a Policy, rather than as the last rule in the chain. =20
(If you add rules after a blanket DROP rule they will never have a=20
chance, but Policy is always last no matter what)  The two FORWARD rules=20
allow FTP control port and all ESTABLISHED or RELATED connections to be=20
forwarded, and finally the DNAT rule itself.

j

> Thanks in advance
>
> Matt


