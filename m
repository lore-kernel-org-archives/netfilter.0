From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Linux routing scenario - is this possible?
Date: Sun, 16 Mar 2003 17:00:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303161700.32017.netfilter@newkirk.us>
References: <20030316212526.49666.qmail@web11504.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030316212526.49666.qmail@web11504.mail.yahoo.com>
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
To: Miguel Manso <mmanso@yahoo.com>, netfilter@lists.netfilter.org

On Sunday 16 March 2003 04:25 pm, Miguel Manso wrote:
> Hi there,
>
> I'm having a problem with linux routing and maybe
> someone on the list could help me out or point me to
> the right direction.
>
> I've subscribed an DSL line (1024 kbit) that included
> 2 static IPs (123.123.123.100 and 123.123.123.101).
>
> My goal is to share the line with two companies that
> will have two totaly separed networks.
>
> I've a linux machine with 3 eth's with the following
> configuration:
>
> eth0   -> 123.123.123.100  Company 1 static IP
> eth0:1 -> 196.168.1.254    Company 1 gateway
>
> eth1   -> 196.168.0.5      DSL line is connected here
>
> eth2   -> 123.123.123.101  Company 2 static IP
> eth2:1 -> 196.168.2.254    Company 2 gateway
>
> The gateway of the router is 192.168.0.1 (DSL modem
> IP).
>
> The main idea here is having two companies on two
> different networks: 192.168.1 and 192.168.2.
>
> What I'd like to achive is:
>
> - external connections to 123.123.123.100 should go to
> the eth0 and external connections to 123.123.123.101
> should go to the eth2;
> - people from 192.168.1 network should connect the
> outside world with IP 123.123.123.100 and people from
> the 192.168.2 network should use the 123.123.123.101
> IP.
>
> Ok, this is my main goal. Am I wrong in any concept?
> Is this possible?

If your routing is already set up properly, then all that should be=20
necessary is to have both IPs on the external interface, and DNAT.

iptables -t nat -A PREROUTING -i eth1 -d 123.123.123.100 -j   \
DNAT --to a.b.c.d
iptables -t nat -A PREROUTING -i eth1 -d 123.123.123.101 -j   \
DNAT --to e.f.g.h

where a.b.c.d is the IP within one company's network to which you want to=
=20
forward incoming connections, and e.f.g.h is for the other company.  You=20
can further refine this by having separate DNAT rules for different=20
protocols if needed, to send HTTP to a web server, SMTP/POP3/IMAP to a=20
mail server, etc.

Interface eth1 (ppp0, whatever) should have two IPs, the public IP's of=20
each of the companies.  eth0 should have a private IP that is in the=20
private IP block used by the company on eth0, and be reachable by all=20
clients in that network.  The same applies to eth2.  The only thing to=20
be careful of is that the two companies use distinct subnets.  You don't=20
want one using 192.168.0.0/20 and the other 192.168.1.0/24, for example,=20
since the latter is contained in the former.  This would cause a=20
connection sent to 192.168.1.1, for example, to be ambiguous. (it could=20
mean either company)

I notice you use 192.168.0.5 for the DSL connection.  Is that accurate? =20
If so, you may already have NAT taking place upstream, either in a=20
cable/dsl router, or at your gateway at the ISP, and you need to ensure=20
that the packets reaching you still have those public IP's as their=20
destination.  Make sure your box is reachable at each of the public IPs. =
=20
If so, then two PREROUTING rules, one for each publicIP/Company are the=20
minimum needed to make this work.

Also, be aware that if you redirect all incoming 123.123.123.100 to one=20
company, and all 123.123.123.101 to the other, that leaves nothing=20
incoming to you.  If you have any need for NEW connections initiated on=20
the internet to reach your own machine/network, then you either need a=20
third public IP, or you'll need to work a lot harder with the DNAT to=20
separate traffic to custom ports or some such that willl be considered=20
addressed to you instead of the company whose IP you piggyback on.

j


