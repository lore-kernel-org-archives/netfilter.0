From: Miguel Manso <mmanso@yahoo.com>
Subject: Re: Linux routing scenario - is this possible?
Date: Sun, 16 Mar 2003 16:29:39 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030317002939.53637.qmail@web11505.mail.yahoo.com>
References: <200303161700.32017.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303161700.32017.netfilter@newkirk.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@newkirk.us, netfilter@lists.netfilter.org

Hi there,

First of all, thanks for the answer.

--- Joel Newkirk <netfilter@newkirk.us> wrote:
> If your routing is already set up properly, then all that should be 
> necessary is to have both IPs on the external interface, and DNAT.
>
> iptables -t nat -A PREROUTING -i eth1 -d 123.123.123.100 -j   \
> DNAT --to a.b.c.d
> iptables -t nat -A PREROUTING -i eth1 -d 123.123.123.101 -j   \
> DNAT --to e.f.g.h
> 
> where a.b.c.d is the IP within one company's network to which you want to 
> forward incoming connections, and e.f.g.h is for the other company.  You 
> can further refine this by having separate DNAT rules for different 
> protocols if needed, to send HTTP to a web server, SMTP/POP3/IMAP to a 
> mail server, etc.

Supposing I've the routing well configured, this seams ok for incomming
traffic. Read below for some doubts I've about traffic leaving both companies
networks.

> Interface eth1 (ppp0, whatever) should have two IPs, the public IP's of 
> each of the companies.  eth0 should have a private IP that is in the 
> private IP block used by the company on eth0, and be reachable by all 
> clients in that network.  The same applies to eth2.

The private IP I must assign to eth0 and eth2 (I was thinking about
192.168.1.254 and 192.168.2.254) will be used like gateways in both comapnies,
no? If so, how do I say on the linux machine (router) that connections from
192.168.1.254 should leave with IP 123.123.123.100 and connections from
192.168.2.254 with IP 123.123.123.101?

Don't know if I'm expressing myself correctly.

> The only thing to be careful of is that the two companies use distinct
> subnets.  You don't 
> want one using 192.168.0.0/20 and the other 192.168.1.0/24, for example, 
> since the latter is contained in the former.  This would cause a 
> connection sent to 192.168.1.1, for example, to be ambiguous. (it could 
> mean either company)

I was thinking about 192.168.1.0/24 for one and 192.168.2.0/24 for the other.

> I notice you use 192.168.0.5 for the DSL connection.  Is that accurate?  
> If so, you may already have NAT taking place upstream, either in a 
> cable/dsl router, or at your gateway at the ISP, and you need to ensure 
> that the packets reaching you still have those public IP's as their 
> destination.  Make sure your box is reachable at each of the public IPs.  
> If so, then two PREROUTING rules, one for each publicIP/Company are the 
> minimum needed to make this work.

Well, the modem IP is 192.168.0.1 (can be configured on the modem via a http
interface) and I've just assigned on the linux box (acting as a router) the
192.168.0.5 IP to the ethernet where I connect the modem to. On this machine
I've defined the modem IP 192.168.0.1 as being the gateway.

> Also, be aware that if you redirect all incoming 123.123.123.100 to one 
> company, and all 123.123.123.101 to the other, that leaves nothing 
> incoming to you.  If you have any need for NEW connections initiated on 
> the internet to reach your own machine/network, then you either need a 
> third public IP, or you'll need to work a lot harder with the DNAT to 
> separate traffic to custom ports or some such that willl be considered 
> addressed to you instead of the company whose IP you piggyback on.
 
Yes, but that's not a problem since one of the companies is my own. We've one
1024 kbits DSL line and we're trying to "split" the costs between our and other
companies.

Any information about the subject will be appreciated. I'm a newbie on the
subject needing some direction points.

Thanks again.



=====
Miguel Manso
mmanso@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Web Hosting - establish your business online
http://webhosting.yahoo.com

