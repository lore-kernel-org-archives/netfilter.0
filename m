From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: block + kill connections
Date: Sun, 8 Jan 2006 18:14:40 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0601081813580.15383@darkstar.sysinfo.com>
References: <3b29fb790601081344me985167p9c06cf286126ffdb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b29fb790601081344me985167p9c06cf286126ffdb@mail.gmail.com>
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
To: bright true <brighttrue@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sun, 8 Jan 2006, bright true wrote:

> Hello ,
>
> How to block plus kill all currently opened connections from specific ip address
>
> on all ports .
>
> i tryed using :
>
> iptables -I INPUT -s 1.2.3.4 -j DROP
>
> but seems to be it doesn't kill the active connections , it works only for new
>
> incoming connections
>
> any help ?


kill/killall -9 nasty-app-being-hit/shell-in-use.

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

iD8DBQFDwZzkst+vzJSwZikRArw1AJwMVjPAuF0rs2/6BA1IczVGZ1ZYbwCfV7n6
6XyaVW8aU+dJyplYtDmZAhU=
=7mkJ
-----END PGP SIGNATURE-----

