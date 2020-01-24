From: Florian Westphal <fw@strlen.de>
Subject: Re: TCP 4 way handshake or TCP Split Handshake Attack
Date: Sat, 25 Jan 2020 00:48:30 +0100
Message-ID: <20200124234830.GZ795@breakpoint.cc>
References: <33c1b81b-cb3d-e277-334f-5a8daaf8dd73@gmail.com>
 <20200124162417.GW795@breakpoint.cc>
 <CAN_K0LR36AZRc55aisesAU0xDrcEgw6e41zwzwHV=zSSOffVAQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAN_K0LR36AZRc55aisesAU0xDrcEgw6e41zwzwHV=zSSOffVAQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fatih USTA <fatihusta86@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Fatih USTA <fatihusta86@gmail.com> wrote:
> On Fri, Jan 24, 2020, 19:24 Florian Westphal <fw@strlen.de> wrote:
> 
> > Fatih USTA <fatihusta86@gmail.com> wrote:
> > > Hello,
> > > I am trying to protect my network from the tcp split handshake attack!
> > > (4-way handshake rejection or 3-way handshake enforcement).
> > > I tested the sample code. (link below) And passed the firewall(iptables).
> >
> > Why wouldn't it?  Its valid tcp, your ruleset allows connections to happen
> > and there is a socket expecting a connection.
> >
> 
> Actually there isn't real open socket(sample code) on the clients. Only
> sending and receiving packet. There is no listen port on the system. (If I
> understand correctly)

Are you referring to the sample code?
I did not look at it before.  The example code illustrates simulatenous
connect.  There are two sockets that connect to one another, crossing
syns.

If some doesn't want this for whatever reason you need to filter/drop pure
syn in reply direction.

This also disables/prevents connection re-use with client/server reversal.

(I.e., a connects to b, a closes, b starts to close, then immediately
 connects to a using exaclty same connection quadruple).

> > > I can't find any solution on the internet for Linux.
> >
> > nft add rule filter forward tcp flags & (syn | ack) == syn ct direction
> > reply counter drop
> >
> Is there iptables sample?

-p tcp --syn -m conntrack --ctdir REPLY -j DROP

or something like that.

> > But why would you want to disallow this behaviour?
>
> There isn't defined port forwarding to clients on the iptables.

That 'port forwarding' is created at the very moment the SYN packet has
passed through snat/masquerade rule.  This is what nf_nat does -- dynamic
port forwarding.  Otherwise, incoming replies would not get passed to
the client that initiated the request, i.e. you would need
manual/stateless snat rule.

> Clients
> sends packets to remote "Real IP" address behind the firewall. I think this
> is security issue.

A asked to connect to B.
At exactly the same time B asked to connect to A.

Both syn packets pass though a NAT gateway.
Both NAT gateways have a matching state with reverse translation info.

The fact that the reply packet has only 'syn bit' set rather
than the normal 'syn/ack' makes no difference, in both cases
packet should have its NAT reversed and passed to the client.

> This issue reported by the nss labs. Global firewall vendors patched their
> software.
> 
> What's your comments for this report?
> 
> https://www.nsslabs.com/press/2011/5/10/network-firewall-vendors-address-tcp-split-handshake-issues-found-by-nss-labs/

I found no technical rationale why there is a problem.

> https://kb.juniper.net/InfoCenter/index?page=content&id=JSA10476&cat=SECURITY_PRODUCTS&actp=LIST

"In reality, in such similar circumstances, NSS test have shown that
some network security devices, with the sole firewall function enabled,
get confused and behaves in a stateless manner."

conntrack doesn't misbehave, connection is tracked normally.

I suspect that this is about some ids/ips or network logging tools that
might not detect connection establishement when reply to syn is another
syn instead of syn/ack.

In any case, I see no wrong/unsafe behaviour from nf_conntrack.
