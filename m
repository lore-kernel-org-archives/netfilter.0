From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: syn DDoS attack solution
Date: Thu, 31 May 2007 15:57:27 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0705311556240.17506@darkstar.sysinfo.com>
References: <465EF582.4070904@bgs.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465EF582.4070904@bgs.hu>
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
To: Bgs <bgs@bgs.hu>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 31 May 2007, Bgs wrote:

>
> Hi all,
>
>
> We recently got under a low traffic botnet DDoS attack. All attacker nodes 
> opened a single tcp session (just SYN part) and then did nothing. This rules 
> out rate limiting solutions and syncookie doesn't help either. (Thousands of 
> attacking nodes).
>
>
> I'd like to know you thoughts about two possible approaches in solving this:
>
> - syn proxy: already used for example by Cisco. The router handles the first 
> part of the connection and only routes packets to the client if the 
> connection seems good. (Good against single/spoofed incoming SYNs but may be 
> used to wait for the first packet with actual data as well).
> - Implement a conntrack solution that gives a timestamp to the connection. 
> Then this timestamp could be used to drop the connection if no data arrives 
> within a configured time limit (good for open inactive connections only). Of 
> course appropriate close toward the local client has to be done as well.
>
> What's your opinion?
>


That you knowledge ot TCP/IP is poor.



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

iD8DBQFGXyiqst+vzJSwZikRAih2AJ0SY0npal/EqdwWK+/4SYOGaXY/uACggRtl
uhPlH5F7JzCJGHf2RgryJT4=
=Y3xX
-----END PGP SIGNATURE-----

