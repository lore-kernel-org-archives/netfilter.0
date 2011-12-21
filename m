From: "Hansa" <mythtv@logic-q.nl>
Subject: RE: Is the current firewall model static?
Date: Wed, 21 Dec 2011 11:16:07 +0100
Message-ID: <000001ccbfc9$8e14a0b0$aa3de210$@nl>
References: <000301ccbef9$4a8dc180$dfa94480$@nl>	 <1324375868.21032.1.camel@steve-pc>  <002201ccbfc1$7743d7f0$65cb87d0$@nl> <1324459648.4269.83.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1324459648.4269.83.camel@steve-pc>
Content-Language: nl
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Andrew Beverley' <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Wed, 2011-12-21 at 10:27 +0100, Andrew Beverley wrote:
> On Wed, 2011-12-21 at 10:18 +0100, Hansa wrote:
> > > I think that what they mean is that the current *Fedora* firewall model
> > > is static. It looks like firewalld still uses iptables, but is slightly
> > > more intelligent as to how it processes changes to rules and so on.
> >
> > I wasn't aware the firewall model is implemented differently across
> >  different Linux flavors. I thought netfilter implements a packet
> >  filtering framework into the Linux kernel. Shouldn't it work the work
> >  the same on every Linux flavor?
> 
> Once the iptables binary has been called and the rules have been set,
> then yes, it's the same across any flavour of Linux (I guess).
> 
> I meant that the distro's implementation of how the rules are managed is
> different. There are loads of different ways. A quick search on a Ubuntu
> system reveals the following. I'm guessing that all of these use
> iptables, but some are better than others at changing rules "on the
> fly".

So it's all about 'how' the firewall is managed (by which tools that is). Netfilter by itself isn't static. Using iptables you can change the firewall dynamically. Using system-config-firewall you're static.

Thanks for clarifying!
-Hansa

