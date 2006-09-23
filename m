From: David Sims <dpsims@dpsims.com>
Subject: Re: Netfilter rules for multiple ISP traffic
Date: Sat, 23 Sep 2006 13:51:39 -0500 (CDT)
Message-ID: <Pine.LNX.4.58.0609231348180.25659@linux.dpsims.com>
References: <1158906266.4513819a08931@mail.dreamtoy.net>
	<fc38b710609220054s29bad9f9sbd3794e5a9a7e2e7@mail.gmail.com>
	<1159037061.45158085f0fea@mail.dreamtoy.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1159037061.45158085f0fea@mail.dreamtoy.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan <lists@netdigix.com>
Cc: netfilter@lists.netfilter.org

Hi,

Policy Routing Using Linux, Matthew G. Marsh, ISBN 0-672-32052-5
describes in detail how to pass traffic across multiple ISPs as well as
many other interesting subjects..... Online edition is here:
http://www.policyrouting.org/PolicyRoutingBook/ONLINE/TOC.html

Dave
***********************************************************************
On Sat, 23 Sep 2006, Nathan wrote:

> is there any way to do it without having to patch the kernel?
>
> what about with ip rules?
>
>
>
> thanks alot,
> -Nathan
>
>
>
> Quoting Dave Strydom <strydom.dave@gmail.com>:
>
> > download the patch-o-matic-ng for iptables and use the ROUTE patch.
> >
> > http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-ROUTE
> >
> > you can then do rules like this:
> >
> > iptables -A POSTROUTING -t mangle -p TCP -s 172.16.0.1 -j ROUTE --gw 1.1.1.1
> > iptables -A POSTROUTING -t mangle -p TCP -s 172.16.0.2 -j ROUTE --gw 2.2.2.2
> >
> > Regards
> > Dave
> >
> > On 9/22/06, Nathan <lists@netdigix.com> wrote:
> > > Hi We have 2 ISP providers each have given us static ip addresses.  On both
> > ISP
> > > we run a web server (we should say isp1 is 1.1.1.1 eth1 and isp2 is
> > 2.2.2.2
> > > eth2).  Our problem is that right now we have NAT running that nat 1.1.1.1
> > to
> > > the internal server of 172.16.0.1 and then 2.2.2.2 nat to 172.16.0.2 (which
> > is
> > > the same server and ip2 is second ip on the same interface eth0).  When
> > traffic
> > > traverses the firewall to the server and then comes back out the traffic
> > will
> > > always want to use the default gateway which resides on eth1 even though
> > the
> > > traffic initiated from eth2.
> > >
> > > what we want is that if traffic comes in 2.2.2.2 to go to 172.16.0.2 then
> > the
> > > linux firewall/router will send the traffic back out the same interface
> > that
> > > the traffic initiated from.  We think it can be done with ip rules or with
> > > CONFIG_IP_NF_CONNTRACK_MARK .  If anyone has some examples, ideas or can
> > help
> > > us with this configuration that would be greatly appreciated.
> > >
> > >
> > >
> > > Thanks alot!!
> > > - Nathan
> > >
> > >
> > >
> > >
> >

