From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: block all trafic from input
Date: Sat, 23 Apr 2005 14:13:21 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504231412330.15586@darkstar.sysinfo.com>
References: <a3f524e05042303241434a0fd@mail.gmail.com>
	<426A37D3.7010402@yahoo.com.br>
	<426A8EAA.3040407@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426A8EAA.3040407@riverviewtech.net>
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
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: Kashif Ali Bukhari <kbukhari@gmail.com>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sat, 23 Apr 2005, Taylor Grant wrote:

>> iptables -P INPUT DROP
>
> Don't do it from an SSH session though.  You will regret that if you don't 
> have any prior rules to allow you back in.
>


Though it will prevent them from making any other mistakes that could be 
catostrophic <smirk>!

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

iD8DBQFCapBEst+vzJSwZikRAj2vAKDGrxUf06QDfg/64v62vxnD7lU1DACgvXkj
yNtEYchcdSl/DZMGL6NBHX0=
=oWJ/
-----END PGP SIGNATURE-----

