From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 10:12:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C728C3.8080406@pbl.ca>
References: <20040609081453.75751.qmail@web14704.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040609081453.75751.qmail@web14704.mail.yahoo.com>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Sagara Wijetunga wrote:
> I noted --syn can only be used with protocol tcp. How
> do I write a similar rule to accept connections to udp
> port 53?

UDP is stateless protocol.  So you have to choices.

Not using connection tracking:

    -A INPUT -p udp --dport 53 -j ACCEPT
    -A OUTPUT -p udp --sport 53 -j ACCEPT

Using connection tracking:

    -A INPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

Both would allow for inbound DNS.  You'll probably want to allow
outbound also.

Somehow I don't think you'll have that much traffic that you will need
to worry about overhead of connection tracking (not even for DNS, as
discussed earlier in this thread).  So I would recommend using it in
your case.  For example, at home I'm using old 200MHz Pentium MMX as
firewall, and it is perfectly capable to handle two interfaces (~3Mbps
(effectivly) cable, and 100Mbps LAN) with connection tracking.

The connection tracking line mentioned above assumes you have a line to
handle outbound packets (responses) equivalent to:

    -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

While we are at it, I would replace the line you have:

    -P OUTPUT ACCEPT

With:

    -P OUTPUT DROP
    -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

(you might want to put this lines at top)

This would limit outbound packets to responses to already established
connections.  This addresses the issue some people pointed out to you
already (that you configured the box as both client and server).  If you
want something to originate from your server, add it explicitly.  You
would probably need to allow DNS server to make outbound connections.
Another example would be to allow you to ping from your server:

    -A OUTPUT -p icmp --icmp-type ping --state NEW -j ACCEPT

For FTP, you need only to allow NEW connections to port 21.  Data
connections will be RELATED, so you don't need separate line for them.
This is if you are using connection tracking.  For this to work, you'll
probably need to load ip_conntrack_ftp module manualy ("modprobe
ip_contrack_ftp" should do it).

So in short, I would organize things somethine like this:

    # Have this at top
    -P INPUT DROP
    -P OUTPUT DROP
    -P FORWARD DROP
    # Unomment FORWARD line and add rules to FORWARD chain if
    # this box is router.  99% of packets will match these three
    # rules, so it makes sense to have them first.
    -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    # -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
    # Put inbound things you need here, these depend on OUTPUT line
    # from first section.  For example:
    -A INPUT -p tcp --dport 21 -m state --state NEW -j ACCEPT
    -A INPUT -p udp --dport 53 -m state --state NEW -j ACCEPT
    -A INPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT
    -A INPUT -p tcp --dport 110 -m state --state NEW -j ACCEPT
       ...  add other services you have ...
    # Put outbound things you need here, these depend on INPUT line
    # from first section:
    -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT
    -A OUTPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT
    -A OUTPUT -p icmp --icmp-type ping --state NEW -j ACCEPT
       ...  add more as needed ...

If some of the services should be accessble only from LAN, than make
more restrictive rule.  For example, replacing POP3 line with:

    -A INPUT -p tcp -s 192.168.0.0/16 --dport 110 -m state --state NEW
-j ACCEPT

If your box has two separate interfaces (LAN and WAN), you can use even
more specific rule (assuming eth1 is LAN interface):

    -A INPUT -i eth1 -p tcp -s 192.168.0.0/16 --dport 110 -m state
--state NEW -j ACCEPT

These rules could be refined in many ways to make things more strict
(and secure).  But with so many services running on a single box, it is
questinable if you would gain anything.

> I don't see a good explanation of tcp-flags either on
> iptables man pages or Packet Filtering HOWTO. What are
> meaning of SYN,ACK,FIN,RST,URG,PSH? What combinations
> can be logged/dropped?

TCP flags are explained in many fine books.  I guess searching a web
(for example using Google) would result in many pages with good
explanations of those.  No point in explaining them again and again in
every single piece of networking software ;-)

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7


