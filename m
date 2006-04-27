From: Aj Mirani <debsec@tucows.com>
Subject: Re: Why is this not working???
Date: Thu, 27 Apr 2006 10:30:27 -0400
Message-ID: <20060427143027.GS5568@orbitor.ops.internal.tucows.com>
References: <200604251615.03991.stratism@gmail.com>
	<20060426125726.GI5568@orbitor.ops.internal.tucows.com>
	<200604271013.18777.stratism@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200604271013.18777.stratism@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Stratos Margaritis <stratism@gmail.com>
Cc: netfilter@lists.netfilter.org

Ah, I see... I believe what you need to do is put these rules in the
PREROUTING chain.

something like:
iptables -t nat -A PREROUTING -p tcp -s xxx.xxx.xxx.xxx/28 -d
yyy.yyy.yyy.yyy -j ACCEPT 

Check out this iptables flow chart - it should help clear things up a
little about how packets traverse the different chains:

http://cs.senecac.on.ca/~selmys/subjects/sec830-051/iptables.gif


			-aj


On Thu, Apr 27, 2006 at 10:13:15AM +0300, Stratos Margaritis wrote:
> Well I am trying to forward packets from the outside world to some machines 
> inside. All machines have real IP's and when I use:
> -A FORWARD -j ACCEPT
> everything works fine. But what I want to do is to also filter packets as well 
> as who has access to my internal machines.
> 
> On Wed 26 Apr 2006 15:57, Aj Mirani wrote:
> > Why not put something like this into your INPUT chain:
> >
> > -A INPUT -p tcp -m tcp --dport 22 -s xxx.xxx.xxx.xxx/28 -d yyy.yyy.yyy.yyy
> > -j ACCEPT
> >
> > Also for your line:
> > -A INPUT -p tcp --syn -m limit --limit 5/s -i eth0 -j ACCEPT
> >
> > This is a server wide limit not a per host limit which depending on what
> > you're trying to prevent may not be the best way to do it.
> >
> > If you are trying to prevent a syn attack but still want the server to
> > respond to legitimate requests try something like this:
> > -A INPUT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -m recent --set --name
> > SYNATTACK --rsource -A INPUT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -m
> > recent --update --seconds 20 --hitcount 10 --name SYNATTACK --rsource -j
> > DROP -A INPUT -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> >
> > This dynamically put hosts on a 'blacklist' who are trying to connect
> > too fast (more that 10 times in a 20 second period.)  with the use of
> > --update it will keep them blacklisted as long as they continue to send
> > packets too fast.
> >
> > On Tue, Apr 25, 2006 at 04:14:59PM +0300, Stratos Margaritis wrote:
> > > Can someone help me find out why is this rule does not work?
> > >
> > > *filter
> > >
> > > :INPUT DROP [1803:271102]
> > > :FORWARD DROP [0:0]
> > > :OUTPUT DROP [0:0]
> > >
> > > -A INPUT -i lo -j ACCEPT
> > > -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> > > -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
> > > -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
> > > -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
> > > -A INPUT -p udp -m udp --dport 53 -j ACCEPT
> > > -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> > > -A INPUT -p icmp -j ACCEPT
> > > -A INPUT -p tcp -j REJECT --reject-with tcp-reset
> > > -A INPUT -p tcp --syn -m limit --limit 5/s -i eth0 -j ACCEPT
> > > -A FORWARD -p tcp -i eth0 -s xxx.xxx.xxx.xxx/28 -o eth1 -d
> > > yyy.yyy.yyy.yyy -j ACCEPT
> > > -A FORWARD -j LOG
> > >
> > > Where xxx.xxx.xxx.xxx is a real network that should be allowed to contact
> > > the server yyy.yyy.yyy.yyy both of which are having real IP's.
> > >
> > >
> > > --
> > > Stratos
> > > stratism@gmail.com
> 
> -- 
> Stratos
> stratism@gmail.com



-- 
Aj Mirani
Network Operations
Tucows.com Inc

