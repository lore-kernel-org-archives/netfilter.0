From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: why can't I telnet
Date: Mon, 16 Sep 2002 16:11:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209161511.g8GFBBv15493@vulcan.rissington.net>
References: <6029A399F5BFD6118BB200104B0DF37302764B@MAILGATE>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6029A399F5BFD6118BB200104B0DF37302764B@MAILGATE>
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

On Monday 16 September 2002 2:45 pm, Naleendra@dms.lanka.net wrote:

> HI LIST,
>
> 	I can't telnet when my Iptables rule set is active. However the
> moment I stop thee service I am able to do so. Mine is a default drop
> policy. However I can ping with no problems. Telnet pertaining portion
> lines are,
>
> 	iptables -A INPUT -i <adaptor> -d <ip-address> -p tcp --dport 23 -j
> ACCEPT
> 	iptables -A OUTPUT -o <adaptor> -s <ip-address> -p tcp --sport 23 -j
> ACCEPT

You are adding an INPUT rule with a destination port = 23, and an output rule 
with a source port = 23, which is correct if this is the machine you are 
trying to telnet *to*, from whatever machine you are specifying by 
<ip-address>.

If that is correct - you are trying to telnet *to* this machine, not from it, 
and you are trying to telnet to *this* machine, and not another one which is 
routed through this one, then I can't see the reason why it's not working; I 
suggest you add a LOGging rule after each of these rules to show you what 
packets are trying to get in or out of the machine and being blocked.

If my assumption about your network setup is not correct, then tell us 
precisely what you are trying to do, and show us the rest of yur ruleset, and 
we'll suggest what you might be able to do about it.

Regards,

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

