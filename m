From: "Carlos Fernandez Sanz" <cfs-netfilter@nisupu.com>
Subject: Re: Routing problem
Date: Fri, 13 Feb 2004 17:30:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003301c3f24e$a8683b80$1530a8c0@HUSH>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH> <200402131550.25323.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter <netfilter@lists.netfilter.org>

> >
> > Before you ask: I can't connect this special computer to the same place
I
> > connect the linux box (which would be the obvious solution) because the
> > carrier expects traffic to come from one WAN IP, owned by the linux box.
>
> How do they expect you to use any of the other IPs in the pool they have
given
> you?

I do use them by redirecting traffic from the linux box to the destination
boxes (such as all trafic for public IP 2 goes to 192.168.21.2, for
example). This works fine, *except* in this particular case, where any
NATing is not an option. I need the computer behind the linux box to
actually own the public address, because it signs packets with it.


