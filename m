From: William Fitzgerald <wfitzgerald@tssg.org>
Subject: Query: Stateful parameters Explicitly and Implicitly defined, which
 is it?
Date: Tue, 20 Oct 2009 22:07:21 +0100
Message-ID: <4ADE2689.4070707@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Dear experts,

If a rule has a state of NEW does it implicitly imply ESTABLISHED also?

Looking at examples on the web I see references to both.

For example to permit access to an internal Web server, which of the 
straw-man rules are correct?

Implicit Established Example:
iptables -a FORWARD -i eth0 --dport 80 -m state --state NEW -j ACCEPT

Explicit Established Example:
iptables -a FORWARD -i eth0 --dport 80 -m state --state NEW,ESTABLISHED 
-j ACCEPT


Similarly, I see reference to setting TCP flags as a control measure. 
Particularly for port scanning etc. However sticking with the  Web 
server example, an internal Web Server should expect a client to 
initiate a connection (SYN flag) but the server itself should not do this.

example strawman-rules of the stateless kind:
iptables -a FORWARD -i eth0 --dport 80 --tcp-flags SYN -j ACCEPT

iptables -a FORWARD -o eth1 --sport 80 --tcp-flags ACK -j ACCEPT

The thing is, what happens after the 3-way handshake? Incoming http 
requests will no longer have a SYN flag set! So is there some implicit 
knowledge that netfilter or other packet filters operate over?

regards,
Will.
