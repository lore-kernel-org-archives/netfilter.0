From: Joel <zealous@bonbon.net>
Subject: Re: Ip accounting Help
Date: Wed, 23 Jun 2004 16:27:25 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087988244.2036.60.camel@joel.d2visp.com>
References: <1087962571.2041.10.camel@joel.d2visp.com>
	 <200406231001.24925.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231001.24925.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-06-23 at 14:31, Antony Stone wrote:
> On Wednesday 23 June 2004 4:49 am, Joel wrote:
> 
> > Hi all,
> >
> > Currently I am working on Ip accounting in linux.
> > My system is Redhat 9.0 with iptables v1.2.7a
> > This redhat is doing Squid-Caching/ Nat/ Bandwidth management with tc/
> > Real ip forwarding.
> >
> > I want to do Ip accounting of upload and download. I want to know how
> > much per ip bandwidth consumption is ?
> >
> > As i m doing source nat and Real ip forwarding, FORWARD chain will have
> > bytes counters. So FORWARD chain will give the correct figure of how
> > much the ip has used the bandwidth ???
> 
> Beware of trying to do this if you are using the stateful connection tracking 
> of netfilter (iptables -I FORWARD -m state --state ESTABLISHED,RELATED), 
> because if you are, then almost all of the packets going through the machine 
> (specifically, all except the first one of each connection) will be processed 
> by this one rule, and all the other rules in the FORWARD chain will only see 
> one packet per connection (the first one).
> 
> You may be able to do what you want using the mangle table of the FORWARD 
> chain, but not with the default filter table.
> 
> Regards,
> 
> Antony.
-- 


Hi Antony,

Yes I am using stateful connection tracking of netfilter ( iptables -I FORWARD -m state --state ESTABLISHED,RELATED)
So as per you i have used FORWARD chain in MANGLE table like this.

# iptables -t mangle -i eth1 -A FORWARD -s 10.1.1.24/29 -j ACCEPT  ---> I think for Download traffic  ---> M I right ?
# iptables -t mangle -i eth0 -A FORWARD -d 10.1.1.24/29 -j ACCEPT  ---> I think for Upload traffic ----> M I right ?

This is the output of 
# iptables -t mangle -nvL FORWARD

Chain FORWARD (policy ACCEPT 1747K packets, 318M bytes)
 pkts bytes target     prot opt in     out     source               destination
 1068 91499 ACCEPT     all  --  eth1   *       10.1.1.24/29         0.0.0.0/0
  148 26923 ACCEPT     all  --  eth0   *       0.0.0.0/0            10.1.1.24/29

Antony i have lot of other ip address but i have created only this subnet for mangle table for testing.
Traffic bytes are passing through this.
So is the correct method ?
Will be the bytes over here are accurate ???

Thanking you,

Joel n.solanki
Systems Administrator
(M) 91-9825500258
D2V ISP PVT LTD
http://www.d2visp.com/



