From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question on PREROUTING and INPUT chains
Date: Sat, 9 Nov 2002 13:07:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021109130720.HYMA20191.mta03-svc.ntlworld.com@there>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Monday 04 November 2002 8:46 pm, Carlos Fa=C4=BFanha wrote:

> I have a Linux box used as NAT server and firewall. All
> requests on its port 80 are forwarded to a local webserver
> inside my network. I want to block access to all services
> including http from a specific external host.
>
> I'm using the following rule to block the host
>
> iptables -A INPUT -i $extint -s $hostip -j DROP
>
> and this one to do the NAT
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -d $extip -j
> DNAT --to $webserverip:80
>
> The problem is that the host is blocked from accessing all
> services but http. I've already checked if there are any
> rules before that ACCEPT the request. It seems that prerouted
> packets are bypassing the INPUT chain.
>
> Is it correct? If not, what am I doing wrong?

It is correct that routed packets bypass the INPUT chain.   Only packets=20
destined for the firewall machien go through INPUT - packets which are goin=
g=20
somewhere else go through FORWARD.

Therefore put your blocking rule in the FORWARD chain instead and it should=
=20
do what you want.

Antony.

--=20

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

