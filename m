From: Jason Opperisano <opie@817west.com>
Subject: Re: Trouble with router and iptables
Date: Fri, 14 Jan 2005 11:36:47 -0500
Message-ID: <20050114163647.GA26324@bender.817west.com>
References: <KJEGIFLIAAKLNBMJNOIJMEHGECAA.bfrench@imageworksstudio.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <KJEGIFLIAAKLNBMJNOIJMEHGECAA.bfrench@imageworksstudio.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Jan 14, 2005 at 11:05:54AM -0500, Brian French wrote:
> # External interface
> EXT=Serial0
> EXTIP=200.200.200.10
> # Internal interface
> INT=Ethernet0
> INTIP=192.168.0.1

i must be waaaaaaaay out of the loop...what linux distro/kernel are you
running that uses device names "Serial0" and "Ethernet0"

> ############################################################################
> ###
> # Flushing all rules.
> #
> # Do not uncomment these lines unless you have NAT rules that require them.
> #
> ############################################################################
> ###
> #modprobe ip_nat_ftp
> #modprobe ip_nat_irc
> 
> # flush all previous rulesets
> iptables -F
> ############################################################################
> ###
> # Do not uncomment this line unless you have NAT rules below.
> #
> ############################################################################
> ###
> iptables -F -t nat
> 
> # Set default policies
> iptables -P OUTPUT ACCEPT # BMF
> iptables -P INPUT DROP    # BMF
> iptables -P FORWARD DROP  # BMF
> 
> # Prevent external packets from using loopback addr
> iptables -A INPUT -i $EXT -s $LOOP -j DROP    # BMF
> iptables -A FORWARD -i $EXT -s $LOOP -j DROP  # BMF
> iptables -A INPUT -i $EXT -d $LOOP -j DROP    # BMF
> iptables -A FORWARD -i $EXT -d $LOOP -j DROP  # BMF

stylistic--the linux routing code does this for you.  since you're not
logging these packets--the drops are unnecessary.

> # Anything coming from the Internet should have a real Internet address
> iptables -A FORWARD -i $EXT -s 192.168.0.0/16 -j DROP # BMF
> iptables -A FORWARD -i $EXT -s 172.16.0.0/12 -j DROP  # BMF
> iptables -A FORWARD -i $EXT -s 10.0.0.0/8 -j DROP     # BMF
> iptables -A INPUT -i $EXT -s 192.168.0.0/16 -j DROP   # BMF
> iptables -A INPUT -i $EXT -s 172.16.0.0/12 -j DROP    # BMF
> iptables -A INPUT -i $EXT -s 10.0.0.0/8 -j DROP       # BMF
> 
> # Allow local loopback
> iptables -A INPUT -s $LOOP -j ACCEPT  # BMF
> iptables -A INPUT -d $LOOP -j ACCEPT  # BMF

personally--i would change these to:

  iptables -A INPUT -i lo -j ACCEPT

> iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE

if you have a static IP--use "-j SNAT --to-source $EXTIP" instead of
MASQUERADE.

<-- snip icmp stuff -->

> #---- Block common worm traffic coming in via External interfaces
> #---- where "XXXX" is your Internet gateway interface
> iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 135:139
> iptables -A FORWARD -j DROP -i $EXT -p udp --dport 135:139
> iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 444
> iptables -A FORWARD -j DROP -i $EXT -p udp --dport 444

you sure you don't mean "--dport 445" there?

> ## Since i was unable to get openvpn to work here

openvpn is good stuff--sorry to hear it didn't work out for you.

<-- snip RDP port-forwarding stuff -->

> ## Allow Brian to SSH to the fileserver
> iptables -t nat -A PREROUTING -p tcp -i $EXT \
>         --dport 222 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
> 192.168.0.2:22
> iptables -A FORWARD -p tcp -i $EXT \
>         -o $INT -d 192.168.0.2 --dport 222 -s 200.200.200.90 --sport
> 1024:65535 -m state --state NEW -j ACCEPT

the reason this doesn't work is because the dport in the FORWARD rule
needs to be 22, not 222.

> iptables -A FORWARD -t filter -i $INT -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -t filter -i $EXT -m state  --state
> ESTABLISHED,RELATED -j ACCEPT

ok...

> # Allow services such as www and ssh (can be disabled)
> iptables -A INPUT -p tcp --dport ssh -j ACCEPT
> 
> # Block outgoing NetBios (if you have windows machines running
> # on the private subnet).  This will not affect any NetBios
> # traffic that flows over the VPN tunnel, but it will stop
> # local windows machines from broadcasting themselves to
> # the internet.
> iptables -A FORWARD -p tcp --sport 137:139 -o $EXT -j DROP
> iptables -A FORWARD -p udp --sport 137:139 -o $EXT -j DROP

you do realize it too late for these rules, right?  you already accepted
all NEW packets in FORWARD arriving on $INT--so a machine on the inside
can send all the tcp/udp 137:139 it wants.

> iptables -A OUTPUT -p tcp --sport 137:139 -o $EXT -j DROP
> iptables -A OUTPUT -p udp --sport 137:139 -o $EXT -j DROP

<-- snip openvpn stuff -->

> # Allow packets from private subnets
> iptables -A INPUT -i $INT -j ACCEPT
> iptables -A FORWARD -i $INT -j ACCEPT

again--this FORWARD rule seems redundant, as you've already done this
above.

> # Keep state of connections from local machine and private subnets
> iptables -A OUTPUT -m state --state NEW -o $EXT -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state NEW -o $EXT -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

stylistic--i normally put all my "-m state --state ESTABLISHED,RELATED"
rules as the first rule in each chain, as those are the ones that match
the bulk of your traffic.

as for the random, per-computer drops--i dunno.

-j

--
"Mmmm...free goo."
        --The Simpsons

