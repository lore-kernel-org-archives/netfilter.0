From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: are these enough now?
Date: Sat, 5 Oct 2002 14:05:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210051305.g95D5SL12020@vulcan.rissington.net>
References: <200210041218.26636@.> <20021004191400.YGEY459.mta02-svc.ntlworld.com@there> <200210051707.52456@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210051707.52456@.>
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

On Saturday 05 October 2002 12:39 pm, PayalR wrote:

> 1. I could not ping to any ip/domain name.
> I got an error that ping: operation not permitted, even though I had not
> specifically told it to drop ICMP.

Yes you have.   You have a default DROP policy on your output chain, and you 
have no rule saying "allow out new icmp packets".

If you want to be able to send pings from this machine you must add something 
like:

iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

The replies will be allowed back in by the ESTABLISHED,RELATED rule in your 
INPUT chain.

> 2. I could not resolve host names, even though I had rules for port 53 like
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 53 -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --dport 953 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 953 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp --dport 53 -j ACCEPT

These rules are INPUT with a *destination* port of 53 - that is for *your* 
machine acting as a DNS server - this may be the case, I don't know, but it 
has nothing to do with your machine being able to access another DNS server.

> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -i eth0 -p tcp --sport 53 -j ACCEPT
> iptables -A OUTPUT -i eth0 -p udp --sport 53 -j ACCEPT

No, the OUTPUT rules should specify a destination port of 53, because you are 
trying to contact another DNS server which is listening on port 53.

> iptables -A OUTPUT-i eth0 -p tcp --dport 953 -j ACCEPT
> iptables -A OUTPUT-i eth0 -p udp --dport 953 -j ACCEPT

I don't know what these are for.

> I am using BIND 9.1.3
>
> 3. If I give a OUTPUT rule for e.g.,
> iptables -A OUTPUT -i eth0 -p tcp --sport 21 -j ACCEPT
> I get an error saying I cannot specify -i eth0. It works properly when
> I remove -i eth0. Is it OK?

What is an input interface supposed to mean for a rule in the OUTPUT chain ?

Rules in the OUTPUT chain apply only to locally-generated packets.   There is 
no input interface, because they didn't come in to the machine.


Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

