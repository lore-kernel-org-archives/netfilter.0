From: William Fitzgerald <wfitzgerald@tssg.org>
Subject: Query: TCP Flag Semantics post 3-way-handshake?
Date: Wed, 21 Oct 2009 10:17:00 +0100
Message-ID: <4ADED18C.6010309@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Dear Experts,

My query is how to interpret TCP flag semantics.

Consider that you have a web server and you want to permit access to 
it.  And lets assume that there are no other communications or rules for 
other servers. From a security point of view, a web server should not be 
initiating a connection (syn flag) and clients should be.

 From what I was reading on the web I could write the following rules:
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -j ACCEPT
iptables -A FORWARD -o eth1 -m tcp --sport 80 --tcp-flags ACK -j ACCEPT

My question is what happens after the 3-way-handshake?

Would these rules enable continued traffic communication?

I realise that if I wrote the rules in the following format, there would 
be no issue, as the filter does not care about the flags.
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -m tcp --dport 80  -j ACCEPT
iptables -A FORWARD -o eth1 -m tcp --sport 80 -j ACCEPT

Similarly if I chose the *stateful* method I could right the rules as:
iptables -P FORWARD DROP
iptables -A FORWARD -i eth0 -m tcp --dport 80 -m state --state 
NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -o eth1 -m tcp --sport 80 -m state --state 
ESTABLISHED -j ACCEPT

In those stateful rules, TCP flags are handled implicitly and 
automatically making life easier ;-)

However, lets suppose I want to write *stateless* rules that include TCP 
flags like above. As I read books like that of Cheswick, I see 
references to packet filters in the early years and given that 
Netfilter, while is stateful, can perform in a stateless manner, I would 
like to know more about what it means for packet filtering using 
additional options such as TCP flags and how it impacts on the semantics 
of a configuration.

Perhaps the rules with the SYN and ACK flags set as shown at the top of 
this email can handle connections after the initial TCP handshake.
Does the rule:
iptables -A FORWARD -i eth0 -m tcp --dport 80 --tcp-flags SYN -j ACCEPT
state  incoming traffic that has at least one flag set to SYN 
(regardless of any other inapropriate flags being simultaneously set) 
must be allowed?

If that is the case, then I presume that adding flags in this way 
handles both TCP initial handshake connection and ongoing established 
connections. Of course if this is true, then I would need to put a 
number of rules before this rule to catch malformed TCP flag packets 
(nmap scans), for example iptables -A TCP_FLAGS -p tcp --tcp-flags 
SYN,RST SYN,RST -j DROP.

However, it the above *stateless* TCP flag rules do not handle traffic 
after the TCP handshake, then what rules need to come before or after 
the rules defined at the top of this email?

kind regards,
Will.



