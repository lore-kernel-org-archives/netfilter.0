From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Looking for a how-to type battle plan for 2 physical subnets
 and an openvpn tunnel.
Date: Tue, 29 May 2007 11:33:11 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0705291126290.8300@darkstar.sysinfo.com>
References: <bf0ca81a0705161135y12499869yc93ea9043eec44bc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bf0ca81a0705161135y12499869yc93ea9043eec44bc@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bill Ries-Knight <steelhoof@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 16 May 2007, Bill Ries-Knight wrote:

> ok, I have a solution issue...
>
> We just had a server cracked (fc4, built by my predecessor)
>
> The server acts as a firewall, VPN Server, content filtering system,
> samba server for files and ssh tunnel to the network.
>
> There are 3 nics covering 2 physical subnets , school
> administration/teachers and computer lab for the sudents, each with
> thier own NIC and the gateway to the internet on the third.  Openvpn
> provides a tun interface with a third subnet to manage.
>
> Software we are running is iptables for the firewall, Openvpn for the
> vpn tunnel between physical sites, samba and clamav/squid/dansguardian
> for content filtering and openssh for remote access.
>
> I am using Debia Etch for the server.
>
> Is there anyone with a reference on how to manage this one?
>
> I can get the old firewall rules into place, but adding ipmasq munges
> it all up.  Without ipmasq there is no name based browsing at all.
>
> At various times I can get the vpn happy, but no browsing.  if I try
> to bring both physical subnets into play, it munges.  I have issues
> with name based internet browsing, or a few minutes later, I have
> issues with the ip address based access.  Ie: I can ping out, but not
> name browse..  a bit later I cannot even ping out.
>
> I am really lost here.
>

First off, a firewall is a security device.  And should be a dedicated 
device for that purpose only.  Perhapos the open vpn might reside here, 
but all the rest, belongs on different secured systems.  Especially samba!

I'd at this point look at a project to divide all these services to their 
own secured systems, and redo the firewall, perhaps with vpn tunneling 
application as it's own dedicated system.  Anything less, and you are 
likely to be facing the same issue of trying to recover hacked/cracked 
servers in the near future again.

As for samba services, they should either be stopped at the inside 
perimiter of the network, or if really reqiured outside the network then 
only provided in a secure tunnle.  This is ancient knowledge in the 
security realm.

The point here is;  there is no quick fix for this setup.  Once a system 
is hacked as you state yours has been, you face a total remake of the 
system<s> involved.  And in this case, since the setup was dubious to 
begin with, you have a major project no at hand.

thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGXEe6st+vzJSwZikRAkHNAJ9ZQebF8ovwk3ReSIvGvYNa9sDT3gCfReD0
c/BVC8mYqqIrqip8NiLtLIw=
=xz2P
-----END PGP SIGNATURE-----

