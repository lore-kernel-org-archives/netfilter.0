From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Want to do NAT for internal machines
Date: Sat, 1 Jun 2002 18:59:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020601185934.N27307@funkyjesus.org>
References: <ENEBKGGOKDOEALIKAJMBMEDDCHAA.neil@JAMMConsulting.com> <200206011605.g51G5rA04402@Networker.rockstone.co.uk>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206011605.g51G5rA04402@Networker.rockstone.co.uk>; from Antony@Soft-Solutions.co.uk on Sat, Jun 01, 2002 at 05:05:53PM +0100
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
To: netfilter <netfilter@lists.samba.org>

On Sat, Jun 01, 2002 at 05:05:53PM +0100, Antony Stone wrote:
> On Saturday 01 June 2002 4:04 pm, Neil Aggarwal wrote:

<snip>

> > # Bind the IP to eth0
> > /sbin/ifconfig eth0:1 11.22.33.55 netmask 255.255.255.0 broadcast
> > 11.22.33.255
> 
> A slightly outdated way of doing it, but it'll certainly do the job. 
> It's the way I still do it.

Is the latest way using the "iproute2" functionality I keep hearing about?

> > # Route incoming connections to the internal machine
> > /sbin/iptables -t nat -A PREROUTING -d 11.22.33.55 -j DNAT --to
> > 192.168.1.55 # Route outgoing connections from the internal machine
> > /sbin/iptables -t nat -A POSTROUTING -s 192.168.1.55 -j SNAT --to
> > 11.22.33.55
> >
> > Is this close?
> 
> Is it close ????   Absolutely spot on :-)
> 
> ....so long as you accept that netfilter isn't going to be providing you
> with any security whatever in a setup like this...
> 
> ie it's going to forward all packets in and out of your internal machines
> - you may as well have just plugged them straight into the Internet.  Put
> some decent security measures on those servers, and you'll be okay.

Is the any particular reason you want the Internet to contact your hosts
directly?  Look into the concept of a DMZ, a De-Militarized Zone - you might
be able to come up with a more security setup.

-- 
FunkyJesus System Administration Team


