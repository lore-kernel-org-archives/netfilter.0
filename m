From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: A practical problem regarding  IP Accounting ...?
Date: Tue, 9 Mar 2004 09:04:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403090904.01979.Antony@Soft-Solutions.co.uk>
References: <7C9884991ADAE0479C14F10C858BCDF5122F0B@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F0B@alderaan.smgtec.com>
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

On Tuesday 09 March 2004 1:02 am, Daniel Chemko wrote:

> # Outbound to PC
> iptables -t mangle -A PREROUTING -i eth1 --source <ip_address>
> # Inbound to PC
> iptables -t mangle -A POSTROUTING -o eth1 --destination <ip_address>
>
> Then use your own accounting tool to rip the byte count from "iptables -t
> mangle -nvxL". Remember though, the byte count can reset or overflow to 0,
> so make sure your accounting package can handle this.

I think this is an excellent answer, but there are some subtleties about it 
which Daniel did not empphasise, and I think they're worth explaining so 
people understand a little more about netfilter:

1. The rules have no targets!   ie: there is no "-j ACCEPT" etc at the end.   
This is perfectly correct and acceptable (in any chain, not just mangle), and 
means the netfilter will count the packets which match, but not do anything 
special with them.   Such a rule is useful only for counting packets & bytes, 
but it means you can count them without immediately deciding what happens to 
them - you can sgtill follow the accounting rules with your normal filtering 
/ natting / mangling rules.

2. The rules are in the mangle tables because this is the closest that 
netfilter can get to the interfaces themselves, and it makes sure that the 
rules really do count all the packets going in and out of the machine, 
without some quietly slipping past behind the scenes as they could do if you 
counted packets in the nat table (the rules would not see reply packets being 
automatically de-natted), or the filter table (where it would be difficult to 
combine sensible accounting with the stanadard stateful ESTABLISHED, RELATED 
rule).

I hope this helps a few people understand a bit more about why this is a very 
good solution to packet accounting, as well as perhaps a bit more about the 
way packets go through mangle, nat and filter.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


