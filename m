From: Martijn Lievaart <m@rtij.nl>
Subject: Re: only checking if i make correct custom chains
Date: Mon, 02 Apr 2007 22:21:30 +0200
Message-ID: <461165CA.7040402@rtij.nl>
References: <460E64A0.2040000@gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <460E64A0.2040000@gabrix.ath.cx>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gabrix <sickuser@gmail.com>
Cc: netfilter@lists.netfilter.org

gabrix wrote:
> I only want to see if i interpret iptables custom chains correctly .In
> this chain EXAMPLE i want to build a jump that make various things.This
> is an example :
> IPT=/sbin/iptables
> $IPT -N EXAMPLE
> $IPT -A EXAMPLE -p tcp --dport 80 -j ACCEPT
> $IPT -A EXAMPLE -p tcp --dport 1:65535 DROP
> $IPT -A EXAMPLE -p udp --dport 1024:65535 -j DROP
> $IPT -A EXAMPLE -p icmp --icmp-type any -j ULOG --ulog-prefix
> "DROPPED_ICMP :"
> $IPT -A EXAMPLE -p icmp --icmp-type any -j DROP
> $IPT -I INPUT -i eth0 -p all -d Myhost -j EXAMPLE
> Is all this correct ???? i want for the jump EXAMPLE to accept tcp
> connections on port 80 , drop all others , drop all udp on unprivileged
> ports , ulog all icmp and than drop them all in one jump and that is
> going to happen first of all "I".I'd correct ?Thanks for the attenction !!!
>   

Mostly correct, but can be done much simpler.

$IPT -N EXAMPLE
$IPT -A EXAMPLE -p tcp --dport 80 -j ACCEPT
$IPT -A EXAMPLE -p udp --dport 1:1023 -j ACCEPT
$IPT -A EXAMPLE -m limit --limit 3/s -j ULOG --ulog-prefix "DROPPED ON INPUT eth0/Myhost: "
$IPT -A EXAMPLE -j DROP

$IPT -I INPUT -i eth0 -d Myhost -j EXAMPLE

(I changed the logging, why log only ICMP? Also, always limit logging to 
avoid DOS)

My implementation is slightly different from yours, I drop everything 
not explicitly accepted. In your implementation, the chain EXAMPLE 
returns on several types of input, so the final verdict is in the 
further rules of your ruleset (which you have not shown) or in the 
policy. Examples of what my implemenation drops and yours (probably) 
doesn't: tcp port 0, udp port 0 and any protocol except udp, tcp and icmp.

BTW, why the -d Myhost? If that is the address of eth0, an attacker can 
bypass this rule by using the address of eth1. Why not leave out the -d? 
Unless you have a very good reason to have that in, get it out:

$IPT -I INPUT -i eth0 -j EXAMPLE


I find that rulesets as my implementation are much simpler to maintain. 
If it comes into eth0 and is destined for Myhost, we jump to example, 
which never returns. In your ruleset, you have to think about what can 
come out of the EXAMPLE chain when it returns.

Of course, sometimes you want that. I for instance maintain a chain 
FUCKERS where I collect IPs that have abused services in the past. In 
that case:

-N FUCKERS
-A FUCKERS -s a.b.c.d -j DROPLOG
-A FUCKERS -d a.b.c.d -j DROPLOG
...
-A FUCKERS -s w.x.y.z -j DROPLOG
-A FUCKERS -d w.x.y.z -j DROPLOG

-A INPUT -j FUCKERS
-A FORWARD -j FUCKERS
-A OUTPUT -j FUCKERS
... other rules follow ...

In this example I WANT that chain to return if there is no match. But in 
general, as a rule of thumb, every chain you jump to ends in a terminal 
target (ACCEPT, DROP, REJECT).

A hypothetical example. A firewall with an Internet,, a DMZ and an 
internal lan interface. We allow ssh to the firewall from everywhere. 
Some services from the Internet to the DMZ. Some more services from 
internal to the DMZ. From the DMZ we allow SMTP and DNS out to the 
world. From internal to outside everything is allowed, from outside or 
DMZ to internal nothing.

# preamble, allow all packets from already established connections
-I INPUT -state --state ESTABLISHED, RELATED -j ACCEPT
-I OUTPUT -state --state ESTABLISHED, RELATED -j ACCEPT
-I FORWARD -state --state ESTABLISHED, RELATED -j ACCEPT

# First protect the firewall itself.
-I INPUT -i lo ACCEPT
-I INPUT -p tcp --syn -dport 22 -J ACCEPTLOG
-I INPUT -j DROPLOG

# Forwarding is slightly more complicated
-I FORWARD -i $IF_INTERNET -o $IF_DMZ -j INTERNET_DMZ
-I FORWARD -i $IF_INTERNAL -o $IF_DMZ -j INTERNAL_DMZ
-I FORWARD -i $IF_DMZ -o $IF_INTERNET -j DMZ_INTERNET
-I FORWARD -i $IF_INTERNAL -o $IF_INTERNET -j ACCEPT
-I FORWARD -j DROPLOG

# For this example allow the firewall to connect to everything
-I OUTPUT -j ACCEPT

-N INTERNET_DMZ
-A INTERNET_DMZ -p tcp -d webserver -match mport -dports 80,443 -J ACCEPTLOG
-A INTERNET_DMZ -p tcp -d mailserver -match mport -dports 25,687 -J 
ACCEPTLOG
-A INTERNET_DMZ -j DROPLOG

# Allow users to retrieve and send mail and allow rdesktop for 
administration.
# Note this "chains" to another (terminal!) chain.
-N INTERNAL_DMZ
-A INTERNAL_DMZ -p tcp -d mailserver -match mport -dports 25,110,143 -J 
ACCEPT
-A INTERNAL_DMZ -p tcp -dport rdesktop -J ACCEPT
-J INTERNET_DMZ

# All servers are allowed to query DNS, mailserver can send mail.
-N DMZ_INTERNET
-A DMZ_INTERNET -p udp -dport 53 -J ACCEPT
-A DMZ_INTERNET -p tcp -dport 53 -J ACCEPT
-A DMZ_INTERNET -p tcp -s mailserver -dport 25 -J ACCEPT
-A DMZ_INTERNET -j DROPLOG

The point to note is that the FORWARD chain, just is a big case 
statement that jumps to other chains, THAT NEVER RETURN. This is the 
only way to keep your sanity with bigger rulesets.

As a side note, don't specify more than is needed. In the forward chain, 
there is not a single IP address, you can do everything you want by 
specifying interfaces. This makes your ruleset much easier to maintain. 
If you worry about spoofing, make separate anti spoofing chains, but be 
sure your really, really understand how IP addressing works. A common 
mistake is rules like this:

-I INPUT -i lo -s 127.0.0.0/8 -d 127.0.0.0/8 -J ACCEPT
-I INPUT -i lo -j DROP

Why this is a mistake? That is a whole other chapter (in short, if you 
use any address of the machine, the packets will be send through 
interface lo) so I'll leave it at this. This mail is long as it is.

HTH,
M4


