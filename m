From: Patrick Schaaf <bof@bof.de>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Thu, 27 Jun 2002 09:28:54 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627092854.B1873@oknodo.bof.de>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil> <20020623080704.YEZE2755.mta05-svc.ntlworld.com@there> <20020627001418.A13910@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020627001418.A13910@spawar.navy.mil>; from seberino@spawar.navy.mil on Thu, Jun 27, 2002 at 12:14:18AM -0700
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.samba.org

On Thu, Jun 27, 2002 at 12:14:18AM -0700, Christian Seberino wrote:
> > Reverse nat for replying packets is automatic, therefore replies get 
> > destination natted when they come back in.
> 
> This scares me.  So you are saying that there are "implicit" NAT
> rules for "replying packets" that are immune to iptables DROP rules?!

NO. You filter in the filter table's INPUT, OUTPUT, and FORWARD chains.
You can filter ANY packet there.

The NAT action (i.e. appropriate modification of IP addresses and ports)
is what happens automatically for the reverse direction - and that is
absolutely NECCESSARY for NAT to work. It's still up to you to filter
each packet after modifications have been applied.

> If a packet is part of an ESTABLISHED tcp connection then it
> can by pass an "SSH only" firewall?!??

If you have an indiscriminate ESTABLISHED/ACCEPT rule, and you did permit
the creation of the connection in the first place, then yes, that's the
case. It's all up to your own ruleset. A packet cannot become part of
an ESTABLISHED tcp connection if you do not permit an earlier packet
of the same connection to pass.

Please, Christian, tone down a bit, take a walk, take a deep breath,
and consider that we are not idiots. You don't yet know the full
picture, and painting your horrors onto your half-understanding
will just cause stress here, and make you progress more slowly.

Finally, please learn how to do test setups, and try out your suspicions
before whining about them publicly. It is very hard to guess from your
writing so far what exactly it is that you fear. If you progress by
first testing, you can describe your test setup here in detail, and
we can respond much more pointedly.

thanks for listening
  Patrick

