From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: dual gateways
Date: Wed, 5 Feb 2003 19:46:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030205194635.790aabad.arnt@c2i.net>
References: <01CEA3A5B8B2D511890F0002A5870AEC64EBAE@EXCHANGE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC64EBAE@EXCHANGE>
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
To: netfilter@lists.netfilter.org

On Wed, 5 Feb 2003 11:21:22 -0500, 
Khanh Tran <khanh@slc.edu> wrote in message 
<01CEA3A5B8B2D511890F0002A5870AEC64EBAE@EXCHANGE>:

> I'm sure this is possible, but I just haven't gotten it to work right
> by playing around with the settings.
> 
> I've got three NICs in the firewall box.  I've also got two routers
> that go to the Internet via two separate lines (a T1 and a partial
> T3).  I've got my default gateway set on the linux box to go out via
> the T3 and NAT setup for my clients to route out via that interface. 
> I'd like to know if it's possible to setup a failover route to
> redirect clients out the T1 should the T3 not be available, even if
> the router is.  Here's the basic diagram:
> 
> 
>                           (default route)
>                           eth2 <---> |T3 Router| <---> Internet
> LAN <---> eth1 |firewallBox|
>                           eth1 <---> |T1 Router| <---> Internet
> 
> 
> Khanh Tran
> Network Operations
> Sarah Lawrence College
> 
> 

..branching off this thread for another idea: T3 + T1 bonding, 
or some other bandwidth maximation scheme.  Experiences, anyone?


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



