From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Tightening up outgoing traffic
Date: Tue, 15 Oct 2002 16:22:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210151522.g9FFMWL23883@vulcan.rissington.net>
References: <1034686034.15446.38.camel@localhost.localdomain> <009b01c27457$a7ab66c0$0800000a@wormhole>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009b01c27457$a7ab66c0$0800000a@wormhole>
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
To: netfilter@lists.netfilter.org

On Tuesday 15 October 2002 3:32 pm, Dan Searle wrote:

> > I keep getting "domainname can not be found.  Please check the name and
> > try again" from my browser.  This only happens for new web sites (i.e.,
> > Yahoo works fine).  As this seems somewhat like a DNS issue, I tried
> > adding this:
> >
> > iptables -A OUTPUT -p tcp --destination-port nameserver -j ACCEPT
> >
> > but it didn't work.  Any ideas?  Thanks.
>
> iptables -A OUTPUT -p tcp --dport domain -j ACCEPT
> iptables -A OUTPUT -p udp --dport domain -j ACCEPT
>
> You want to use the service name "domain", not "nameserver",

In my version of /etc/services those are synonymous - 'domain' is the primary 
name of the service, and 'nameserver' is listed as an alias.

> also I think
> domain lookups use the udp protocol also. (Don't quote me on that one :-)

General rule for DNS is:

Client lookup on server uses UDP
Server to server transfers use TCP

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

