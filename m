From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: 3 iptables accounting questions
Date: Tue, 6 Jul 2004 09:45:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407060945.51110.Antony@Soft-Solutions.co.uk>
References: <200407061017.43252.etienne@unix.za.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407061017.43252.etienne@unix.za.org>
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

On Tuesday 06 July 2004 9:17 am, Etienne Ledoux wrote:

> Greetings,
>
> 1) I have a firewall and would like to count all the traffic
> entering/leaving the external interface (I want to count only internet
> traffic, which is the traffic entering/leaving the external if). Is this
> rule right ?
>
> iptables -N ACCT
> iptables -I FORWARD -j ACCT
> iptables -I INPUT -j ACCT
> iptables -I OUTPUT -j ACCT
> iptables -A ACCT -s 10.168.0.2/32 -d 0.0.0.0/0 -o eth0
> iptables -A ACCT -s 0.0.0.0/0 -d 10.168.0.2/32 -i eth0
>
> 10.168.0.2 is my external interface ip and is also the ip which my internal
> network is natted behind.

You want to count traffic addressed *to this machine* from the Internet, and 
traffic addressed *from this machine* to the Internet, yes?   In that case 
these rules will work, but there is no point in jumping to the ACCT chain 
from the FORWARD chain.

Remember that FORWARD is *only* for traffic going through the machine, and 
INPUT and OUTPUT are *only* for traffic to/from the machine (ie: *never* for 
traffic going through it).

If you want to count traffic addressed *to any machine on your internal 
network* from the Internet, and traffic addressed *from any machine on your 
network* to the Internet, then you should use your subnet address in the -s 
and -d options, not the address of your firewall.

At a guess this subnet is going to be 10.168.0.0/24, but I don't know what 
netmask you're using.

> 2) I would like to save/restore only this accounting rule. I thought
> 'iptables-save -c -t ACCT' would work but it doesn't.

No, ACCT is not a table (like filter, nat and mangle are) - it is a chain 
(like FORWARD, INPUT and OUTPUT are).   Don't use -t

> 3) How do I flush the accounting stats.

iptables -Z ACCT, or iptables -L -Z ACCT -nvx if you want to see the counters 
immediately before zeroing them.

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


