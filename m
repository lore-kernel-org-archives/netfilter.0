From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Purpose of self-referential rule
Date: Wed, 26 Feb 2003 09:03:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302260903.58241.netfilter@newkirk.us>
References: <20030224160628.GH4316@placemark.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030224160628.GH4316@placemark.com>
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
To: Kelly Setzer <Kelly.Setzer@placemark.com>, netfilter@lists.netfilter.org

On Monday 24 February 2003 11:06 am, Kelly Setzer wrote:
> I've been experimenting with gShield trying to learn the ins and outs
> of iptables.  One of the rules is generates is:
>
> iptables -A INPUT -s 192.168.6.0/24 -d 192.168.6.0/24 -i eth1 -j
> ACCEPT
>
> The source and dest are correct for my internal network, and eth1 is
> the internal net.  My question is, when would the firewall ever see a
> packet that could possible match this?  Any packet with a source and
> destination on the same network would send the packet directly (no
> routing, thus no firewall).
>
> What am I missing?

What's the IP of eth1?  This is the INPUT chain, so it's for traffic=20
targeted at the firewall box itself.  Having a destIP listed with a /24=20
is a little odd, though, unless you are DHCP assigned IP or some such=20
where it won't know the IP when the rule is generated, or it may change.

j

> thanks,
> Kelly


