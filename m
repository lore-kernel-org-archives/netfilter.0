From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [libvirt-users] netfilter+libvirt=(smth got broken?)
Date: Tue, 26 Mar 2013 15:18:39 +0100
Message-ID: <20130326141839.GA5706@localhost>
References: <5149AFD3.2070108@yandex.ru>
 <5149BC91.4090502@yandex.ru>
 <20130321023046.GA4189@localhost>
 <514A7BFD.5060401@redhat.com>
 <20130321095542.GA3466@localhost>
 <20130322105351.GA4182@localhost>
 <514C9E99.3050201@laine.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <514C9E99.3050201@laine.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laine Stump <laine@laine.org>
Cc: netfilter@vger.kernel.org, libvirt-users@redhat.com

On Fri, Mar 22, 2013 at 02:10:33PM -0400, Laine Stump wrote:
> On 03/22/2013 06:53 AM, Pablo Neira Ayuso wrote:
> > On Thu, Mar 21, 2013 at 10:55:42AM +0100, Pablo Neira Ayuso wrote:
> >> Hi Eric,
> >>
> >> On Wed, Mar 20, 2013 at 09:18:21PM -0600, Eric Blake wrote:
> >> [...]
> >>>> By looking at the changes you made:
> >>>>
> >>>>> --A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
> >>>>> ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
> >>>>> +-A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
> >>>>> ESTABLISHED -m conntrack --ctdir REPLY -j RETURN
> >>>> The first rule looks wrong to me indeed, traffic coming in the
> >>>> original direction will initiate the connection to destination port
> >>>> TCP/110. Therefore, your change is correct.
> >>> Correct for the new kernel interpretation, but we also want to support
> >>> use of libvirt with older kernels, preferably with a runtime check so
> >>> that a binary compiled on an older kernel will still work after a kernel
> >>> upgrade.
> >> My suggestion is to relax that rule-set that you're using, ie. remove
> >> the --ctdir. The connection tracking table and the TCP tracker already
> >> take care for those invalid situations that you were trying to catch
> >> with that --ctdir. You only have to add an iptables rule somewhere to
> >> catch invalid packets.
> > In case you need more information, have a look at:
> >
> > linux/net/netfilter/nf_conntrack_proto_tcp.c
> >
> > Basically, the TCP tracker already validates that traffic is coming
> > from the correct direction. We have an internal state-machine for
> > that that will put coming in the wrong direction packets into the
> > INVALID state. If you have a rule-set whose default policy is drop or
> > you log and drop invalid packets, it will allow you to obtain the
> > effect you seem to be looking for. So basically, it's safe to remove
> > the --ctdir without having a less secure rule-set.
> 
> So in effect, you're admitting that --ctdir is now more or less
> unusable, since it's meaning/function can't be relied on, so everyone
> should just avoid it. In retrospect then, it probably would have been a
> much better decision to leave it "broken" (but at least in a
> known/consistent/usable fashion). (Nothing to be done about that now,
> though, since it's in the wild in both versions).

This option has also been broken for quite some time in user-space:

http://www.spinics.net/lists/netfilter-devel/msg15827.html

The fix was available starting iptables 1.4.11. The kernel fix went
into 2.6.39.

I'm trying to help you to find a good solution that works in all
cases, including old kernels, and to explain why that option, using it
in the broken way or not, provides no safer ruleset in the TCP case.

Regards.
