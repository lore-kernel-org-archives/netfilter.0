From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: New Script
Date: Thu, 09 Jan 2003 16:06:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1D8FD9.8080806@fugmann.dhs.org>
References: <1042115936.423.58.camel@nirvana>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042115936.423.58.camel@nirvana>
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
To: mdew <mdew@mdew.dyndns.org>
Cc: netfilter <netfilter@lists.netfilter.org>

mdew wrote:
> Ok, after taking a few samples from scripts in the mailing list, Ive
> come up with this...hopefully my edonkey problem has been solved with
> this script. I havent actually tested this yet, Probably tomorrow (its a
> bit late)
Next time - Test first, then post.

> 
> current Router setup.
> (Internet) 210.54.175.12->eth0---Router--->eth1 10.0.0.6 -=> 10.0.0.x
> 
> 
> #!/bin/bash
> 
> IPTABLES="/sbin/iptables"
> PAUL="10.0.0.9"
> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> echo "Executing The Firwall..."
> echo ""
> echo -n "Loading Modules..."
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_conntrack_irc
> /sbin/modprobe ip_nat_irc
> /sbin/modprobe ip_nat_ftp
> /sbin/modprobe ipt_state
> /sbin/modprobe ipt_limit
> /sbin/modprobe ipt_LOG
> echo -n "Done"
> 
> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD
I would recommend that you set the default policy here to DENY and add
the rules:
	$IPTABLES -a FORWARD -i eth0 -o eth1 -m state --state \
		RELATED,ESTABLISHED -j ACCEPT
	$IPTABLES -a FORWARD -o eth0 -i eth1 -j ACCEPT

to allow machines behind to firewall to comminucate freely with servers 
on the internet.

> $IPTABLES -P INPUT ACCEPT
Uh. Dont allow anything on the INPUT chain.
> $IPTABLES -P OUTPUT ACCEPT
> 
> echo "Allow unlimited traffic on the loopback interface"
> $IPTABLES -A INPUT -i lo -j ACCEPT
> $IPTABLES -A OUTPUT -o lo -j ACCEPT
> 
> echo "Refusing spoofed packets pretending to be from your IP address"
> $IPTABLES -A INPUT -s 210.54.175.12 -j DROP
> 
> echo "Allow SSH"
> # Is this correct?
> $IPTABLES -A INPUT -i eth0 -p tcp --sport 22 -j ACCEPT
> $IPTABLES -A INPUT -i eth1 -p tcp --sport 22 -j ACCEPT
> $IPTABLES -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
> $IPTABLES -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT
> 
> echo "Allow ftp"
> $IPTABLES -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED -j
> ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 21 -m state --state NEW,ESTABLISHED
> -j ACCEPT

> 
> echo "Active ftp"
> $IPTABLES -A INPUT -p tcp --sport 20 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j
> ACCEPT
> 
> echo "Passive ftp"
> $IPTABLES -A INPUT -p tcp --sport 1024:65535 --dport 1024:65535 -m state
> --state ESTABLISHED -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --sport 1024:65535 --dport 1024:65535 -m
> state --state ESTABLISHED,RELATED -j ACCEPT

> 
> echo "Allow DNS"
> $IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
> $IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT

> 
> echo "Allow SFTP"
> $IPTABLES -A OUTPUT -p tcp --dport 115 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 115 -j ACCEPT
> 
> echo "Allow HTTP"
> $IPTABLES -A OUTPUT -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 80 -j ACCEPT
> 
> echo "Allow https"
> $IPTABLES -A OUTPUT -p tcp --dport 443 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 443 -j ACCEPT

> 
> echo "Rejecting all connections to 135:139"
> $IPTABLES -N NETBIOS
> $IPTABLES -A INPUT -p udp --sport 135:139 -j NETBIOS
> $IPTABLES -A INPUT -p tcp --sport 135:139 -j NETBIOS
> $IPTABLES -A INPUT -p udp --dport 135:139 -j NETBIOS
> $IPTABLES -A INPUT -p tcp --dport 135:139 -j NETBIOS
> $IPTABLES -A NETBIOS -j LOG --log-prefix "IPTABLES NETBIOS: "
> $IPTABLES -A NETBIOS -j DROP
> 
> echo "Limit port 4665 traffic to PAUL"
> $IPTABLES -N PAULS_STUFF
> $IPTABLES -A FORWARD -p tcp -s $PAUL --dport 4665 -m limit --limit
> 1/hour -j PAULS_STUFF
> $IPTABLES -A FORWARD -p udp -s $PAUL --dport 4665 -m limit --limit
> 1/hour -j PAULS_STUFF
> $IPTABLES -A FORWARD -p udp -s $PAUL --sport 4665 -m limit --limit
> 1/hour -j PAULS_STUFF
> $IPTABLES -A FORWARD -p tcp -s $PAUL --sport 4665 -m limit --limit
> 1/hour -j PAULS_STUFF
> $IPTABLES -A PAULS_STUFF -j LOG --log-prefix "IPTABLES PAUL: "
> $IPTABLES -A PAULS_STUFF -j ACCEPT
What are you trying here? Linit should not be used as traffic shaping. 
Please use programs in the iproute2 package instead. It will handle 
things much better.
> 
> echo "Allowing SMTP"
> $IPTABLES -A OUTPUT -p tcp --dport 25 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 25 -j ACCEPT
> 
> echo "Allowing POP3"
> $IPTABLES -A OUTPUT -p tcp --dport 110 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 110 -j ACCEPT
> 
> echo "Allowing Ident"
> $IPTABLES -A OUTPUT -p tcp --dport 113 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 113 -j ACCEPT
> 
> echo "Allowing Netmeeting/MSN"
> $IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 1863 -j \
>         REDIRECT --to-ports 1863
> $IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 389 -j \
>         REDIRECT --to-ports 389
> $IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 522 -j \
>         REDIRECT --to-ports 522
> 	
> echo "Allowing EDonkey2k/Emule"
> echo "See: http://www.emule-project.net/faq/ports.htm"
> # should i use any -A FORWARD or PREROUTING here?
> $IPTABLES -A OUTPUT -p tcp --dport 4661 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 4661 -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 4662 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --sport 4662 -j ACCEPT
> $IPTABLES -A OUTPUT -p udp --dport 4665 -j ACCEPT
> $IPTABLES -A INPUT -p udp --sport 4665 -j ACCEPT
> $IPTABLES -A OUTPUT -p udp --dport 4672 -j ACCEPT
> $IPTABLES -A INPUT -p udp --sport 4672 -j ACCEPT
I'm not sure what you want here. But if all you want is to allow users 
to connect to server on the internet on port 4672, then its covered be 
the rules below.

> 
> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
For the protocols ssh, ftp, http, dns, smtp, pop3 and ident you can 
delete all the rules conserning these, as the line above take care of 
all that.

> $IPTABLES -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
This is not needed, as the policy on the OUTPUT chain is already ACCEPT.

Regards
Anders Fugmann






