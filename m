From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Want to do NAT for internal machines
Date: Sat, 1 Jun 2002 19:15:08 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206011815.g51IFAA11740@Networker.rockstone.co.uk>
References: <ENEBKGGOKDOEALIKAJMBMEDDCHAA.neil@JAMMConsulting.com> <200206011605.g51G5rA04402@Networker.rockstone.co.uk> <20020601185934.N27307@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020601185934.N27307@funkyjesus.org>
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
To: netfilter <netfilter@lists.samba.org>

On Saturday 01 June 2002 6:59 pm, Nick Drage wrote:

> > > # Bind the IP to eth0
> > > /sbin/ifconfig eth0:1 11.22.33.55 netmask 255.255.255.0 broadcast
> > > 11.22.33.255
> >
> > A slightly outdated way of doing it, but it'll certainly do the job.
> > It's the way I still do it.
>
> Is the latest way using the "iproute2" functionality I keep hearing about?

Yup.   Archives of this mailing list will tell you how to do it.

> > It's going to forward all packets in and out of your internal machines
> > - you may as well have just plugged them straight into the Internet.  Put
> > some decent security measures on those servers, and you'll be okay.
>
> Is the any particular reason you want the Internet to contact your hosts
> directly?  Look into the concept of a DMZ, a De-Militarized Zone - you
> might be able to come up with a more security setup.

I agree.   The solution you proposed will do what you said you wanted - but 
that doesn't mean to say that it was a good idea :-)


Antony.

