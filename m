From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: prerouting logging
Date: Wed, 27 Jul 2005 16:59:48 +0200
Message-ID: <42E7A164.6060305@mnemon.de>
References: <42E79B51.1080206@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E79B51.1080206@eccotours.dyndns.org>
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
To: netfilter@lists.netfilter.org

Brent Clark schrieb:
> Hi all
> 
> I got tips for nmap blocking from someone on this list.
> Im trying to log the problems that logged.
> Would anyone care to recheck my rulset, just to make to I got this right.
> 
> # Xmas scan, caught nmap v3.00
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j LOG
> --log-prefix "PREROUTING: " --log-tcp-options --log-ip-options
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
> 
> # Generic Xmas scan, haven't checked if nmap triggers this
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ALL ALL -j LOG --log-prefix
> "PREROUTING: " --log-tcp-options --log-ip-options
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ALL ALL -j DROP

As far as I know and can see - no.

> # Misc scan - everyone tests for this, but what scan does it match?
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j LOG
> --log-prefix "PREROUTING: " --log-tcp-options --log-ip-options
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> 
> # FIN scan, nmap v3.0 sends ACK,FIN FIN
> # SYN,FIN SYN,FIN does not match nmap
> # FIN FIN gets false positives when using SSH TARPIT
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -m state
> --state NEW -j LOG --log-prefix "PREROUTING: " --log-tcp-options
> --log-ip-options
> $IPT -t nat -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN -m state
> --state NEW -j DROP

I think at least the NULL scan (--tcp-flags ALL NONE) is missing and ACK
scan (--tcp-flags ACK|ALL ACK -m state --state NEW).

But the latter situation may also occur, if your TCP crashes (loosing
all connection information) durind data transfer or the like and then
comes back (however this may happen). Dropping the packet leaves the
sender, who thinks there is a connection, waiting until timeout. So, to
see, if this is a scan, it may be more secure to combine it with the
recent match (personally I think, that this will happen very seldom on a
Linux box, but I may be totally wrong).

Have a nice time,

Joerg


