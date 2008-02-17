From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Default Policy DROP for INPUT, OUTPUT and FORWARD
Date: Sun, 17 Feb 2008 10:27:50 +0100
Message-ID: <000001c87147$5dff5390$19fdfab0$@info>
References: <24410.61709.qm@web55403.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <24410.61709.qm@web55403.mail.re4.yahoo.com>
Content-language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> i want build firewal for router in one machine as a
> squid proxy server,  caching dns server and bandwith
> limiter with HTB.
> 
> i use default policy DROP for forward, input, and
> output
> 
> -------- code ----------------
> # Clean old firewall
> $IPT -F
> $IPT -X
> $IPT -t nat -F
> $IPT -t nat -X
> $IPT -t mangle -F
> $IPT -t mangle -X
> 
> $MPROBE ip_conntrack
> $MPROBE ip_conntrack_ftp
> $MPROBE ip_nat_ftp
> $MPROBE ip_nat_irc
> 
> # Setting default filter policy
> $IPT -P INPUT DROP
> $IPT -P OUTPUT DROP
> $IPT -P FORWARD DROP
> 
> # Unlimited access to loop back
> $IPT -A INPUT -i lo -j ACCEPT
> $IPT -A OUTPUT -o lo -j ACCEPT
> 
> # Allow UDP, DNS and Passive FTP
> $IPT -A INPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> $IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> ------------ end of code
> --------------------------------------
> 
> and my problem is, what filter i must write so my
> client can connect into my router.
> first i only define PREROUTING, FORWARD and
> POSTROUTING, but my client can't ping into router.

No of course they can't: you don't allow it by setting the policy of
these chains to DROP and not having a rule to allow icmp (in whatever
chain you need it).
Besides, please define what "can't ping into router" in your case
actually means.

Further: do not filter in the NAT table unless you know what you're
doing, so, do not set the policy of these to DROP.

> so, if i want default policy DROP for forward, input, output,

Do this if it's in the filter table, but

> prerouting and postrouting,

don't do this unless you know what you're doing and you can troubleshoot
it yourself.

> what i want to do? must i define all of this for allow my client?

You didn't tell us what you want your client to be able of doing.
You are probably providing internet access for your client.
- Will you provide access via NAT only, proxy only or both?
- Does the client have to be able to resolve hostnames?
- Any other services you want to provide?

If you want to allow proxy traffic then allow incoming port 3128/tcp
(squid default).
If you want to allow NAT traffic then allow outgoing forwarded traffic,
perhaps only for specific ports but that'll be your choice.
If you want your client to be able to resolve hostnames using your DNS
server, allow incoming traffic on port 53 both tcp and udp. (While tcp
is not used often, it might be.)

As Karim says, your RELATED,ESTABLISHED rules won't work here as there
are no accompanying NEW rules: you don't allow anything so there won't
be any connections in RELATED or ESTABLISHED state.
However, it's better to put the rules allow connections in NEW state
*after* the RELATED,ESTABLISHED rule (in each chain), not before. Most
packets will belong to a connection in either ESTABLISHED or RELATED
state, while only one packet in a connection will be in NEW state.
Because the rule-check will stop after the first match, you want packets
in ESTABLISHED or RELATED state to be accepted as soon as possible.

Maybe you should first read into what it is you want to provide so you
know what you need and have a look at Oskars iptables tutorial:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Grts,
Rob


