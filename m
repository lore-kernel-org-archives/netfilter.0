From: Jason Opperisano <opie@817west.com>
Subject: Re: Trouble with router and iptables
Date: Fri, 14 Jan 2005 12:15:45 -0500
Message-ID: <20050114171545.GA26531@bender.817west.com>
References: <20050114163647.GA26324@bender.817west.com>
	<KJEGIFLIAAKLNBMJNOIJOEHKECAA.bfrench@imageworksstudio.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <KJEGIFLIAAKLNBMJNOIJOEHKECAA.bfrench@imageworksstudio.com>
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

On Fri, Jan 14, 2005 at 11:57:49AM -0500, Brian French wrote:
> imagestream routers
> www.imagestream.com

neat.

> ok thank you sooo much for your help.
> based on what you have said below, i have rewritten it.
> could you please look it over.
> thank you soo much for your help.
> i'm just a novice forced to do this because i happen to be a developer.

<-- snip -->

> # Set default policies
> iptables -P OUTPUT ACCEPT # BMF
> iptables -P INPUT DROP    # BMF
> iptables -P FORWARD DROP  # BMF
> 
> # Keep state of connections from local machine and private subnets
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

nice.

<-- snip -->

> ## Allow connection from Brians home to his work computer
> iptables -t nat -A PREROUTING -p tcp -i $EXT \
>         --dport 3389 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
> 192.168.0.250:3389
> iptables -A FORWARD -p tcp -i $EXT \
>         -o $INT -d 192.168.0.250 --dport 3389 -s 200.200.200.90 --sport
> 1024:65535 -m state --state NEW -j ACCEPT
> 
> ## Allow rheanna to connect to her computer
> iptables -t nat -A PREROUTING -p tcp -i $EXT \
>         --dport 3389 -s 200.200.200.53 --sport 1024:65535 -j DNAT --to
> 192.168.0.210:3389
> iptables -A FORWARD -p tcp -i $EXT \
>         -o $INT -d 192.168.0.210 --dport 3389 -s 200.200.200.53 --sport
> 1024:65535 -m state --state NEW -j ACCEPT
> 
> ## Allow Brian to SSH to the fileserver
> iptables -t nat -A PREROUTING -p tcp -i $EXT \
>         --dport 22 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
> 192.168.0.2:22
> iptables -A FORWARD -p tcp -i $EXT \
>         -o $INT -d 192.168.0.2 --dport 222 -s 200.200.200.90 --sport
> 1024:65535 -m state --state NEW -j ACCEPT

whoops--we got turned around there.  are you trying to ssh from the
Internet to the ip of the firewall on tcp port 222 and have that
forwarded to tcp port 22 on 192.168.0.2?  if so:

  iptables -t nat -A PREROUTING -p tcp -i $EXT --dport 222 \
    -s 200.200.200.90 --sport 1024:65535 -j DNAT --to 192.168.0.2:22

  iptables -A FORWARD -p tcp -i $EXT -o $INT -d 192.168.0.2 --dport 22 \
    -s 200.200.200.90 --sport 1024:65535 -m state --state NEW -j ACCEPT

sorry--i don't think i was very clear in my last response.

> # iptables -A FORWARD -t filter -i $INT -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> # iptables -A FORWARD -t filter -i $EXT -m state  --state
> ESTABLISHED,RELATED -j ACCEPT

i think these are unnecessary now--with the additions you made above.

> # Allow ssh (can be disabled)
> iptables -A INPUT -p tcp --dport ssh -j ACCEPT
> 
> # Block outgoing NetBios (if you have windows machines running
> # on the private subnet).  This will not affect any NetBios
> # traffic that flows over the VPN tunnel, but it will stop
> # local windows machines from broadcasting themselves to
> # the internet.
> iptables -A FORWARD -p tcp --sport 137:139 -o $EXT -j DROP
> iptables -A FORWARD -p udp --sport 137:139 -o $EXT -j DROP

again--these would need to appear above your:

  iptables -A FORWARD -i $INT -j ACCEPT

rule for them to have an effect.  rules are matched in order--first
terminating match wins (ACCEPT and DROP are both terminating matches)

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
        --The Simpsons

