From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables/ipset caused packet drops on interfaces
Date: Tue, 14 Jul 2009 14:31:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0907141424230.332@blackhole.kfki.hu>
References: <1247562280.5215.97.camel@vects1.nivki.net>  <alpine.DEB.2.00.0907141116030.32574@blackhole.kfki.hu> <1247567215.5215.122.camel@vects1.nivki.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1247567215.5215.122.camel@vects1.nivki.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vects <netfilter@vects.com>
Cc: netfilter@vger.kernel.org

On Tue, 14 Jul 2009, Vects wrote:

> On Tue, 2009-07-14 at 11:19 +0200, Jozsef Kadlecsik wrote:
> > On Tue, 14 Jul 2009, Vects wrote:
> > 
> > > I'm using iptables/ipsets on busy linux firewall, this firewall handles
> > > 300-400 Mb/s during the working hours, time to time I see significant
> > > traffic drop and ksoftirqd/1 uses 100% cpu, in this situation I do
> > > stop/start iptables, after that network traffic and ksoftirqd returned
> > > to be normal.
> > > First I thought this is a problem with network card driver, changing the
> > > driver didn't help, then I found that it depends from the number of
> > > ipsets in iptables. 
> > 
> > How did you verify that? What kind of sets do you use?
>
> I set up similar test environment, generated traffic by iperf, set up
> iptables/ipset rules with all accept, started to get drops, removed few
> rules until it got back to normal. 
> Another day I did the same sort of tests with some commercial traffic
> generator tool and got the same result.
> Mostly I'm using iphash ipsets with few nethash type, the biggest ipset
> has 4000 IPs
[...]
> net.ipv4.netfilter.ip_conntrack_max=14316556

You should tune the hashsize parameter of the nf_conntrack module and not 
the ip_conntrack_max sysctl parameter. Conntrack may spend most of the 
time traversing the long chains in the hashtable.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
