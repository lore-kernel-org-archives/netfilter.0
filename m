From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is my script good and secure?
Date: Mon, 15 Mar 2004 13:50:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151350.03709.Antony@Soft-Solutions.co.uk>
References: <DIIE.000000E500002A8E@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000E500002A8E@sbgit.com>
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

On Monday 15 March 2004 1:28 pm, netfilter@sbgit.com wrote:

> Is this a good and secure Firewall Script?

> echo "1" > /proc/sys/net/ipv4/ip_forward # Initialising of Forwarding

Suggest you do this at the end, after setting up all the rules, instead of at 
the beginning, when some packets might get forwarded before you're ready.

> iptables -F sperre
> iptables -X sperre
> iptables -N sperre

I notice you are calling this user-defined chain from both INPUT and FORWARD - 
this means that all the protocols you allow *through* the firewall are also 
accepted *to* it - is this what you want?

> iptables -A sperre -i eth1 --dport 22,19,21,22,25,3389,1723,23000:23001 -j
> ACCEPT # Allow outbound only for specific ports

For example, the above rule is going to get called by both FORWARD and INPUT - 
think about whether that's what you meant to set up.

> iptables -A sperre -p tcp --dport 23001:23001 -j ACCEPT    # Battlefield

Did you mean "--dport 23000:23001"?

> iptables -A sperre -m state --state ESTABLISHED,RELATED -j ACCEPT

Put this rule at the top of the chain, so it gets matched first - nearly all 
of your traffic will match here, so make it efficient to process.

> iptables -A PREROUTING -t nat -i eth0 -p 37  -j DNAT --to 192.168.1.220

You have a VPN which uses protocol 37 (DDP: Datagram Delivery Protocol) ???

I think you mean 47: GRE.

> # Special Rules
> iptables -A INPUT -i eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
> iptables -A OUTPUT -o eth1 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
> iptables -A INPUT -i eth0 -s 192.168.1.0/24 -p tcp --destination-port 25 -j
> ACCEPT

No need for this rule as packets will match on the INPUT rule above (unless 
you meant eth1?)

> iptables -A INPUT lo -p tcp --destination-port 10024 -j ACCEPT

Missing a "-i" there :)

> echo "Firewall started"

Good luck.

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


