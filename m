From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: again problem with alias / virtual interface
Date: Tue, 20 Jul 2004 14:12:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FD6E81.10904@pbl.ca>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108> <40FC2286.3070005@pbl.ca> <007d01c46dae$0a45f330$eb53623e@x>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007d01c46dae$0a45f330$eb53623e@x>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Marco Strullato wrote:
> I've tried with just eth1 but the rule is not applied, or it seems not to be
> applied
> 
> I've seen that using virtual interfaes is deprecated so I tryed to set
> multilple ip with iproute.
> If I set network interfaces only with iproute and not with ifconfig, network
> configuration seems to be absent.
> If I set network with ifconfig and not with iproute, network configuration
> seems ok
> So I can't to use iproute (to set interfaces) and iptables becacuse network
> configuration is absent.

Everything should work just fine using virtual interfaces (configured
the standard way using good old ifconfing).  I just did quick test on my
Fedora box, and virtual interfaces worked just fine with iptables rules.

Looking at your firewall rules, there are two things:

First the cosmetic one (that doesn't brake anything, but does not have
much sense):

   -A INPUT -m state -i eth0 --state NEW -j ACCEPT
   -A INPUT -s 192.168.1.0 -i eth0 -j ACCEPT

You obviously have intention to accept all incoming connection on eth0
with first rule (which doesn't do what you wanted it to do, read bellow
why).  What is the purpuse of the second rule?

Second thing, you are using "-m state --state NEW" in (almost) all of
your firewall rules.  But you don't have any rules for packets in
"ESTABLISHED" (and/or "RELATED") state.  With this config, you are
letting only the first packet to go through firewall, and you are
blocking all subsequet packets (going in or out).  If you use tcpdump to
analyze network traffic, you could see initial packet with SYN flag
going into the interface, but no response (with ACK flag) going out
(because your firewall rules blocked it).

Now you need to do either of the following (but not both):

You either need to add generic set of rules like this (for performance,
add this as close to the top of your rules as possible):

   -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
   -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
   -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Or (if you are more paranoid) to add rules for ESTABLISHED and RELATED
packets for each port you want to have open.  For example, you would
change this line that doesn't do what you intended to do:

    -A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.90 \
       --dport 22 --state NEW -j ACCEPT

to this set of lines that should do what you intended to do (first line
allows first and subseqent packets to go in, second allows outgoing
packets to go out, and last two are to allow exchange of eventual ICMP
packets related to this connection, if any):

    -A INPUT -i eth1 -p tcp -d 82.186.92.90 --dport 22 \
       -m state --state NEW,ESTABLISHED
    -A OUTPUT -o eth1 -p tcp -s 82.186.92.90 --sport 22 \
       -m state --state ESTABLISHED
    -A INPUT -i eth1 -p icmp -d 82.186.92.90 -m state --state RELATED
    -A OUTPUT -o eth1 -p icmp -s 82.186.92.90 -m state --state RELATED

I've tossed the order of options around, to make things more readable to
the human (and removed not needed options).

You can even complicate this a bit more by allowing only certain types
of ICMP messages, if you feel paranoid enough (and skilled enough not to
block ICMPs that you shouldn't block).

Also, check that your network is configured properly (check netmasks and
broadcast addresses of network interfecase, check that all interfaces
are up (there must be "UP" keyword in the ifconfig output), routing
tables, and so on).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


