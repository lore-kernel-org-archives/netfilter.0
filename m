From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: removing duplicate rules
Date: Mon, 17 Oct 2005 18:50:28 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0510171848420.32025@darkstar.sysinfo.com>
References: <20051017044217.BF0C069BB7@smtp.sterenborg.info>
	<43535C6A.2090506@india.tejasnetworks.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43535C6A.2090506@india.tejasnetworks.com>
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
To: Aseem Rastogi <aseem@india.tejasnetworks.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


My reply to the orig poster, my second, was sent off list, by error on my 
end.  I'm willing to accept a clue if I was incorrect in stating:

first time the rule is seen, it is applied.  now there can be cases whence
one wants the rule re-evaluated again, and thus might have multiple
instances, that would most often be in user define chains needing a
reapplication, though I can't think of any such instances off the top of 
my
head, unless the rule is only applied in user defined chains.

Thanks,

Ron DuFresne


<replying to:>
On Mon, 17 Oct 2005, Aseem Rastogi wrote:

> Hi All,
>
> Continuing this post:
>
> Adding a rule multiple times shows multiple entries in iptables -L 
output. My
> question is : does it have any performance impact on packet processing ?
>
> Should not be because as soon as a rule is matched, it should come out,
> Right?
>
> Regards,
> Aseem.




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

iD8DBQFDVCq3st+vzJSwZikRAq1zAKCL7P/gM55KDotCL5Kk2GFQJMtULwCgifb3
a6azKVZWCibUjXtKCStAEXc=
=s/q7
-----END PGP SIGNATURE-----

