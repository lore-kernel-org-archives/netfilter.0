From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset question
Date: Tue, 14 Dec 2004 00:29:34 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0412140005440.20115@blackhole.kfki.hu>
References: <1102718857.3550.27.camel@hammer.internal.platinumtel.com> 
	<Pine.LNX.4.58.0412111736360.16780@blackhole.kfki.hu>
	<1102977731.3550.47.camel@hammer.internal.platinumtel.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102977731.3550.47.camel@hammer.internal.platinumtel.com>
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
To: Brett Oster <boster@loadsys.com>
Cc: netfilter list <netfilter@lists.netfilter.org>

On Mon, 13 Dec 2004, Brett Oster wrote:

> > > I'm looking for a way to make my iptables rules more manageable, and so
> > > I am attempting to use ipset.  However, I am not sure if it does what I
> > > am trying to do.   I have many subnets that need to be SNATed
> > > differently depending upon their destination.  As a test, I made two
> > > iphash sets and loaded in one of my sets of sources and one set of
> > > destinations.  However, when I try to apply the iptables rule, I get the
> > > error:
> > >
> > > iptables v1.3.0: Unknown arg `destination'
> > >
> > > I am running 2.6.9 with the most current iptables, pom, and ipset from
> > > Jozsef Kadlecsik's website
> > > (http://people.netfilter.org/kadlec/ipset/install.html)
> >
> > You are using the old ipset binary. From the URL above you can donwnload
> > ipset 2.0. Do you have two binaries installed at different locations
> > and the old one is found according to your PATH settings?
>
> I have ipset 2.0, I compiled it when I compiled the new iptables and
> kernel, and I have no old binary on that system.  As far as I can tell,
> ipset is working ok.  I think my problem is that I am not sure how to
> correctly phrase the iptables line.  I tried a few variations on this:
> "iptables -t nat -A POSTROUTING -m set --set sources src -m set --set
> destination dst -j SNAT --to-source <IP ADDRESS>", however, I've not
> gotten it correct yet.  Please let me know if what I'm trying to do is
> possible, and if it is, how to properly phrase it.

It seems a mug of tee was missing from my engine and thus I
misread your mail, sorry.

You cannot accomplis what you want with the way you tried, because
iptables does not support to specify the same type of match two times. In
another words you can list as many different matches as you want in an
iptables command, but you cannot specify the same type of match two or
more times.

Depending on exactly what you want, bindings of set elements to other sets
may help you. Bindings form an AND relation expressing in the terms of
matches. So if you can express your src AND dst condition generally as

   sources set
    src1       AND destination1 set (dst11, dst12, ...)
    src2       AND destination2 set (dst21, dst22, ...)
    ...

then create the sets, bind the elements of sources set to the proper
destination sets and use the iptables command

iptables -t nat -A POSTROUTING -m set --set sources src,dst \
	-j SNAT --to-source <IP ADDRESS>

The set match (and SET target) follows the bindings all along the way up
to the built in limit. (If any src in the sources set may match with any
dst from the destinations set, then specify the destination set as the
default binding of the sources set.)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

