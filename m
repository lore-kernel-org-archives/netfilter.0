From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Redhat 8.0 with Iptables and Cisco 2514
Date: Wed, 8 Jan 2003 03:31:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301080331.33543.netfilter@newkirk.us>
References: <se1b0154.064@butchers.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se1b0154.064@butchers.com>
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
To: JUSTIN GERRY <JGERRY@butchers.com>, netfilter@lists.netfilter.org

On Tuesday 07 January 2003 04:32 pm, JUSTIN GERRY wrote:
> Trying to figure out why, when I enable the firewall on my cisco
> (which is a state checking firewall) and I have my iptables (also
> state checking) firewall enabled on my redhat box I can not establish
> a connection with with my website (either website one as I have two
> interfaces and I am using apache to host both)
>
> It almost seems as if the cisco is destroying the incoming connection
> (probably the outgoing response because I can see people connecting to
> my box) before my box has a chance to send out a response.
>
> If I run no firewall on my redhat box and leave the firewall up on my
> cisco then you can access my website normally.

What about the reverse?  If the cisco's firewalling is disabled, but=20
iptables in use, can you connect?

> If anyone has had this problem please let me know.
>
> FYI, my simple firewall test:
>
> F1=3D"eth0"
> IF2=3D"eth1"
> IP2=3D"xxx" #(real ip address hidden)
> IP1=3D"xxx" #(real ip address hidden)
> UNPRIVPORTS=3D"1024:65535"
>
> iptables -F
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP
>
> iptables -A INPUT -p tcp --sport $UNPRIVPORTS \
> --dport 80 -m state --state NEW -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

If the answer above is "it works", then what if you loosen the NEW rule=20
in INPUT?  Try:

iptables -A INPUT -p tcp --dport 80 -j ACCEPT

with the cisco's firewall enabled.  If this fails, I suspect the cisco's=20
configuration is blocking outbound replies, so you'd have to dig there.=20
A quick test with logging in INPUT and OUTPUT chains would tell you if=20
the request is actually reaching your machine, and being responded to=20
properly.  Just add a log rule at the start and the end of each of those=20
two chains, with distinct '--log-prefix' strings, and make sure you log=20
from the first and ONLY the first one in each chain.  The first log=20
tells you it hits the chain, the second that it hits the DROP policy.

j

> Many thanks,
> Justin


