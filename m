From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: disabling conntrack ...
Date: Fri, 26 Aug 2005 23:25:00 -0500
Message-ID: <200508262325.00761.rob0@gmx.co.uk>
References: <B81183566FF73947875C3A207CD60AA61DFB58@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B81183566FF73947875C3A207CD60AA61DFB58@LONEX01.tideway.com>
Content-Disposition: inline
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

On Friday 2005-August-26 09:42, Kerryn Wood wrote:
> *bows head in shame*
>
> I'm relatively new to iptables (landing the role of administrator

Be not ashamed, none of us are born knowing the ways of Unix / Linux. 
You can learn. You're doing fine.

Some general advice: trust in your OS distributor. All of the major 
Linux distributors know what they are doing, to some extent, and their 
OS generally works well when set up and managed per instructions.

> The scenario is this:
> I'm running a machine that's generating a HUGE amount of traffic.

What kind of traffic, mostly?

> I was seeing many of the "ip_conntrack: table full, dropping packet"

I posted a solution to this just Wednesday, and someone else posted a 
nice link to some of the sysctl documentation today.

Your solution may simply be to echo a larger number to the file 
"/proc/sys/net/ipv4/ip_conntrack_max". This is explained at:

http://www.wallfire.org/misc/netfilter_conntrack_perf.txt

Is this a low-memory machine?

> errors and this I suspected was causing major problems with the
> software I was running on the machine. (It looks like it may be
> because the machine at the time was working on a network in the US so
> timeouts (etc ...) were taking longer.) I've increased the hashsize
> substantially because as far as I understand the default hashsize is
> configured (max) for 2GB of RAM where the machine is running with
> 12GB. The error messages just took longer to appear.

Ah, no, not low memory. :) So something might be wrong in the software 
which is generating all the traffic, or in the iptables rules.

> As the dropping packets are currently the top of the "what's causing
> our problems" list I was (mistakenly apparently :D) investigating
> disabling connection tracking (we're not NAT'd), but based on your
> response I'm guessing it was the wrong way to go about it!

Yes. Deleting your modules will prevent them from loading, but as you 
saw, it prevents you from using rules which need them.

> I think the rules file that iptables-restore was trying to read is
> /etc/sysconfig/iptables which I've included at the end of the mail.
> Line 57 (I've removed all the superfluous documentation lines) is the
> COMMIT.

Right. I could have told you /etc/sysconfig/iptables, but it's crucial 
for you to be able to find these things on your own. See? No shame. 
You'll learn what you need to learn, and most importantly, where to 
find what you need.

Thanks for trimming the excess from that. Please also consider trimming 
superfluous quoted material in your messages, and not top-posting.

> *filter
>
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]

If this machine is not acting as a router, which it appears not, you 
should set a DROP policy.

> :OUTPUT ACCEPT [0:0]
> :MYRULE-INPUT - [0:0]
>
> -A INPUT -j MYRULE-INPUT

I like using user chains, but I give mine names which are a bit more 
descriptive. The -INPUT part is good, but "MYRULE" doesn't tell me 
anything. Also, since you're only using this one target, you have not 
made the structure cleaner.

> -A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,PSH FIN,SYN,PSH -j LOG
> -A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,PSH FIN,SYN,PSH -j REJECT
> --reject-with icmp-port-unreachable

OUTPUT filtering is not generally useful. These rules won't cause much 
heartache, but then, why are you doing it? What does it do for you? If 
you're originating traffic you don't want, change the process that's 
generating the traffic.

> -A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 199 -j
> ACCEPT 
> -A MYRULE-INPUT -m state --state NEW -m udp -p udp --dport 161 
> -j ACCEPT
> -A MYRULE-INPUT -p udp -m udp --sport 123 --dport 123 -m 
> state --state RELATED,ESTABLISHED -j ACCEPT
> -A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
> ACCEPT
> -A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 443 
> -j ACCEPT
> -A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 
> 22 -j ACCEPT

All of those are using connection tracking. And only the NTP rule will 
allow in replies. (Yours come in on the default policy, ACCEPT.)

> -A MYRULE-INPUT -i lo -j ACCEPT 

Usually a good idea.

> -A MYRULE-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
> -A MYRULE-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT
> -A MYRULE-INPUT -p udp -m udp --dport 0:1023 -j REJECT
> -A MYRULE-INPUT -p udp -m udp --dport 2049 -j REJECT
> -A MYRULE-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT
> -A MYRULE-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT

This is what I call an ipchains-style ruleset, which tries to list all 
the traffic you don't want. That's not necessary with connection 
tracking. In fact it's not as secure, either.

The Packet-Filtering-HOWTO (found at netfilter.org) has the definitive 
quick and easy guide to iptables. Basically you use default DROP 
policies in INPUT and FORWARD, -m state --state RELATED,ESTABLISHED -j 
ACCEPT rules at the top of both, and -m state --state NEW -j ACCEPT 
rules for your chosen services. Follow those with default policies of 
DROP, perhaps preceded by a -p tcp -j REJECT if you wish. (OUTPUT 
should be ACCEPT.)

For you that would be two rules:
-A INPUT -p tcp -m multiport --dports 22,80,199,443 -j ACCEPT
-A INPUT -p udp --dport 161 -j ACCEPT
Note there is no explicit rule for NTP. You don't need it, because the 
blanket --state RELATED,ESTABLISHED allows it.

Now, why is your ruleset causing you problems with connection tracking? 
That's a good question. I don't know. But perhaps an iptables-style 
ruleset would work better. If not, post again and we'll try to debug. 
Or maybe someone else will be along with a theory about your conntrack 
troubles.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

