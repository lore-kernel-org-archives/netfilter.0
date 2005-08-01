From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Blocking a range of source IPs to a specific port
Date: Mon, 1 Aug 2005 16:36:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0508011635250.3645@darkstar.sysinfo.com>
References: <42EE63E6.6070801@blackicehosting.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EE63E6.6070801@blackicehosting.com>
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
To: James Harrison <jamesharrison@blackicehosting.com>
Cc: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 1 Aug 2005, James Harrison wrote:

> Hi,
>
> I'm trying to use iptables to block a range of source IP addresses, but I 
> can't figure out how to specify ranges- i'm trying to block everything from 
> 172.150-250.*.* on port 8676- can someone help me out with the rule for this?
>
> Thanks,
> James Harrison
>



For part of the address space 172.128.0.0 - 172.191.255.255 you can block 
on 172.128.0.0/10.  To get the full range, you might use one of the online 
IP calculators to figger in the who shebang.


Thanks,


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
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC7ofust+vzJSwZikRAiqwAKDViUli7EhuVDadxre3WztiG5DzCgCeOZOy
frORKRIbZK84nXrsIz7ncHM=
=VZIa
-----END PGP SIGNATURE-----

