From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: More neqbie questions
Date: Mon, 02 Aug 2004 13:46:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410E7DFB.9000505@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

This is one of those things that's been hounding me for the past few 
weeks that I can't understand what's *exactly* going on...

I've been using the IPTables tutorial from 
http://iptables-tutorial.frozentux.net/chunkyhtml/index.html, as has 
been pointed out and recommended by many of the list's pros.  It's a 
great tutorial, and I highly recommend it.

However, I have either glossed something covered in it, or I have a 
fundamental misunderstanding of some part of IPTables.

I know that the route works.  I've verified it.  I can move IPTraffic 
when I set all of my policies on my filter script to accept.  However, 
when I set my policies on my script to drop, Nothing talks any more.  I 
have attached a cleaned up version of the script I'm using to invoke 
IPTables.  The only things that have been removed are comments that help 
me remember what I was doing.

<code>
eellis@firewall:~$ cat /etc/iptables/rc.iptables
#!/bin/bash
### Variables
IPT="/usr/local/sbin/iptables"
INT="eth0"
EXT="eth1"

### Flush everything
$IPT -t nat -F
$IPT -F

### Policies
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP

### INPUT chain
# SSH
$IPT -A INPUT -p tcp --dport 22 -j ACCEPT

# HTTP, on port 8000
$IPT -A INPUT -p tcp --dport 8000 -j ACCEPT

# DNS
$IPT -A INPUT -i $INT -p udp --dport 53 -j ACCEPT

### OUTPUT chain
# The only thing doing output on this box are proxy
# servers, and the occasional SSH and HTTP for
# testing.
# SQUID proxy, and local HTTP requests.
$IPT -A OUTPUT -p tcp --dport 80 -j ACCEPT

# SSH
$IPT -A OUTPUT -p tcp --dport 22 -j ACCEPT

### FORWARD chain 

$IPT -A OUTPUT -p tcp --dport 80 -j ACCEPT 


# SSH 

$IPT -A OUTPUT -p tcp --dport 22 -j ACCEPT 


### FORWARD chain 

# Accept anything from the inside requesting http 

# $IPT -A FORWARD -i $INT -p tcp --dport 80 -j ACCEPT 


# Accept anything from the inside requesting SSH 

$IPT -A FORWARD -i $INT -p tcp --dport 22 -j ACCEPT 


# Accept anything from the inside requesting FTP 

$IPT -A FORWARD -i $INT -p tcp --dport 21 -j ACCEPT 


# Accept anything from the inside for mail 

$IPT -A FORWARD -i $INT -p tcp --dport 25 -j ACCEPT 

$IPT -A FORWARD -i $INT -p tcp --dport 110 -j ACCEPT 

$IPT -A FORWARD -i $INT -p tcp --dport 143 -j ACCEPT 


# Accept anything else that's been established 

$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 


### NAT table 

# let's see what damage I can do here... 

# redirect all FORWARDED requests to SQUID 

$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 80 -j REDIRECT 
--to-port 8080

$IPT -t nat -A POSTROUTING -p tcp -j MASQUERADE 


eellis@firewall:~$
</code>

Now, according to my understanding as it sits right now, that should 
masquerade all traffic in the nat table, and drop everything except 
ports 21, 22, 25, 80 (redirected to port 8080), 110, 143.  Firewall 
should accept ports 22 and 8000 input and should allow ports 22 and 80 
on output.  Thing is that it doesn't move packets.

Thanks for all your help.

-- 
Eric Ellis
Gilchrist County Sheriff's Office
IT Coordinator

