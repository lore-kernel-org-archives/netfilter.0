From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 10:08:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204161001040.20321@blackhole.kfki.hu>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com> <4F8B90C4.3070600@wildgooses.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F8B90C4.3070600@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed W <lists@wildgooses.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, 16 Apr 2012, Ed W wrote:

> On 16/04/2012 02:15, Ed W wrote:
> > On 16/04/2012 00:26, Ed W wrote:
> > > In particular if I lock down iptables (-P DROP), then the above command
> > > takes quite some seconds to complete, rather than instantly if I open up
> > > iptables.  This is causing me some problems with startup scripts
> > > 
> > > Am I missing some configuration option? Is this a bug? Why is a reverse
> > > DNS lookup needed?
> > 
> > eg
> > 
> > $ iptables -I INPUT -j REJECT
> > $ time ipset create cp2 bitmap:ip,mac range 192.168.1.1/24
> > ipset v6.9.1: Set cannot be created: set with the same name already exists
> > Command exited with non-zero status 1
> > real    0m 45.11s
> > user    0m 0.01s
> > sys     0m 0.00s
> 
> I upgraded to ipset 6.11 and note the same issue.  I also just discovered I
> can repro this when adding to a set, eg:
> 
> $ time /usr/sbin/ipset -! -q add cp2 192.168.105.56,58:b0:35:78:0d:f5
> Command exited with non-zero status 1
> real    1m 0.09s
> user    0m 0.00s
> sys    0m 0.01s 
> 
> In this case I have multiple internet connections. Pushing IPs into an ipset
> forces that ip over a particular connection.  If the box is currently on some
> non responsive network, then the resolver isn't working correctly and ipset is
> consequently also slow.

Hostname and IP address are both supported as input and resolved 
internally by getaddrinfo. That can generate DNS lookups, depeding on the 
resolver library. What kind of system do you use, with which 
resolver/libc version?

I could suppress DNS lookups with the price of calling twice getaddrinfo.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
