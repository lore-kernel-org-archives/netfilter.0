From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Firewall Configuration Help
Date: Wed, 05 Aug 2009 14:56:31 +0200
Message-ID: <4A79817F.1070705@chello.at>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

NICHOLAS KLINE wrote:
> Hi,
>
> I have a fresh install of Ubuntu 8.x desktop edition running on a
> laptop. Before I plug the laptop into a public network and proceed to
> patch it, I want to make sure I have a secure firewall in place.
>
> This particular system will not be running any server services such as
> HTTPD, SSH, FTP, etc. Inbound traffic should be denied unless an
> outbound connection was first established.
> I will mostly be using a wired internet connection but I might switch
> to wireless once in awhile.
>
> After reading a few Linux security books, I have a decent set of
> firewall rules almost ready to put into place. The only rule
> preventing me from putting the firewall in place is:
>
> $IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s $IP_LOCAL -j DROP
>
> Which says to drop any incoming packet which has my source IP address
> on it. The reason this rule is preventing me from putting the firewall
> in place is because my IP address is not always the same or I will be
> occasionally using a public wireless network. The complete version of
> my firewall rules are below.
>
> My questions are:
>
> 1.) What are the risks of excluding the firewall rule mentioned above?
> 2.) How can my firewall adapt to a changing IP address?
> 3.) Please critique my complete firewall rules
>
> Thank you for your help!
>
>
> Complete Firewall Rules
> -------------------------------
>
> # Establish some variables:
>
> # Location of IPTABLES on your system
> IPTABLES="/sbin/iptables"
>
> # Reserved loopback address range
> LOOPBACK="127.0.0.0/8"
>
> # Class A private networks
> CLASS_A="10.0.0.0/8"
>
> # Class B private networks
> CLASS_B="172.16.0.0/12"
>
> # Class C private networks
> CLASS_C="192.168.0.0/16"
>
>
> # SETUP
>
> # Flush active rules and custom tables
> $IPTABLES --flush
> $IPTABLES -t nat --flush
> $IPTABLES -t mangle --flush
>
> $IPTABLES --delete-chain
> $IPTABLES -t nat --delete-chain
> $IPTABLES -t mangle --delete-chain
>
> # Give free reign to the loopback interfaces, i.e. local processes may connect
> # to other processes' listening-ports.
> $IPTABLES -A INPUT  -i lo -j ACCEPT
> $IPTABLES -A OUTPUT -o lo -j ACCEPT
>
> # Set default-deny policies for all chains.
> # User-defined chains cannot be assigned default policies.
> $IPTABLES -P INPUT DROP
> $IPTABLES -P FORWARD DROP
> $IPTABLES -P OUTPUT DROP
>
> $IPTABLES -t nat -P PREROUTING DROP
> $IPTABLES -t nat -P OUTPUT DROP
> $IPTABLES -t nat -P POSTROUTING DROP
>
> $IPTABLES -t mangle -P PREROUTING DROP
> $IPTABLES -t mangle -P OUTPUT DROP
>  

Set policies in for nat and mangle table to the default ACCEPT. Just
drop in filter table.
In newer versions of iptables DROP in nat table is prohibited. Dropping
everything in mangle table creates more hassle, because you need to
explicitely allow in mangle and in the filter table.
The filter table is the place meant to do the filtering work.

> # Do some rudimentary anti-IP-spoofing drops. The rule of thumb is "drop
> # any source IP address which is impossible"
>
> # Refuse packets claiming to be from the loopback interface
> $IPTABLES -A INPUT -s $LOOPBACK -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s $LOOPBACK -j DROP
>
> # Refuse packets claiming to be from a Class A private network
> $IPTABLES -A INPUT -s $CLASS_A -j LOG --log-prefix " Spoofed source IP"
> $IPTABLES -A INPUT -s $CLASS_A -j DROP
>
> # Refuse packets claiming to be from a Class B private network
> $IPTABLES -A INPUT -s $CLASS_B -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s $CLASS_B -j DROP
>
> # Refuse packets claiming to be from a Class C private network
> $IPTABLES -A INPUT -s $CLASS_C -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s $CLASS_C -j DROP
>
> $IPTABLES -A INPUT -s 255.0.0.0/8 -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s 255.0.0.0/8 -j DROP
> $IPTABLES -A INPUT -s 0.0.0.0/8 -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s 0.0.0.0/8 -j DROP
>
> # The following will NOT interfere with local inter-process traffic, whose
> # packets have the source IP of the local loopback interface, e.g. 127.0.0.1
>
> $IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s $IP_LOCAL -j DROP
>
>   

$IPTABLES -N SPOOFED_SOURCE
$IPTABLES -A SPOOFED_SOURCE -m limit --limit 'value-of_choice' 
--limit-burst 'value-of_choice' -j LOG --log-prefix "Spoofed source IP"
$IPTABLES -A SPOOFED_SOURCE -j DROP

now put your INPUT rules and send them to the SPOOFED_SOURCE chain.
i.e.
$IPTABLES -A INPUT -s 255.0.0.0/8 -j SPOOFED_SOURCE

saves writing and elaborating lots of rules.

...

greets

Mart

