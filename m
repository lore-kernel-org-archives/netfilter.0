From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Bridging Firewall
Date: Wed, 5 Feb 2003 19:07:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302051907.38066.netfilter@newkirk.us>
References: <000c01c2cd62$2c9e82f0$8c7aad41@everity.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c2cd62$2c9e82f0$8c7aad41@everity.net>
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
To: Tim Roberts <techlists@dsslink.net>
Cc: netfilter@lists.netfilter.org

On Wednesday 05 February 2003 05:01 pm, Tim Roberts wrote:
> Hi, I successfully configured (I think) a bridging firewall using
> Script provided in David Whitmarsh's how too at
> http://www.sparkle-cc.co.uk/firewall/firewall.html I have a few
> questions as I am trying VERY hard to never have to see a Windows
> XXAnything disc again.
>
> 1.) I do not see anything other than IPTables starting up and
> learning.......in /var/log/messages. I have unremarked kernal* to
> point to /var/log/messages. I think the only logging being done is if
> a DOS occurrs. Based on his script, how do I enable more or any
> logging that will show me a little or alot of something? :)

If you want to write something to the log during script execution, just=20
use echo right in the script.  Very handy for 'breakpoint' style=20
debugging of the script.  I'd suggest adding a prefix like "IPT:" to the=20
echoed string, to make it easily greppable.  Otherwise, use the "-j LOG"=20
target to write log entries when matching packets hit the LOGging rule. =20
(the same suggestion applies here, using "--log-prefix" parameter)

> 2.) I have 2 NIC's both public (which is why I choose to bridge) In
> this script, I enabled the option to allow remote access from my LAN.
> However I cannot even ping.....from inside the LAN ,the specified
> address in the script to the firewall.

I've never worked hands-on with bridging, so I don't know if this is an=20
effect of the set-up or not.  Are you sure the interface is up with that=20
IP?

> 3.) The firewall cannot ping outside the LAN (which I could care less)
> but Im getting messages when the script runs that the machine cannot
> lookup or resolve FQDN's specified to be blocked.

Try inserting "dig {FQDN}" in the script, it should output its results to=
=20
the logfile as well, and you can look to see if DNS is working correctly=20
at that point in the process...  Generally it is much quicker, and=20
technically safer, to specify IPs instead of FQDNs anyway.

I've commented on a few (fragmented out-of-context) portions of the=20
script below...


> # Our interfaces don't have IP addresses so we have to start with the
> mangle # PREROUTING table

???  I realize this is from the original script, but still: ???

> $IPTABLES -t mangle -P PREROUTING DROP

You should never have anything but ACCEPT policy for any mangle table=20
chains, nor for any nat table chains.  Filter in the filter table.

> # Now we are pretty secure, let's start the bridge
> # This will create a new interface

Simply setting DROP policy in INPUT, OUTPUT, and FORWARD chains is quite=20
secure.  So long as there are no rules in any of those chains, the ONLY=20
thing that will ever see a packet is netfilter itself.

> # Block obvious spoofs
>
> $IPTABLES -t mangle -A PREROUTING -s 192.168.0.0/16 -j DROP
> $IPTABLES -t mangle -A PREROUTING -s 10.0.0.0/8 -j DROP
> $IPTABLES -t mangle -A PREROUTING -s 172.16.0.0/12 -j DROP

These should be done in the FORWARD chain of the filter table, and=20
possibly in the INPUT chain of the filter table, NOT in any mangle table=20
chains.

> # Accept internal packets on the internal i/f
> $IPTABLES -t mangle -A PREROUTING -i $LAN_IFACE -s
> $INTERNAL_ADDRESS_RANGE -j ACCEPT

Again here.=20

> $IPTABLES -t mangle -A PREROUTING -i $INET_IFACE ! -s
> $INTERNAL_ADDRESS_RANGE -j ACCEPT

Repeat after me:  "FILTER in the FILTER table.  MANGLE in the MANGLE=20
table.  NAT in the NAT table."  :^)  I don't care what Mr Whitmarsh's=20
script and tutorial state, this is NOT what the mangle table is for, and=20
is just generally a bad idea.  For what you are doing in this setup, you=20
don't even NEED the mangle table, or the nat table.

> $IPTABLES -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE -j ACCEPT
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

A good start, although some situations warrant tighter control on what=20
the local clients are allowed to do.

> $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
> --log-level 7 --log-prefix "IPT FORWARD packet died: "

This doesn't make much sense.  All this does is log ANY packet  (well,=20
actually only 3/minute maximum) that didn't come from=20
INTERNAL_ADDRESS_RANGE and isn't part of or related to an ESTABLISHED=20
connection, and refer to it as having 'died'.  They haven't necessarily=20
'died', especially since there are more FORWARD rules below this point.

> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j=20
ACCEPT        # echo reply
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j=20
ACCEPT        # dest unreachable
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j=20
ACCEPT        # redirect
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j=20
ACCEPT       # time exceeded

> $IPTABLES -A FORWARD -p ICMP -j icmp_packets

These should all be caught by the "ESTABLISHED,RELATED" state rule above,=
=20
since they are all 'response' type communications.

> $IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 53 -j=20
ACCEPT       # DNS
> $IPTABLES -A udpincoming_packets -p UDP -s 0/0 --source-port 123 -j=20
ACCEPT      # ntp

> $IPTABLES -A FORWARD -p UDP -j udpincoming_packets

Same here.  Since you are specifying source-port of 53 and 123, then=20
these should only match replies coming back, which would already have=20
matched "ESTABLISHED,RELATED".  (However, someone could try to connect=20
to ANY UDP port they want, and so long as the source-port is one of=20
these, your firewall would allow the connection to be established!)

> $IPTABLES -A tcp_packets -p TCP -s 0/0 -d springfield.sparkle-cc.co.uk
> --dport 80 -j allowed # smtp=20

If springfield.sparkle-cc.co.uk has a static IP, why not just use it=20
here?  That would circumvent your DNS lookup difficulties... For better=20
readability, assign "SPRINGFIELD=3Dw.x.y.z" at the top, and use=20
$SPRINGFIELD here.  (Nitpicking, but this is HTTP, not SMTP: of course,=20
anyone who wouldn't realize this probably has no business digging=20
through your firewall script anyway... :^)

> $IPTABLES -A FORWARD -p TCP -j tcp_packets

j

