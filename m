From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Change outbound ICMP source
Date: Mon, 10 Apr 2006 20:05:31 +0000 (UTC)
Message-ID: <Pine.LNX.4.64.0604102004520.26404@darkstar.sysinfo.com>
References: <443A9DA4.30801@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <443A9DA4.30801@gmail.com>
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
To: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 10 Apr 2006, Nathaniel Hall wrote:

> I have been trying to figure out how to change the source IP address of an 
> ICMP packet that originates from the firewall.  Here is my application.
>
> Instead of dropping a packet I reject it with ICMP host unreachable messages. 
> I would like to make it appear that the firewall isn't there, so I would like 
> to change the source IP address to be that of our upstream router.  How would 
> I go about doing this?
>
>

by blocking the ICMP's at that upstream router.


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
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEOrqOst+vzJSwZikRAuLvAJ4xoqhQ7URdwmnuie+bsB7XLqz5WwCfYzBQ
7xiEJTytpedk3pYCnKSGnkQ=
=rfrz
-----END PGP SIGNATURE-----

