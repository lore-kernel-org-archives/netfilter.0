From: dave <ceek63@yahoo.com>
Subject: Re: port forwarding AND local application consumption...
Date: Thu, 28 Sep 2006 13:33:59 -0700 (PDT)
Message-ID: <20060928203359.55696.qmail@web38003.mail.mud.yahoo.com>
References: <20060928202918.95062.qmail@web38004.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060928202918.95062.qmail@web38004.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org


Here is the related Bugzilla who direct the needed
ones to netfilter!
Bugzilla Bug 145642: iptables ROUTE target does not
work

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=145642#c3


-D


--- dave <ceek63@yahoo.com> wrote:

> 
> I use redhat kernel 2.4.x and looks like I need to
> rebuild the kernel if I want to use ROUTE target?
> 
> None of the iptables' rpms for fedora/redhat distro
> contain libipt_ROUTE.so.
> 
> What is best way to incorporate ROUTE target in
> my situation?
> 
> -D
> 
> 
> --- Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
> 
> > > I use kernel 2.4.x.
> > > I need to do port forwarding to a remote host
> AND
> > to
> > > pass these packets to a local application.
> > >
> > > I used the DNAT feature in iptables and it does
> > the
> > > port forwarding. But the issue is that these
> > forwarded
> > > packets are unreachable to local application.
> > 
> > Of course, you just changed the IP address to
> > something else than your 
> > own box. With DNAT, you explicitly 'give' up the
> > connection for the 
> > local host.
> > 
> > >
> > > Any tips about proper iptables' rules to
> > accomplish both?
> > 
> > Apart from writing your own target extensions, I
> > know of none. Might use 
> > ipt_ROUTE as a base, it contains a --tee option.
> > 
> > 
> > Jan Engelhardt
> > -- 
> > 
> > 
> 
> 
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam
> protection around 
> http://mail.yahoo.com 
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

