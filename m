From: Askar <askarali@gmail.com>
Subject: Re: Allow particular website/port
Date: Fri, 11 Feb 2005 10:11:41 +0500
Message-ID: <a0f69e5050210211124a0269@mail.gmail.com>
References: <1108064090.420bb75ac0009@mail.gnvfc.net>
	<1108065714.8043.0.camel@porky>
	<1108081685.420bfc1516440@mail.gnvfc.net>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1108081685.420bfc1516440@mail.gnvfc.net>
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
To: netfilter@lists.netfilter.org

The task of blocking certain sites is definitly suited for "squid" as
jason suggest and pls don't *insists* :)
you can block messengers via iptables if you know which ports they are
using for example

## blocking MSN
iptables -A FORWARD -p tcp --dport 1863 -j DROP
##block yahoo
iptables -A FORWARD -p tcp --dport 5050 -j DROP

regards


On Fri, 11 Feb 2005 05:58:05 +0530, spdesai@gnvfc.net <spdesai@gnvfc.net> wrote:
> I want to use Netfilter only instead of squid....pl. give me solution through
> netfilter
> 
> Quoting Eric Leblond <eleblond@inl.fr>:
> 
> > use a proxy (squid trasnparent if you want) ... netfilter can not
> > cleanly filter at level.
> >
> > On Fri, 2005-02-11 at 01:04 +0530, spdesai@gnvfc.net wrote:
> > > Hi
> > >
> > > I have one linux machine with two NIC cards. One is connected to internet
> > and
> > > one is private PC. Below is my IP configuration
> > >
> > > I have enable ip_forward to 1 in linux machine as well as donw masqared in
> >
> > > linux.
> > >
> > > I can browse the internet as well from window machine.
> > >
> > > Now I want to allow/restricted my window machine to access/deny particular
> >
> > > site/block/messanger ...
> > >
> > > i have tried with FORWARD chain but..it restricted all HTTP traffic which i
> >
> > > dont want.
> > >
> > > So pl.  give me the solution.
> > >
> > > Thanks in advance
> > >
> > > Suhag
> > >
> > > -------------------------------------------------
> > > This mail sent through IMP: http://horde.org/imp/
> > >
> > >
> >
> >
> 
> -------------------------------------------------
> This mail sent through IMP: http://horde.org/imp/
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

