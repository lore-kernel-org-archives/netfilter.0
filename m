From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Very newB questions
Date: Thu, 24 Jun 2004 14:31:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406241431.49138.Antony@Soft-Solutions.co.uk>
References: <40DACA0E.7050808@4Dllc.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DACA0E.7050808@4Dllc.com>
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

On Thursday 24 June 2004 1:33 pm, Steve Comfort wrote:

> Hi gents,
>
> About all I've done so far is cross-compile iptables for an XScale ARM
> based system.

That sounds like a pretty advanced place to start...?

> iptables v1.2.: can't initialize iptables table `ACC': Table does not
> exist (do you need to run insmod. Perhaps iptables or your kernel needs
> to be upgraded.
> iptables v1.2.: can't initialize iptables table `ACC': Table does not exist
> iptables v1.2.: can't initialize iptables table `ACC': Table does not
> exist .
> iptables v1.2.: Can't use -N with -A
>
> Question 1:  What is table ACC? Perhaps ACCEPT truncated (for some
> unknown reason) ?

The correct table names are "filter", "nat" and "mangle" (newer systems also 
have a "raw" table).

The chain names into which you place rules are "INPUT", "OUTPUT", "FORWARD", 
"PREROUTING" and "POSTROUTING".

Not all combinations of tables and chains are valid - basically every chain 
has a mangle table, INPUT, OUTPUT and FORWARD have a filter table, and 
PREROUTING and POSTROUTING have a nat table.

ACCEPT is the name of a "target" (other examples are DROP, LOG, REJECT).

> Question 2: If I want to start off by writing my own extremely simple
> tables, where should these be stored, or is there a way to tell iptables
> where to look for them?

I suggest a few simple rules, stored in a file in your startup scripts 
directory, so you can play with them and then get them loaded automatically 
on startup once they do what you want.

For a routing firewall, I would suggest the following as a starting ruleset:

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -j ACCEPT

The first rule allows reply packets through the machine (first rule for 
efficiency), the next three allow ssh, dns and http packets through the 
system, and the last one allows everything else as well.   No, it's not at 
all secure, but you can extend the idea, having started from something 
simple, and once you think you have all the services you need listed in the 
ruleset, you can abolish the final -j ACCEPT (everything) rule, and you will 
have a firewall.

> Running iptables -L -v, produces the following :
>
> Chain INPU (policy DROP 0 packets, 0 bytes
>  pkts  byte targ       prot opt                sour                
> destinat

There is clearly something very strange going on with your installation, 
indicated by these truncated names - this should not happen.

I suspect it's something to do with the cross-compilation, about which I can 
offer no advice at all :(

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


