From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: DNS and NAT
Date: Tue, 12 Jul 2005 00:05:49 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0507120004280.8458@darkstar.sysinfo.com>
References: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
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
To: Suzana Lojic-Skoric <s_lojic@hotmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 11 Jul 2005, Suzana Lojic-Skoric wrote:

> OK, thanks I was not sure what is the proper behavior regarding iptables and 
> DNS.
>
> If answer is not translated then how do I get DNS to work with two way NAT?
> My internal network does not understand any of the ip addresses that belong 
> to outside. So if the request for a page that is sent from internal network 
> comes back from outside with an answer (ip address) that is not getting 
> translated then I can't resolve the page since my internal network doesn't 
> understand it and can't route to it.
> Is there a way around this problem? How do I get DNS to work in the type of 
> environment I described?


You could always just push /etc/hosts files out with the inside addresses 
there, if you have troubles with DNS setup.  Slow, crude, yet effective. 
The poorman's way...

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

iD8DBQFC00Ghst+vzJSwZikRAiPtAKCN0xJK03V94Z/tqhLH2BH/0j6EhACgvJna
jvGcXe/gClTpOpIyXwzwP+4=
=1FJ3
-----END PGP SIGNATURE-----

