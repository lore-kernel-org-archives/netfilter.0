From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 19:49:23 +0200
Message-ID: <1249062563.27177.25.camel@enterprise.ims-firmen.de>
References: <20090731144247.01a4f9bb@zeus.int.pccl>
	 <1249056381.27177.12.camel@enterprise.ims-firmen.de>
	 <20090731172419.669eb256@zeus.int.pccl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090731172419.669eb256@zeus.int.pccl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clayton <andrew@digital-domain.net>
Cc: netfilter@vger.kernel.org

On Fri, 2009-07-31 at 17:24 +0100, Andrew Clayton wrote:
> On Fri, 31 Jul 2009 18:06:21 +0200, Thomas Jacob wrote:
> 
> > On Fri, 2009-07-31 at 14:42 +0100, Andrew Clayton wrote:
> > [.. accessing outside IPs on a NAT router from
> > the inside network ...]
> > 
> > > I can't help but think I'm missing something simple. Then again does
> > > what I'm trying to do make sense?
> > 
> > Just don't DNAT/SNAT packets from the internal network to
> > your public IPs, there is no need for it anyway.
> > 
> > e.g. do something like this before your other DNATs
> > 
> > $IPTABLES -t nat -A PREROUTING -i eth1 -s 192.168.0.0/16 -p tcp -d
> > $HOST_E -j RETURN
> > 
> > Plus, of course, you need to allow access to that IP/port from the
> > internal network in the INPUT chain of the filter table.
> 
> Thanks for the reply. Unfortunately with the above rule, the ssh just
> ends up going to the firewall and not the host. The firewall is
> configured with the IP address of $HOST_E which is where the DNAT comes
> in to change it to it's internal IP.

Ah yes, the ssh  server is on a DNATed internal machine, sorry about.

In that case you need to SNAT your request to the local machine as well,
and also keep the original DNAT rule:

So:

$IPTABLES -t nat -A PREROUTING -i eth1 -s 192.168.0.0/16 -p tcp -d
$HOST_E --dport 22 -j DNAT --to-destination $HOST_I

+

$IPTABLES -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/16 -p tcp -d
$HOST_I --dport 22 -j SNAT --to-destination <Internal-Router-IP>


should get you there.

Just tried that on a similar setup and it worked well for me, I can ssh
to myself via the NAT router by contacting the NAT routers public IP ;)

