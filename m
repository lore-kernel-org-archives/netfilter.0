From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables on Satellite receive only linux PC
Date: Mon, 2 Aug 2004 07:14:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408020714.47648.Antony@Soft-Solutions.co.uk>
References: <410736B8.D9130BBF@neduet.edu.pk> <1090995073.2141.35.camel@anduril.intranet.cartel-securite.net> <410DD2C9.9DBAE992@neduet.edu.pk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410DD2C9.9DBAE992@neduet.edu.pk>
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

On Monday 02 August 2004 6:36 am, yunus wrote:

> These are the default values. It still does'nt work. Can any one kindly go
> through my script and tell me the mistake I am making. This is a Linux PC
> with receive only pentanet card.
>
> # Allow selected ICMP types and drop the rest.
> #
> $IPTABLES -A INPUT -p icmp --icmp-type 0 -j ACCEPT
> $IPTABLES -A INPUT -p icmp --icmp-type 3 -j ACCEPT
> $IPTABLES -A INPUT -p icmp --icmp-type 11 -j ACCEPT
> $IPTABLES -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j ACCEPT
> $IPTABLES -A INPUT -p icmp -j firewalled

Are you getting any ICMP packets logged from your "firewalled" user-defined 
chain?   I just wonder whether the satellite link uses any ICMP types you 
haven't allowed for here...?

> $IPTABLES -A INPUT -p tcp -s 0/0 --dport 80 -j ACCEPT
> $IPTABLES -A INPUT -p tcp -s 0/0 --dport 443 -j ACCEPT
> $IPTABLES -A INPUT -p tcp -s 0/0 --dport 25 -j ACCEPT
> $IPTABLES -A INPUT -p tcp -s 0/0 --dport 53 -j ACCEPT
> $IPTABLES -A INPUT -p udp -s 0/0 --dport 53 -j ACCEPT
> $IPTABLES -A INPUT -p tcp -s 0/0 --dport 123 -j ACCEPT
> $IPTABLES -A INPUT -p udp -s 0/0 --dport 123 -j ACCEPT
> #
> $IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 443 -j ACCEPT
> $IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 25 -j ACCEPT
> $IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -i pentanet0 -p udp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -i pentanet0 -p udp --dport 123 -j ACCEPT
> $IPTABLES -A FORWARD -i pentanet0 -p tcp --dport 123 -j ACCEPT

Are you *really* providing all these services - HTTP, HTTPS, SMTP, DNS, Time, 
*on* the firewall itself (INPUT) as well as on server/s inside your network 
(FORWARD)?

> #$IPTABLES -A INPUT -s 10.0.0.0/24 -d $IP1 -j ACCEPT
>
> #
> # Allow packets that are part of an established connection to pass
> # through the firewall. This is required for normal Internet activity
> # by inside clients.
> #
> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

I would advise putting these rules as the first in their respective tables.   
Either move the position of these rules in your script, or change "-A" to 
"-I".   The vast majority of packets coming into or through the firewall will 
match one of the above rules, so it should be the first in the list.

> # Anything not already matched gets firewalled and logged.
> #
> $IPTABLES -A INPUT -j firewalled

And what about other packets trying to get through FORWARD?   Do you LOG 
those?   (LOGging can be a big clue when trying to track down why something 
isn't working...)

Regards,

Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.

                                                     Please reply to the list;
                                                           please don't CC me.


