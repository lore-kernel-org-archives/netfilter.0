From: William Fitzgerald <wfitzgerald@tssg.org>
Subject: Re: Query: TCP Flag Semantics post 3-way-handshake?
Date: Wed, 21 Oct 2009 11:44:10 +0100
Message-ID: <4ADEE5FA.2050202@tssg.org>
References: <4ADED18C.6010309@tssg.org> <4ADED402.5090608@tssg.org> <4ADEDA6E.8080202@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ADEDA6E.8080202@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> netfilter-owner@vger.kernel.org wrote:
>> William Fitzgerald wrote:
>>> Dear Experts,
>>>
>>> My query is how to interpret TCP flag semantics.
>>>
>>> Consider that you have a web server and you want to permit access to 
>>> it.  And lets assume that there are no other communications or rules 
>>> for other servers. From a security point of view, a web server 
>>> should not be initiating a connection (syn flag) and clients should be.
>>>
>>> From what I was reading on the web I could write the following rules:
>>> iptables -P FORWARD DROP
>>> iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -j ACCEPT
>>> iptables -A FORWARD -o eth1 -m tcp --sport 80 --tcp-flags ACK -j ACCEPT
>>>
>>> My question is what happens after the 3-way-handshake?
>>>
>>> Would these rules enable continued traffic communication?
>>>
>>> I realise that if I wrote the rules in the following format, there 
>>> would be no issue, as the filter does not care about the flags.
>>> iptables -P FORWARD DROP
>>> iptables -A FORWARD -i eth0 -m tcp --dport 80  -j ACCEPT
>>> iptables -A FORWARD -o eth1 -m tcp --sport 80 -j ACCEPT
>>>
>>> Similarly if I chose the *stateful* method I could right the rules as:
>>> iptables -P FORWARD DROP
>>> iptables -A FORWARD -i eth0 -m tcp --dport 80 -m state --state 
>>> NEW,ESTABLISHED -j ACCEPT
>>> iptables -A FORWARD -o eth1 -m tcp --sport 80 -m state --state 
>>> ESTABLISHED -j ACCEPT
>>>
>>> In those stateful rules, TCP flags are handled implicitly and 
>>> automatically making life easier ;-)
>>>
>>> However, lets suppose I want to write *stateless* rules that include 
>>> TCP flags like above. As I read books like that of Cheswick, I see 
>>> references to packet filters in the early years and given that 
>>> Netfilter, while is stateful, can perform in a stateless manner, I 
>>> would like to know more about what it means for packet filtering 
>>> using additional options such as TCP flags and how it impacts on the 
>>> semantics of a configuration.
>>>
>>> Perhaps the rules with the SYN and ACK flags set as shown at the top 
>>> of this email can handle connections after the initial TCP handshake.
>>> Does the rule:
>>> iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -j ACCEPT
>>> state  incoming traffic that has at least one flag set to SYN 
>>> (regardless of any other inapropriate flags being simultaneously 
>>> set) must be allowed?
>>>
>> Actually the more I think about that last statement, the more I 
>> realise this can't be how it works. In that once a connection has 
>> been established, incoming packets will no longer have the SYN flag 
>> set and so packets will be dropped. Since bidirectional communication 
>> fails, access to the web server fails. So I guess the final question 
>> below still stands: "If the above *stateless* TCP flag rules do not 
>> handle traffic after the TCP handshake, then what rules need to come 
>> before or after the rules defined at the top of this email?"
>>> If that is the case, then I presume that adding flags in this way 
>>> handles both TCP initial handshake connection and ongoing 
>>> established connections. Of course if this is true, then I would 
>>> need to put a number of rules before this rule to catch malformed 
>>> TCP flag packets (nmap scans), for example iptables -A TCP_FLAGS -p 
>>> tcp --tcp-flags SYN,RST SYN,RST -j DROP.
>>>
>>> However, if the above *stateless* TCP flag rules do not handle 
>>> traffic after the TCP handshake, then what rules need to come before 
>>> or after the rules defined at the top of this email?
>>>
>>> kind regards,
>>> Will.
>
> Hello,
>
> IMHO you should forget thinking about creating a stateless firewall to 
> protect your webserver.
Thanks once again Mart.

I agree. However, I am curious to know how this can be achieved using 
only *stateless* rules.
 From various resources (books, web etc) packet filters are susceptible 
for example to forged TCP header attributes.

An attacker can forge a TCP header that will bypass stateless rules. 
Consider an attacker sending a forged packet, to scan a network, that 
mimics the expected return packets for outbound http traffic requests. 
However, the same attack against a *stateful* firewall will fail because 
it will consult both its rules and the current state table. For example 
"is there an entry in the state table for an existing outbound http 
request, sourced on some internal LAN IP with source port >1024, bound 
for destination port 80 over TCP on host hacker IP? No, so drop packet!"

So, I agree entirely that stateful firewalling is essential.

However, this has made me think a little more about stateless packet 
filters and how they operated in the past. Again from various resources, 
(rules often represented in table format to be vendor neutral), you see 
situations where SYN and ACK flags are used. For example, to stop an 
attacker making connections to internal systems a rule would state that 
inbound packets should only be responses and so only the ACK flag should 
be set. Makes perfect sense. Yes, it prevents a full connection but will 
not prevent a TCP-ACK scan as mentioned above, but never the less the 
firewall is doing what it can!

The trouble I have, is understanding what happens after I introduce 
these (protection) rules? How are established TCP connections handled 
after the 3-way-handshake. How did the stateless packet filters control 
who could send a syn flag for  example while at the same time allow 
ongoing traffic? There will no longer be a Syn flag for example. 
Presumably there are ongoing ACK packets that simultaneously include PSH 
flags when delivering data. Typically books discussing TCP only ever 
detail the TCP-handshake and don't mention what flags are set after the 
connection.

In the book by the highly esteemed William Cheswick: "Firewalls and 
Internet Security," he states that when an ACK is seen in a rule it is 
interpreted as "return ACK packets are OK nothing else is OK".

So perhaps I was correct in my original email when I said, incoming 
traffic that has at least one particular flag  (regardless of any other 
inappropriate flags being simultaneously set) must be allowed?

Therefore would the correct stateless rules be:
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -j ACCEPT 
# allow outside to initiate web server connection.
iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags ACK -j ACCEPT 
# allow ongoing communication after 3-way-handshake.
iptables -A FORWARD -o eth1 -m tcp --sport 80 --tcp-flags ACK -j ACCEPT 
# allow ACK in 3-way-handshake and ongoing communication.
iptables -A FORWARD -o eth1 -m tcp --sport 80 --tcp-flags SYN -j DROP # 
redundant to default policy. disallow server to initiate communication.

During ongoing communication there might be other flags like PSH etc but 
so long as we have the ACK flag set we are happy to believe that packets 
have correct simultaneous flags set. Of course we need a set of 
preceding rules to filter malformed TCP flag packets as part and parcel 
of security in depth.

Comments to my understanding of how it works?

> As you talked about magic before, the magic of conntrack is, that it 
> does monitor the traffic and therefore already does more than you can 
> ever do with tcp flag rules.
> I'll try to give you a short example how it could be done (of course 
> there might be other ways):
>
> webserver=10.1.1.10
> ext_if=eth0
> dmz_if=eth1
>
> iptables -N web_server
>
> iptables -A web_server -d $webserver -p tcp --dport 80 -m state 
> --state NEW,ESTABLISHED -j ACCEPT
> iptables -A web_server -s $webserver -p tcp --sport 80 -m state 
> --state ESTABLISHED -j ACCEPT # a global rule might do that - your choice
> iptables -A web_server -j DROP # policy might do that - your choice
> iptables -A FORWARD -i $ext_if -d $webserver -j web_server
> iptables -A FORWARD -i $dmz_if -s $webserver -j web_server
>
> Don't forget to allow only valid tcp connections (referring to our 
> previous mails) before.
In relation to the extra "checks and balances", thanks for consolidating 
that for me.
>
> Regards
>
> Mart
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

