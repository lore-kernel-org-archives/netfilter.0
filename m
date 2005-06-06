From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Drop the Current Established Connections
Date: Mon, 6 Jun 2005 16:19:03 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506061618180.10082@darkstar.sysinfo.com>
References: <3b29fb7905053123282b03f832@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b29fb7905053123282b03f832@mail.gmail.com>
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

On Tue, 31 May 2005, bright true wrote:

> Hello ,
>
> i want to know the right way of blocking an ip and drop the current Established
>
> connections from that ip
>

The best way is to not allow the connections to become Established, deny 
the syn.

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

iD8DBQFCpK+6st+vzJSwZikRAgBHAKCMn+XtEd3Z/K0Hn6gnlG7QQcHTUACeNXvC
qjfMFtBDD5TevOzrcvt+qAE=
=Kjsm
-----END PGP SIGNATURE-----

