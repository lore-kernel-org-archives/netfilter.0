From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: SSL and TLS not working on FIrewall machine?
Date: Wed, 30 Oct 2002 22:34:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c28096$d5d4ad90$020aa8c0@winxp>
References: <20021031033647.13247.qmail@web40710.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Tasha Smith <natasha3641@yahoo.com>, netfilter@lists.netfilter.org

just my opinion, but your script is complicated and not for the right
reasons.  I'm a big proponent of keeping it simple

> 1.>Umm i was wandering how come SSL or TSL doesnt connect to my banks
website
> from the firewall machine.

iptables knows nothing about SSL and TLS. You want to know why you can't
connect on port 443;-)

> # Enable broadcast echo protection
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
>
<snip of sysctl parameters>

You might consider creating a separate file for these kernel parameters and
then sourcing the file from the script. Anymore, I just edit
/etc/sysctl.conf.  That might be a Redhat thing though, not sure. Another
suggestion is to keep all your INPUT, OUTPUT, and FORWARD rules together.
Makes the script much more readable. In some cases, I've even created a very
short 1 page main script that calls separate files for INPUT,OUTPUT, and
FORWARD.  When you want to change your INPUT rules, for instance, you don't
have any irrelevant clutter confusing things.

> # All of the bits are cleared
> iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
> iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP
> # SYN and FIN are both set
> iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> # SYN and RST are both set.
> iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> # FIN and RST are both set
<snip>

bleh.  I would axe the above section entirely myself....has little value.
Aren't these are all taken care of with a default DROP policy and by only
allowing NEW,EST, REL?

> # Log Policy for first 25 ports UDP/TCP.
> iptables -I INPUT -i eth0 -p tcp \
>          --dport 0:25 -j LOG --log-prefix "PortScans to 0-25TCP: "
>
> iptables -I INPUT -i eth0 -p udp \
>          --dport 0:25 -j LOG --log-prefix "PortScan-to 0-25UDP: "

This is probably not doing what you think it is.  This will log any input on
eth0 with a destination port of 0 thru 25.  Not very useful.

> # Drop Invalid connection
> iptables -A INPUT -m state --state INVALID -j LOG \
>          --log-prefix "Invalid input: "
> iptables -A INPUT -m state --state INVALID -j DROP
<snip>

A lot of these INVALID packets were dropped already in earlier INPUT/FORWARD
rules.  So this isn't logging everything. Do keep the OUTPUT rules however.

> # Allow Access for DNS UDP for my ISP DNS server.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>    iptables -A OUTPUT -o eth0 -p udp \
>             -s $IP_INET --sport 1024:65535 \
>             -d 239.73.4.130 --dport 53 \
>             -m state --state NEW -j ACCEPT
> fi
>
> iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET     --sport 1024:65535 \
>          -d 239.73.4.130 --dport 53 -j ACCEPT
>
>
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p udp \
>              -s $IP_INET --sport 1024:65535 \
>              -d 239.73.4.150 --dport 53 \
>              -m state --state NEW -j ACCEPT
> fi
>
> iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET --sport 1024:65535 \
>          -d 239.73.4.150 --dport 53 -j ACCEPT

I don't get these rules. More unecessary complication IMHO. Either take
advantage of connection tracking or don't. Is there some scenario where you
might want to quickly change from using it to not using it (testing, etc)? I
don't see where you've set this variable (so presumably your not using
connection tracking).

> # Allow access to remote webservers PORT 80.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p tcp \
>              -s $IP_INET --sport 1024:65535 \
>              --dport 80 -m state --state NEW -j ACCEPT
> fi
>
> iptables -A OUTPUT -o eth0 -p tcp \
>          -s $IP_INET --sport 1024:65535 \
>          --dport 80 -j ACCEPT
>
> iptables -A INPUT -i eth0 -p tcp ! --syn \
>          --sport 80 \
>          -d $IP_INET --dport 1024:65535 -j ACCEPT
>
> # Allow access for SSL and TLS on Port 443.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p tcp \ #<------------------
>              -s $IP_INET --sport 1024:65535 \
>              --dport 443 -m state --state NEW -j ACCEPT
> fi
>
> iptables -A OUTPUT -o eth0 -p tcp \
>          -s $IP_INET --sport 1024:65535 \   #<----------------
>          --dport 443 -j ACCEPT
>
> iptables -A INPUT -i eth0 -p tcp ! --syn \
>          --sport 443 \
>          -d $IP_INET --dport 1024:65535 -j ACCEPT #<-----------------
>
> iptables -A OUTPUT -o eth0 \
>         -p tcp -m multiport --dport 80,443 \
>         ! --syn -s $IP_INET --sport 1024:65535 -j ACCEPT  #<--------------
>
> iptables -A INPUT -i eth0 -p tcp -m multiport \
>         --sport 80,443 \
>        ! --syn -s $IP_INET --dport 1024:65535 -j ACCEPT  #<------------

umm....okay.  maybe it's a display issue , but where exactly are you putting
those pound signs?  In any event, for a connection-tracking based rule:
iptables -A OUTPUT -o $EXTIF -m state --state NEW -p tcp -m
multiport --dports 80,443 -j ACCEPT

If you don't want to use connection tracking:
iptables -A OUTPUT -o $EXTIF -p tcp -m multiport --dports 80,443 -j ACCEPT

Anything else is probably more complicated that its worth.



