From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: Re: help on DMZ project
Date: 13 Mar 2003 12:54:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047581684.1686.4.camel@runabout.noc.starken.com>
References: <20030313114142.2704C1BB2FE@mail.powweb.com> 
	<20030313145842.44367092.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030313145842.44367092.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org, Chris Partsenidis <Chris@Firewall.cx>

I personally would avoid ipcop because the last time I checked it was
still 2.2 based and was not a stateful firewall.  I can't speak for
shorewall, I haven't had a chance to play with it yet (we wrote our own
firewall code + web interface so I haven't kept up too much on some of
these other projects).

Dan

On Thu, 2003-03-13 at 07:58, Arnt Karlsen wrote:
> On Thu, 13 Mar 2003 11:41:42 -0000, 
> "Chris Partsenidis" <Chris@Firewall.cx> top posted in message 
> <20030313114142.2704C1BB2FE@mail.powweb.com>:
> > > 
> > > ---------- Original Message -------------
> > > Subject: help on DMZ project
> > > Date: Thu, 13 Mar 2003 17:16:27 +0800
> > > From: "louie miranda" <lmiranda@chikka.com>
> > > To: <netfilter@lists.samba.org>
> > > 
> > > 
> > > I currently have a project to make a DMZ farm of servers. I actually
> > > want to make this firewall
> > > be splitted in to 4 or more networks. I'll be trying to host 3
> > > different company, I would like to
> > > try using Iptables as my main firewall and gateway before the
> > > internet.
> > > 
> > > Could this be done? And which documents should i read? I currently
> 
> ..piece of cake, several ways:  http://ipcop.org/  needs its 
> own box, http://shorewall.net/ does really does too in your 
> case, add in http://webmin.com/ to control it too, from a web 
> browser, or, you can control both from ssh.  



