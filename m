From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging Aliased Interfaces.
Date: Mon, 21 Oct 2002 13:18:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210211218.g9LCIIL31654@vulcan.rissington.net>
References: <000901c278f6$cc9574f0$05290a0a@vaio>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c278f6$cc9574f0$05290a0a@vaio>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 21 October 2002 12:41 pm, Andy Wood wrote:

> (Antony....trying to compact two emails into one)
>
> Correct....my DNAT'd ports work fine, even the alias.  I cannot run an
> aliased IP through the INPUT or user created chains.  i.e:
>
> These work fine
> iptables -A PREROUTING -p tcp --dport 80 -d 80.80.80.155 -i eth0 -j DNAT
> --to 10.1.2.10
> iptables -A PREROUTING -p tcp --dport 80 -d 80.80.80.157 -i eth0 -j DNAT
> --to 10.1.2.12
>
> iptables -A FORWARD -p tcp --dport 80 -d 10.1.2.10 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 80 -d 10.1.2.12 -j ACCEPT
> ---------------------------------------------------------------------
>
> 155 works / 157 (ALIASED IP) does not
> iptables -A INPUT -p tcp --dport 22 -d 80.80.80.155 -j ACCEPT
> iptables -A INPUT -p tcp --dport 22 -d 80.80.80.157 -j ACCEPT

What happens if you try this without the above PREROUTING DNAT rules ?

> I'm only DNAT'ing 80 through PREROUTING, the rest SHOULD pass though the
> INPUT chain where 22 is accepted

I agree.   Since your DNAT rules specify TCP port 80, other packets should 
not be getting DNATted.

> 	If I only work with the below two rules, here would be the
> results
>
> iptables -A PREROUTING -p tcp --dport 79 -d 80.80.80.157 -j LOG
> will log
> iptables -A INPUT -p tcp --dport 79 -d 80.80.80.157 -j LOG
> will not log
>
> (Both of the above rules are not running @ the same time...I test the
> prerouting rule, delete the rule (iptables -D PREROU......., then create
> the INPUT rule).

Doesn't matter if you do try to use both at the same time - you would just 
get two log entries.

What happens if you also add a FORWARD rule with a LOG target, just to see 
whether netfilter thinks the packet should be forwarded somewhere else ?

Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

