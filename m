From: "Dan Egli" <dan@shortcircuit.dyndns.org>
Subject: Re: Bad Filter Set?
Date: Sun, 10 Nov 2002 23:20:29 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002d01c2894a$71b1fb30$c600a8c0@yamatto>
References: <004701c2867f$f176d2a0$d900a8c0@yamatto> <20021109144114.JEWN21275.mta07-svc.ntlworld.com@there> <008f01c2880f$2d2f5980$d900a8c0@yamatto> <20021109172906.WITS27595.mta05-svc.ntlworld.com@there>
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
To: netfilter@lists.netfilter.org

I took the firewall script based on an "optimized firewall" from an IPTABLES
book (Linux Firewalls was the title). I know near 0 about IPTables, which is
why I used the book as an example. I also wanted to be able to enable or
disable certain services without adding or removing lines, because I
*THOUGHT* it was best that way. Please realize I'm coming from a Windows
environment. I want to learn as much as I can about IPTables, but the only
book I've seen (the one I mentioned earlier) seems very complicated. I've
read through the how-tos, but for someone like me they just don't seem to
click. I could not define exactly why, just that when I read them I quickly
get lost with all the stuff about DNAT vs. SNAT vs. whatever and how each
packet works with those.

And as to the default policy comment, it was originally that they all
said -j DROP, but that killed the network completely. When I set them to -j
ACCEPT (I know, bad idea) it unlocks the network. This is kinda a hacked
script that I went through to just get the network up and running again.

If you could provide a different How-To than the one written by Rusty, I'd
happily look at it. And in the mean time, if you can please provide a script
that will do what I stated?? To clarify, I need a script (commented would
help!) that does the following:

1) Block all ports EXCEPT:
FTP, SSH, TELNET (yes there is a reason for telnet!), SMTP, DNS, NNTP, NTP,
ROUTED (520), PRINTER (515), POP3, IMAP, HTTP, HTTPS, and ports 4000 & 5000
(special programs run on those ports and they need to be open).

2) Forward Inbound traffic from port 5000 to IP 192.168.0.5. Should be a
Transparent NAT (If I hit 192.168.0.1 port 5000, then the firewall forwards
it to 192.168.0.5 5000,  and any packets sent from 192.168.0.5:5000 [which
would only be in reply to an inbound packet] should appear as coming from
192.168.0.1:5000). Here's a basic setup of the machine so you have that to
go on:

EXTERNAL IP:  64.122.31.38 on eth1
internal IP: 192.168.0.1 on eth0

3) Perform basic IP Masquerading for unlisted machines on the 192.168.0.x
net. So if a machine addressed as 192.168.0.26 requests www.yahoo.com, it
goes in from eth0, then goes out eth1 as from eth1's address, and the return
comes in eth1 and goes back out eth0 to the correct machine.

4) Log any blocked traffic in the syslog.

Your help is greatly appreciated!

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, November 09, 2002 10:29 AM
Subject: Re: Bad Filter Set?


> On Saturday 09 November 2002 4:43 pm, Dan Egli wrote:
>
> > As Requested: Firewall Rule Set:
>
> This is a *really* long (= complicatedf) firewall ruleset, given the
> requirements you posted earlier.
>
> I really do recommend that you start from something simple and build it up
> gradually instead of starting out with something so difficult to debug as
> this.
>
> There are a number of things in your script which I'd comment on:
>
> > USERCHAINS=" EXT-input EXT-output \
> > tcp-state-flags connection-tracking \
> > source-address-check destination-address-check \
> > local-dns-server-query remote-dns-server-responce \
> > local-tcp-client-request remote-tcp-server-responce \
> > remote-tcp-client-request local-tcp-server-responce \
> > local-udp-client-request remote-udp-server-responce \
> > remote-udp-client-responce \
> > EXT-icmp-out EXT-icmp-in \
> > EXT-log-in EXT-log-out \
> > log-tcp-state "
>
> Why on earth do you have so many user defined chains ?   Did you try
putting
> rules into INPUT or FORWARD and get problems ?   Or do you just like
having
> lots of chains with a rule pointing to each one ?
>
> > # at this point we have a wide open firewall
>
> Correct - don't you think that is a bad thing ?   It would be better to
start
> with a closed firewall and slowly open it to allow traffic you want.   You
> should never have a "wide open firewall", even for a short time during
> startup.
>
> > # default policy is reject packets
> > /sbin/iptables -t nat --policy PREROUTING ACCEPT
> > /sbin/iptables -t nat --policy OUTPUT ACCEPT
> > /sbin/iptables -t nat --policy POSTROUTING ACCEPT
> > /sbin/iptables -t mangle --policy PREROUTING ACCEPT
> > /sbin/iptables -t mangle --policy OUTPUT ACCEPT
>
> These rules do not do what the comment above them says.   Nowhere can I
see
> that you have set a (recommended) default DROP policy on the filter tables
in
> the INPUT and FORWARD chains.   The comment on the above rules might lull
you
> into a false sense of security if you do not also read the rules and
realise
> that they do not reject packets.
>
>
> Finally, looking through your entire ruleset, I cannot see any references
to
> the FORWARD chain, therefore you will not be allowing or filtering any
> packets through your firewall - which is what I think you wanted to do ?
> All the rules I can see are for INPUT and OUTPUT so they relate only to
the
> firewall machine itself.
>
>
> I really do recommend that you start with a simple ruleset which is
> sufficiently secure to plug into the Internet, and then build it up from
> there.
>
> Try this:
>
> # default drop policy into and through the firewall
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
>
> # allow established and related connections through
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # allow anything from internal net to Internet - can be tightened up
later,
> # but at least at least we only allow outbound stuff
> iptables -A FORWARD -i eth0 -j ACCEPT
>
> # masquerade all outbound packets so we get the replies back
> iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 64.122.31.38
>
> # allow packets to be routed through the machine
> echo 1 >/proc/sys/net/ipv4/ip_forward
>
>
> Antony.
>
> --
>
> If you want to be happy for an hour, get drunk.
> If you want to be happy for a year, get married.
> If you want to be happy for a lifetime, get a garden.
>
>


