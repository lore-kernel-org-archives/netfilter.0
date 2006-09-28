From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: FW: iptables and Limewire
Date: Wed, 27 Sep 2006 23:38:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0609272337210.7358@darkstar.sysinfo.com>
References: <200609141211.k8ECBuVu013734@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200609141211.k8ECBuVu013734@darkstar.sysinfo.com>
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
To: Sherwyn Greene <sgreene@kentz-ojs.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 14 Sep 2006, Sherwyn Greene wrote:

>
>
> Sherwyn Greene
> Planner / I.T. Technician
> Project Controls Dept.
> Kentz-OJ's E&I Services J.V.
> +1 (868) 648-0876
>
>
> ________________________________
>
> From: Sietse van Zanen [mailto:sietse@wizdom.nu]
> Sent: Thursday, September 14, 2006 8:01 AM
> To: Sherwyn Greene
> Subject: RE: iptables and Limewire
>
>
> 1. Yes, but not entirely. You can block all outgoing traffic execpt traffic
> on port 80 or 443. This would allow for HTTP and HTTPS, but also for
> connections to limewire users, that set their client to listen on port 80 or
> 443. That will not be many users, and they will only be reached with direct
> connects, so doing this should get rid of 99.99% of the limewire traffic.
> Your internal users will no longer be able to connnect to Limewire servers
> directly. They might be able to exploit a public open proxy, that allows
> CONNECT. Also not very likely.



Would it not be easier to route the limewire servers to 127.0.0.0?

You may have to keep track of what the current servers are but that would 
elimiate making your network a virtual prison.


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
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFG0PPst+vzJSwZikRAoo+AJ4+xSTJeiVKPgHHQ4DY7vJb7P5N1wCgmYSk
XROM8/4qn7oeV/di5BFDNSQ=
=b1Zt
-----END PGP SIGNATURE-----

