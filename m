From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: help me with firewall+drop by default
Date: Fri, 5 Mar 2004 01:37:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403050137.26207.Antony@Soft-Solutions.co.uk>
References: <BAY7-F58zId5qPkIv4d00040d1e@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY7-F58zId5qPkIv4d00040d1e@hotmail.com>
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

On Friday 05 March 2004 1:24 am, verito verito wrote:

> Firewall was  denied , Just for default I'm sending,  the (setting up) 
> that is  able to  access into the web , but  I can't access into the mail
> server (POP), and some web pages that requiered the  Ports
> (443,21,23,25,110), I hope. I will clear , if there is any question just
> replying me , Thanks

Where are you tryuing to access the POP3 server from and to?

In other words, where is your client (compared to eth0 adn eth1 in your 
rules), and is the server running on the machine with these rules, or on some 
other server being routed through this one?

> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -t nat -A PREROUTING -t tcp --dport 80 -j REDIRECT --to-port 8080
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> echo "1" > /proc/sys/net/ipv4/ip_forward
> iptables -A INPUT -i eth0 -s 0/0 -d 0/0 -j ACCEPT
> iptables -A -i lo -s 0/0 -d 0/0 -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> iptables -A INPUT -i eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
> iptables -A OUTPUT -j ACCEPT

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


