From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: masquerading and access
Date: Wed, 30 Oct 2002 09:24:25 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021030092429.QPCU1554.mta07-svc.ntlworld.com@there>
References: <20021030070200.GA1367@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021030070200.GA1367@localhost.localdomain>
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
To: netfilter@lists.samba.org

On Wednesday 30 October 2002 7:02 am, Payal wrote:

> Hi,
> 	I want to implement a masquerading proxy ( I hope I am clear
> here )

Not quite, no :-)

Masquerading is a technique for forwarding packets *through* a machine which 
has a public IP address, from a bunch of machines with private IP addresses, 
such that the source address on the packets is changed to the public IP, so 
that replies can get back again.

Proxying is the use of a single machine acting as a combined server and 
client to accept requests, decide whether to allow them or not, and then to 
generate new requests which go out to the Internet.   Proxies do not forward 
packets; they generate new ones, with the source address of the proxy machine.

Therefore depending on where you propose to put a proxy server, these two 
might accomplish a similar objective, but they're certainly different as far 
as the flow of packets is concerned (which is where netfilter comes in).

> Squid will be the caching proxy.

Okay, in that case you definitely do mean a proxy, the remaining question is 
whether you also mean masquerading, and the answer to that depends on whether 
the Squid server has a public IP address or a private one.

If Squid has a public IP then you do not need to masquerade as well.

If Squid has a private IP then you do need to masquerade as well.

> I just want to know whether I have to put a rule as,
>
> 1. #iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Are you trying to send packets *through* the box this rule would be running 
on ?

If this *is* the box running Squid, then the answer may be no, although you 
have to think about things other than http here, such as DNS, SMTP, POP3, 
which you may still want to forward directly from internal clients to the 
Internet ?

> Then I redirect all request to port 80 to port 3128 of squid
> Then I make necessary acl changes in squid.conf to allow only
> 192.168.0.1-192.168.0.25.

Those rules sound good.

> And then for ftp I put  iptables ACCEPT rules for these ips in iptables
> ruleset and block rest.
> 				OR
>
> 2. #iptables -t nat -A POSTROUTING -s 192.168.0.1/xx -j MASQUERADE
> Will this rule do? Also what to put in place of xx for allowing
> 192.168.0.1-192.168.0.25.

There is no xx which will do that range for you.

/28 will give you 192.168.0.0-192.168.0.15
/27 will give you 192.168.0.0-192.168.0.31

You can't do anything between those ranges in a single rule.

Do you have other machines in 1928.168.0.0 addresses which you do not want to 
allow access to Squid, or which you do not want to allow access to the 
Internet ?

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

