From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Proxy Setup
Date: Mon, 24 Nov 2003 10:18:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC2214C.1050803@Loudoun-Fairfax.com>
References: <20031124074817.51047.qmail@web40708.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031124074817.51047.qmail@web40708.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Mohammad Shakir wrote:

> I have Red Hat Linux 7.3 with squid-2.4.STABLE6-1.7.2, 
> kernel-2.4.18-3,iptables-1.2.5-3.
> I want to run cable network with 100 users with normal dialup.
> I have 4 PC PIII 733Mhz with 256MB RAM and USR 56K External Modem with 
> Linux 7.3 configure Squid and 4 telephone lines.
> Now I want all my request come on server1 ( for this I setup dhcp on 
> server1 and define gateway,DNS to server1 to all clients),
> I also setup MASQUREAD on server1 so all clients are connected with 
> Internet.


OK, so if I understand you, server1 is the firewall, the DNS server, has 
a modem ppp0, and serves as the gateway for the network. Correct?

> But if any request come for browsing means tcp port 80 Linux 
> automatically forward that request on server2, server3, server4.
> Actually I want to distribute all browsing request to server2, server3 
> and server4.


Are servers 2, 3, and 4 on the LAN inside the firewall? Why do you have 
3 web servers inside a gateway with a dial up connection? A single 
server can easily handle more traffic than a 56k modem could ever produce.

> I know normal telephone line is not best for 100 users but right now I 
> do not have any other resource.
> I am sending herewith my script which I am using on server1.
>
> #  Flush all Rules
> /sbin/iptables --flush
> /sbin/iptables --table nat --flush
> /sbin/iptables --delete-chain
> /sbin/iptables --table nat --delete-chain
>
> #  for transprent proxy
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j 
> REDIRECT --to-port 8080
>
> #  for MASQUREADE
> /sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 
> --out-interface ppp0 -j MASQUERADE
> /sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> /sbin/iptables -A INPUT -m state --state NEW -i ! ppp0 -j ACCEPT
> /sbin/iptables -P INPUT DROP   #only if the first two are succesful


This line is reached when the previous rules do *not* match. The rule is 
fine, I just want to make sure you're clear on how this works.

> /sbin/iptables -A FORWARD -i ppp0 -o ppp0 -j REJECT


This rule doesn't do anything.

> /sbin/iptables -I INPUT -p icmp -j REJECT


Rejecting all icmp traffic is not a good idea. I would remove this rule 
or replace it with more specific rules.

> /sbin/iptables -I FORWARD -p icmp -j DROP


Same as above. Dropping all icmp traffic is even worse than rejecting it.

> echo "1" > /proc/sys/net/ipv4/ip_forward

You're also mixing your INPUT and FORWARD rules here. You'll find it's 
easier to understand your ruleset if you keep all the rules for each 
chain grouped together. You really need to develop a better 
understanding of how netfilter works. Read Oskar's tutorial and look at 
his sample scripts:

http://iptables-tutorial.frozentux.net/

Jeff



