From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: pop3 and dns
Date: Wed, 5 May 2004 11:24:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051124.17019.Antony@Soft-Solutions.co.uk>
References: <F22386C3FEB012449238672E38ED61E706C2D6@overlord.overturemedia.com>
Reply-To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C2D6@overlord.overturemedia.com>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>

On Wednesday 05 May 2004 5:58 am, Fritz Mesedilla wrote:

> > These look fine as they are, however you will need a rule to
> > allow the reply packets, and perhaps one to SNAT your Internet-bound
> > packets if you are using private addresses on your network.
>
> Oh... How do I do that? Can you give me a sample rule?

Well, your ruleset already contains a rule to allow the reply packets through 
the FORWARD chain (although it is somewhat confusingly listed under the NAT 
section of your rules), so I assume you're asking about SNAT.   Here's an 
example rule to allow clients to access remote POP3 services:

iptables -A POSTROUTING -t nat -p tcp --dport 110 -j SNAT --to w.x.y.z

where w.x.y.z is the external address of the firewall which you would like the 
packets to have when they leave the machine.

By the way, what made you decide to use 192.167.220.x addresses for your 
clients?   That is not a reserved address range, and is part of a block 
registered to the University of Ferrara in Italy.

> > Suggestions:
> > 1. Describe your network setup to us.
> > 2. Show us all your netfilter rules.
>
> We have public ips on the outside while we have private ips on the inside
> doing nat through iptables and not through the router as we do not have
> control of the router.

Other information which would be useful if we need to answer any more 
questions are: what interface names on the firewall connect to the inside and 
outside, and how have you interconnected the two different network ranges you 
appear to be using 192.168.247.x and 192.167.220.x ?

> For web browsing I have squid proxy. So normally, clients do not have to
> resolve domain names as squid proxy does it for them. Now I need to allow
> clients to resolve domain names to be able to retrieve pop3 from their
> other mail servers.

Where is the DNS server which the clients are expected to access for this?   
Are you running one on your network (good idea) or are they supposed to 
access one run by your ISP (works, but will be slower and uses a bit more 
bandwidth)?

Regards,

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


