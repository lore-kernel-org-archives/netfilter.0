From: Abraham van der Merwe <abz@frogfoot.net>
Subject: Re: clearing dont-fragment bit
Date: Fri, 10 Oct 2003 10:17:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031010081741.GA30289@oasis.frogfoot.net>
References: <20031009134311.GA25685@oasis.frogfoot.net> <1065716586.5873.23.camel@kermit> <20031009165049.GA4043@oasis.frogfoot.net> <1065719570.5873.31.camel@kermit> <20031009181123.GA8403@oasis.frogfoot.net> <1065762785.1650.17.camel@kermit>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline; filename="msg.pgp"
In-Reply-To: <1065762785.1650.17.camel@kermit>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: application/pgp; x-action=sign; format=text; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter Discussions <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Ralf                                          >@2003.10.10_07:13:06_+0200

> Am Don, 2003-10-09 um 20.11 schrieb Abraham van der Merwe:
> > Yes, I know, but as long as all the fragments have unique ids it shouldn't
> > matter. Also, if the packet is fragmented along the way under normal
> > circumstances (i.e. DF=0), then the IP-ID field would have to be incremented
> > by the router fragmenting the packet.
> True but Linux 2.4 clears the IP-ID field when sending a packet with the
> DF-Bit set. You have to manually recreate a unique IP-ID field when
> clearing the DF-Bit on the firewall. Even when the router increments
> this field all packets will have the ID of 1. When defragmenting the
> receiver does not know which fragment belongs to which packet.
> 
> Linux 2.4 is the only operating system I know of that shows this
> behavior. 

Ok, I see what you're getting at. That brings us back to my original
suggestion. If the tunnel could do the fragmentation _and_ reassembly then
this would not be a problem. *sigh*

- -- 

Regards
 Abraham

I hate it when my foot falls asleep during the day cause that means
it's going to be up all night.
		-- Steven Wright

___________________________________________________
 Abraham vd Merwe - Frogfoot Networks CC
 9 Kinnaird Court, 33 Main Street, Newlands, 7700
 Phone: +27 21 686 1665 Cell: +27 82 565 4451
 Http: http://www.frogfoot.net/ Email: abz@frogfoot.net

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.5 (GNU/Linux)
Comment: Debian :: The Universal Operating System

iD8DBQE/hmsl0jJV70h31dERAsLkAJ94k/LXfuSidWOmBIb2uZkF5Vi9jwCaA17A
Fr8tm9CXx5vCLx7u0A8sLmM=
=aaCy
-----END PGP SIGNATURE-----

