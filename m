From: Shawn <core@enodev.com>
Subject: Re: DNAT based on domain name instead of IP address
Date: Wed, 28 Jan 2004 18:02:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075334545.11612.27.camel@localhost>
References: <1075332153.25415.98.camel@child-of-god.holiness.ch>
	 <87llnr1vqq.fsf@loki.odinnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87llnr1vqq.fsf@loki.odinnet>
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
To: Erik Bourget <erik@midmaine.com>
Cc: Glen Lee Edwards <glen@holiness.ch>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Yeah, only he does not have any "one true apache" server answering. I
thnik that is, however, what he /should/ do.

On Wed, 2004-01-28 at 17:47, Erik Bourget wrote:
> Glen Lee Edwards <glen@holiness.ch> writes:
> 
> > I have several domains that use the same IP address.  Can I DNAT them to
> > different servers based on domain name instead of IP address using
> > iptables?  I've tried the following, but it isn't working:
> >
> > iptables -t nat -A PREROUTING -p tcp -d 1st.domain.com --dport 80 -j
> > DNAT --to-destination 192.168.1.12:80
> >
> > iptables -t nat -A PREROUTING -p tcp -d 2nd.domain.com --dport 80 -j
> > DNAT --to-destination 192.168.1.13:80
> >
> > Everything is being forwarded to 192.168.1.12 no matter which domain is
> > used.  It appears that the domains are first being translated into the
> > IP address, which is used instead.
> 
> TCP packets know nothing of DNS ... an application will 1) look up the name at
> a DNS server, 2) retrieve the IP from the DNS server, and 3) connect to the IP
> address.
> 
> Apache can do virtual domains ... HTTP 1.1 requires that you specify the
> domain name.
> 
> - Erik
> 
> 

