From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Forwarding Problems
Date: Thu, 6 Mar 2003 19:17:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2e40c$a9280d30$0401000a@sterenborg.info>
References: <ABEKJILKOKKGGDJKHKDFOEBGCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFOEBGCAAA.patrick@vikus.com>
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
To: 'netfilter EMAIL' <netfilter@lists.netfilter.org>

> accepted. The problem
> is, if I use
> 
> iptables -A FORWARD -j DROP
> or
> iptables -P FORWARD DROP
> 
> they will drop all packets including the ones I already ACCEPTed.

I don't see any rule that makes the filter stateful.
When it's stateful, you don't have to worry about all the returning
packets.
I think that will make it work.

> 
> example (want to allow all incoming and outgoing www traffic):
> iptables -A FORWARD -p tcp -d 192.168.1.0/24 --dport 80 -j ACCEPT
> iptables -A FORWARD -p tcp -d 192.168.1.0/24 --sport 80 -j ACCEPT

Packets sent *to* a webserver will most likely not come *from* port
80/tcp.

> iptables -A FORWARD -p tcp -s 192.168.1.0/24 --dport 80 -j ACCEPT
> iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 80 -j ACCEPT
> iptables -A FORWARD -j DROP

So, making it stateful, it would look like this :

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -p tcp --dport 80 -j ACCEPT


Gr,
Rob


