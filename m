From: <bmcdowell@coxhealthplans.com>
Subject: RE: advantage and disadvantage between iptables and ISAServer?
Date: Wed, 25 Feb 2004 15:29:25 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D73101668EB7@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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


I don't see them as all that comparable, and in fact I use both.  ISA =
makes a great proxy and uses AD permissions (groups, etc) for access =
control.  I see it as Proxy 2.0 Enhanced, rather than a 'firewall'.


Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Maciej
Soltysiak
Sent: Wednesday, February 25, 2004 10:18 AM
To: netfilter@lists.netfilter.org
Subject: Re: advantage and disadvantage between iptables and ISAServer?


> I am not to familure with ISA because the M$ admins here tell me it is =
not
worth
> the enough to test it out. I would assume it is like any other M$ =
product
though
> ... you need double or triple the hardware to run it as compared to
iptables.
Agree, oh, this is true. Currently w2k3 runs very bad on:
p4 1,5ghz, 384MB
with a few of the services setup: AD, WMS, IIS (HTTP+FTP), SUS, SMS.


> You are stuck with the options the M$ provides instead of the endless
> possibilities the a Unix or Linux could offer.
Well, sort of. iptables is very powerfull, but I think that upcomming =
isa
2004
is going to be modular and pluggable too, plus it will certainly address
popular
security issues like: p2p (yes, it is a security issue), worms, network
attacks
that have signatures: slammer, floods, land, dos, etc...
Like checkpoint's SmartDefense.


I have not been using isa, but only read and seen a presentation of isa
2004,
It is possible that is going to be a powerfull tool. No information =
about
stability,
propably it'd depend on which version of windows you are running and how
stable it is. Performance? No idea.

Regards,
Maciej


