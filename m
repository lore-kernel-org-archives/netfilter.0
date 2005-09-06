From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Odd Problem - Connecting to SMTP
Date: Tue, 6 Sep 2005 17:01:23 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0509061659340.11958@darkstar.sysinfo.com>
References: <027a01c5b188$e13172b0$0ac8a8c0@defiant>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <027a01c5b188$e13172b0$0ac8a8c0@defiant>
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
To: Chris Shipman <listmail@odisok.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sun, 4 Sep 2005, Chris Shipman wrote:

>    I have a strange problem.      When I try to connect to a mail server from my linux router it can't connected to port 25.   It seems like only port 25 is affected.
> The WAN port is DHCP and the LAN is set static with NAT enabled on outbound.
>
>    However a computer behind my linux router has no trouble connecting to port 25.    It's only when I try to connect from the linux router itself.   I'm using IPTables 1.3.3
>
>    Does anyone have an idea of what is causing this?
>


some linux dists also compile tcpd/sendmail to work and play together, and 
this might be the case if your setup has a default deny in the 
/etc/hosts.deny file, took awhile to figger that out here when working 
with a new slackware setup and old hosts.xxx files moved from other 
working setups.

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

iD8DBQFDHgOmst+vzJSwZikRAmsWAJ9g9T3c9r+Iuj1fBnsNGoJcbXkOgACfUh7s
ggUMujzQ2HGk72241hmiCzk=
=8Wtn
-----END PGP SIGNATURE-----

