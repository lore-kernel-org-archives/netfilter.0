From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bad Filter Set?
Date: Sat, 9 Nov 2002 17:29:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021109172906.WITS27595.mta05-svc.ntlworld.com@there>
References: <004701c2867f$f176d2a0$d900a8c0@yamatto> <20021109144114.JEWN21275.mta07-svc.ntlworld.com@there> <008f01c2880f$2d2f5980$d900a8c0@yamatto>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008f01c2880f$2d2f5980$d900a8c0@yamatto>
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

On Saturday 09 November 2002 4:43 pm, Dan Egli wrote:

> As Requested: Firewall Rule Set:

This is a *really* long (= complicatedf) firewall ruleset, given the 
requirements you posted earlier.

I really do recommend that you start from something simple and build it up 
gradually instead of starting out with something so difficult to debug as 
this.

There are a number of things in your script which I'd comment on:

> USERCHAINS=" EXT-input EXT-output \
> tcp-state-flags connection-tracking \
> source-address-check destination-address-check \
> local-dns-server-query remote-dns-server-responce \
> local-tcp-client-request remote-tcp-server-responce \
> remote-tcp-client-request local-tcp-server-responce \
> local-udp-client-request remote-udp-server-responce \
> remote-udp-client-responce \
> EXT-icmp-out EXT-icmp-in \
> EXT-log-in EXT-log-out \
> log-tcp-state "

Why on earth do you have so many user defined chains ?   Did you try putting 
rules into INPUT or FORWARD and get problems ?   Or do you just like having 
lots of chains with a rule pointing to each one ?

> # at this point we have a wide open firewall

Correct - don't you think that is a bad thing ?   It would be better to start 
with a closed firewall and slowly open it to allow traffic you want.   You 
should never have a "wide open firewall", even for a short time during 
startup.

> # default policy is reject packets
> /sbin/iptables -t nat --policy PREROUTING ACCEPT
> /sbin/iptables -t nat --policy OUTPUT ACCEPT
> /sbin/iptables -t nat --policy POSTROUTING ACCEPT
> /sbin/iptables -t mangle --policy PREROUTING ACCEPT
> /sbin/iptables -t mangle --policy OUTPUT ACCEPT

These rules do not do what the comment above them says.   Nowhere can I see 
that you have set a (recommended) default DROP policy on the filter tables in 
the INPUT and FORWARD chains.   The comment on the above rules might lull you 
into a false sense of security if you do not also read the rules and realise 
that they do not reject packets.

 
Finally, looking through your entire ruleset, I cannot see any references to 
the FORWARD chain, therefore you will not be allowing or filtering any 
packets through your firewall - which is what I think you wanted to do ?   
All the rules I can see are for INPUT and OUTPUT so they relate only to the 
firewall machine itself.
 

I really do recommend that you start with a simple ruleset which is 
sufficiently secure to plug into the Internet, and then build it up from 
there.

Try this:

# default drop policy into and through the firewall
iptables -P INPUT DROP
iptables -P FORWARD DROP

# allow established and related connections through
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# allow anything from internal net to Internet - can be tightened up later,
# but at least at least we only allow outbound stuff
iptables -A FORWARD -i eth0 -j ACCEPT

# masquerade all outbound packets so we get the replies back
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 64.122.31.38

# allow packets to be routed through the machine
echo 1 >/proc/sys/net/ipv4/ip_forward
 

Antony.

-- 

If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

