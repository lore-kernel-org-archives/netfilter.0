From: Patrick Schaaf <bof@bof.de>
Subject: Re: how is this stuff getting thru default deny iptables firewall?....
Date: Thu, 27 Jun 2002 09:37:30 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020627093730.C1873@oknodo.bof.de>
References: <20020622103055.B32585@spawar.navy.mil> <20020622173842.AGM19225.mta07-svc.ntlworld.com@there> <20020623001302.A949@spawar.navy.mil> <20020623095351.M5183@oknodo.bof.de> <20020627002144.B13910@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020627002144.B13910@spawar.navy.mil>; from seberino@spawar.navy.mil on Thu, Jun 27, 2002 at 12:21:44AM -0700
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

> > 	   The "nat" table is NOT consulted for "second or more"
> > 	   packet of an existing conntrack.
> 
> I thought /ALL/ packets first went thru -t nat PREROUTING
> and then -t filter and then -t nat POSTROUTING.

No, that's not the case. I'll try again explaining that path slowly.

At PREROUTING, if there is already a conntrack record in existence,
that record determines how the addresses and ports of the packet are
to be rewritten. That rewrite is then done.

On the other hand, if there is not yet a conntrack record in existence
for the packet, the nat PREROUTING table is consulted, and rules there
modify the fresh conntrack record to remember how exactly to do future
rewriting for BOTH directions of the connection. This is the point in
time where, for NAT action to multiple IPs and/or ports, the exact
address information for that single connection is determined.
You CAN use the DROP target in the NAT chain, that way ABORTING
creation / setup of the conntrack. But that's not usually done.

Next, a routing decision is made, depending (usually) on the destination
IP of the possibly rewritten packet. This decision determines whether the
packet (each packet!) will then pass through the filter table's FORWARD,
or INPUT chain. It will pass INPUT when the destination is localhost
(in all its disguises), or it will pass FORWARD when it is to be routed
out of the box.

Again, EVERY packet passes the filter table.

Nat table tells how to rewrite. Filter table filters. It's all clean
and simple (given the complexities of what NAT has to accomplish...)

OK now?

best regards
  Patrick

