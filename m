From: Andrew Clayton <andrew@digital-domain.net>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 17:24:19 +0100
Message-ID: <20090731172419.669eb256@zeus.int.pccl>
References: <20090731144247.01a4f9bb@zeus.int.pccl>
	<1249056381.27177.12.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1249056381.27177.12.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Fri, 31 Jul 2009 18:06:21 +0200, Thomas Jacob wrote:

> On Fri, 2009-07-31 at 14:42 +0100, Andrew Clayton wrote:
> [.. accessing outside IPs on a NAT router from
> the inside network ...]
> 
> > I can't help but think I'm missing something simple. Then again does
> > what I'm trying to do make sense?
> 
> Just don't DNAT/SNAT packets from the internal network to
> your public IPs, there is no need for it anyway.
> 
> e.g. do something like this before your other DNATs
> 
> $IPTABLES -t nat -A PREROUTING -i eth1 -s 192.168.0.0/16 -p tcp -d
> $HOST_E -j RETURN
> 
> Plus, of course, you need to allow access to that IP/port from the
> internal network in the INPUT chain of the filter table.

Thanks for the reply. Unfortunately with the above rule, the ssh just
ends up going to the firewall and not the host. The firewall is
configured with the IP address of $HOST_E which is where the DNAT comes
in to change it to it's internal IP.

It seems what I'm trying to do now is something like:

internal (workstation)--> external ($HOST_E)--> internal ($HOST_I)

I could fudge /etc/hosts on machines with the hosts external DNS name
pointing to its internal IP address, but doing it with the firewall
seems better.

e.g 
host.foo.co.uk has an IP of aaa.aaa.aaa.aaa (accessible from outside the
office)
host.foo.bar (internal only DNS name) has an IP of bbb.bbb.bbb.bbb

I can put 

bbb.bbb.bbb.bbb foo.co.uk

in my /etc/hosts file, and then ssh foo.co.uk, works.

But I do think the firewall is the proper place to do this.


Cheers,
Andrew


-- 
On Jack's day off, he and Edgar would shoot hoops and get ice cream
together. Later, they'd prank call Chloe, only to have her trace the
call, call them back and tell them to "grow up". Good times... good
times.
