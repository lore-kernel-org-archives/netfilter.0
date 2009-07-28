From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Firewall Configuration Help
Date: Tue, 28 Jul 2009 11:09:04 +0200
Message-ID: <47ae5fdc6d1c4a93d1035f61774996ec@localhost>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: NICHOLAS KLINE <nkline@kent.edu>
Cc: netfilter@vger.kernel.org

Hello Nicholas,


On Mon, 27 Jul 2009 13:56:59 -0400, NICHOLAS KLINE <nkline@kent.edu> wrote:
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

Well, the chances that your own IP address is going to be spoofed are very
low. And even so, the packets you would send back to the attacker would
never get there, and then largely reduce the possibility of attacks. So
it's good practice to clean up this behavior but not mandatory in real
life.

> 2.) How can my firewall adapt to a changing IP address?

Get the address from ifconfig when you start the firewall ;)

> 3.) Please critique my complete firewall rules

ok, comment are below

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
> # Give free reign to the loopback interfaces, i.e. local processes may
> connect
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

I don't like the default policy because you can't log anything in these
rules.
I prefer to put at the end of the ruleset something like
--------
   echo "Default log drop, at the end so we just drop what doesn't match
the
previous rules"
   $IPT -N LOGDROP
   $IPT -A LOGDROP -j LOG --log-prefix "DROP => " --log-level debug
   $IPT -A LOGDROP -j DROP

   $IPT -A INPUT -i $NETCARD -j LOGDROP
   $IPT -A OUTPUT -o $NETCARD -j LOGDROP
--------
that allows you to log and then drop, instead of just dropping.


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

Errrr.... why would you want to drop all the packets coming from the
private network you are connected to ?
These are very dangerous rules. If you are not connected directly, with a
public address, to the internet, you will more likely be connected through
a local network, and then your rules are going to block everything.


> # The following will NOT interfere with local inter-process traffic,
whose
> # packets have the source IP of the local loopback interface, e.g.
> 127.0.0.1
> 
> $IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix "Spoofed source IP"
> $IPTABLES -A INPUT -s $IP_LOCAL -j DROP
> 
> # Tell netfilter that all TCP sessions do indeed begin with SYN
> 
> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
> --log-prefix "Stealth scan attempt?"
> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
> 
> 

My understanding of the conntrack subsystem is that a connection cannot be
in the state NEW without a syn packet, therefore I don't think this is
useful.


> # INBOUND POLICY:
> 
> # Accept inbound packets that are part of previously-OK'ed sessions
> $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> # Log and drop anything not accepted above
> # (Obviously we want to log any packet that doesn't match any ACCEPT
rule,
> for
> # both security and troubleshooting. Note that the final "DROP" rule is
> # redundant if the default policy is already DROP, but redundant security
> is
> # usually a good thing.)
> 
> $IPTABLES -A INPUT -j LOG --log-prefix "Dropped by default (INPUT):"
> $IPTABLES -A INPUT -j DROP
> 

if you default policy drops, why would you drop in the ruleset ? if you
have to drop in the ruleset, then you default policy is not good enough :)


> 
> # OUTBOUND POLICY:
> 
> # (Applies to packets sent to the network interface (NOT loopback)
> # from local processes)
> 
> # If it's part of an approved connection, let it out
> $IPTABLES -I OUTPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> # Allow outbound ping
> # (For testing only! If someone compromises your system they may attempt
> # to use ping to identify other active IP addresses on the DMZ. Comment
> # this rule out when you don't need to use it yourself!)
> 
> # $IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
> 
> # Allow outbound DNS queries, e.g. to resolve IPs in logs
> # (Many network applications break or radically slow down if they
> # can't use DNS. Although DNS queries usually use UDP 53, they may also
use
> TCP
> # 53. Although TCP 53 is normally used for zone-transfers, DNS queries
with
> # replies greater than 512 bytes also use TCP 53, so we'll allow both
> TCP and UDP
> # 53 here
> 
> $IPTABLES -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT
> 
> # Log & drop anything not accepted above; if for no other reason, for
> troubleshooting
> 
> # NOTE: you might consider setting your log-checker (e.g. Swatch) to
> # sound an alarm whenever this rule fires; unexpected outbound trans-
> # actions are often a sign of intruders!
> 
> $IPTABLES -A OUTPUT -j LOG --log-prefix "Dropped by default (OUTPUT):"
> $IPTABLES -A OUTPUT -j DROP
> 

Honestly, for a laptop, I would recommand you open OUTPUT in wide.
Otherwise you're gonna spend a lot of time opening connection to ports you
normally use when connected to any network (smtp, imap, http, https,
jabber, ssh, ...)

> # Log & drop ALL incoming packets destined anywhere but here.
> # (We already set the default FORWARD policy to DROP. But this is
> # yet another free, reassuring redundancy, so why not throw it in?)
> 
> $IPTABLES -A FORWARD -j LOG --log-prefix "Attempted FORWARD? Dropped
> by default:"
> $IPTABLES -A FORWARD -j DROP


FORWARD is processed after INPUT and OUTPUT. If you drop in those two
chains, you shouldn't need to do anything in FORWARD.


Hope it helps,
Julien


-- 
julien
http://jve.linuxwall.info/blog

