From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: Question on PREROUTING and INPUT chains
Date: Sat, 9 Nov 2002 07:32:41 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211090730120.15561-100000@dell>
References: <H52KD3$II79GwJU6pjw8ZNZc1oYk1taD6_z_kdUix49OEr@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <H52KD3$II79GwJU6pjw8ZNZc1oYk1taD6_z_kdUix49OEr@uol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Mon, 4 Nov 2002, Carlos Fa=C4=BFanha wrote:

> I have a Linux box used as NAT server and firewall. All =

> requests on its port 80 are forwarded to a local webserver =

> inside my network. I want to block access to all services =

> including http from a specific external host.
> =

> I'm using the following rule to block the host
> =

> iptables -A INPUT -i $extint -s $hostip -j DROP
> =

> and this one to do the NAT
> =

> iptables -t nat -A PREROUTING -p tcp --dport 80 -d $extip -j =

> DNAT --to $webserverip:80
> =

> The problem is that the host is blocked from accessing all =

> services but http. I've already checked if there are any =

> rules before that ACCEPT the request. It seems that prerouted =

> packets are bypassing the INPUT chain.

as i read it, filtering on INPUT is only going to be effective
for those packets that are destined for the local host itself.
setting up nat PREROUTING sends those incoming packets, not to
filter/INPUT, but through the FORWARD chain.

if you want to drop some outside host from getting thru to the
internal webserver, you should add the DROP rule, not to INPUT,
but to FORWARD.

unless, of course, i'm badly mistaken.

rday


