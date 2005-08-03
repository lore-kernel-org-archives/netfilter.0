From: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Subject: Re: Problems with OUTPUT rules ESTABLISHED,RELATED
Date: Wed, 03 Aug 2005 11:15:00 +0200
Message-ID: <42F08B14.7030000@mnemon.de>
References: <1123009163.12889.164.camel@ws50.darkcore.net>	<1123012047.26053.8.camel@localhost>	<1123016327.12889.200.camel@ws50.darkcore.net>
	<1123045682.26557.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1123045682.26557.47.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> May be somebody from netfilter mailing list point us to the right
> documentation. The general question is at which points of the packet
> traversal diagram the connection tracking code changes its state? Or in
> which chain/tables syn,ack packet is the part of ESTABLISHED connection?

As (almost) always, I can recommend:

http://iptables-tutorial.frozentux.net/chunkyhtml/index.html

Recalling from my (ofcourse limited :)) memory, connections which have
seen traffic in both directions are in (iptables) state ESTABLISHED. So,
this is the case right after the SYN/ACK packet. This packet is allowed
by the original ruleset.

>>According to http://www.knowplace.org/netfilter/ip_overview.html , the
>>handshake procedure is as follows:
>>
>>1. (B) --> [SYN] --> (A)
>>2. (B) <-- [SYN/ACK] <--(A)
>>3. (B) --> [ACK] --> (A)

Correct.

>>I read it as meaning that up until the end of step 2 the connection
>>would be NEW. At the end of Step 2 and beyond the connection would be
>>ESTABLISHED.

See above.

>>A packet with just the "ACK" flag set can only be part of an established
>>connection. quote "The important thing to note here is that after the
>>three-way handshake is completed, and the connection is complete, every
>>packet that is part of this TCP connection will always have the ACK bit
>>set."

Except for some RST packets.

>>So, my understanding is the only way a packet could be generated with
>>the ACK flag set and the SRC as my server's IP is as part of an
>>established connection.

I agree.

>>If that is the case then it should not be blocked because I have an
>>OUTPUT rule  which allows it.

Not in this case. According to the discussion above and your rules, we
have the following situation:

1.) SYN packet arrives at your box. Because of "--syn --dport 80"
    this is allowed.
2.) Your box answers with a SYN/ACK packet, which is also allowed.
    => "--state ESTABLISHED,RELATED". State changes to ESTABLISHED.
3.) The other box sends the 3rd packet of the handshake => ACK. This
    packet gets dropped, because there is no rule in INPUR that
    permits ESTABLISHED packets. At this point the connection is
    basically dropped.

You should be able to see this, when you tcpdump on the respective
interface, eth0 in this case. Solution: Add the following rule.

iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

BTW, these rules are recommended too:

iptables -I INPUT -i lo -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT

> 
> TCP connection states are not the same as iptables connection states.
> And connection tracking code think that connection is ESTABLISHED only
> after step 2. But (I hope :)) packet should pass connection tracking
> code BEFORE it get INPUT or OUTPUT chain and thus connection should be
> at the ESTABLISHED state in this chains. Thus setting just ESTABLISHED
> should be Ok.

You only need RELATED for FTP and the like.

> 
>>Where am I going wrong here?
>>
>>If I do:
>>
>>iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>>
>>Then all outbound packets are allowed so I definitely don't want that.

I'm no friend of general OUTPUT filtering (OUTPUT policy == DROP), it
makes things more complicated than necessary and provides little or no
security. There are good reasons to have single DROP rules in OUTPUT,
but this is discussed on this list often. So, it's up to you, but I
can't recommend it.

> 
> I think your problem is in the following rule:
> 
> iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT
> 
> change it on
> 
> iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT

No, this is no problem, IMO "--syn" is the better way. Only having
"--state NEW" allows alway the first packet of a connection to pass,
even if this is a ACK packet or the like (nmap comes to mind). However,
"--syn" requires the SYN bit to be set and this is only the case for a
NEW connection (see RFC 793 for details).

Briefly, the following rules should get you starting:

iptables -P INPUT DROP
## I don't like - up to you.
iptables -P OUTPUT DROP
## You want this :)
iptables -P FORWARD DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED \
   -j ACCEPT
iptables -A INPUT -p tcp --dport 80 --syn -j ACCEPT

iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED \
   -j ACCEPT

Be aware, that this only permits HTTP. If e.g. your web server likes to
lookup the hostnames of each connection, you must permit outgoing DNS
(and the reverse path) too, and so on. If I may express a wish, please
make sure that ICMP 3 and 11 can pass in both directions. Thanks in
advance :)

Have a nice time,

Joerg


