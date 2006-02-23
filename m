From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: netfilter Digest, Vol 19, Issue 31
Date: Wed, 22 Feb 2006 20:57:08 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0602222055530.15003@darkstar.sysinfo.com>
References: <000001c6388d$a827e990$c05c5a42@fdcp4xq35qslnu>
	<45576.162.119.232.107.1140651650.squirrel@www.malibyte.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45576.162.119.232.107.1140651650.squirrel@www.malibyte.net>
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
To: Bob Sully <rcs@malibyte.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



better suggestion, manage it on yer own system<s>.  man procmail for a 
start.


Thanks,

Ron DuFresne


On Wed, 22 Feb 2006, Bob Sully wrote:

> Suggestion for the Netfilter admins:
>
>
> <<>> DiG 9.3.1 <<>> bwdow.com
>
> ;; ANSWER SECTION:
> bwdow.com.              86400   IN      A       66.90.92.192
>
> /sbin/iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp -s 66.90.92.192 -d
> $EXTERNAL_IP -j DROP
>
>
> deneme@bwdow.com wrote:
>> Best Web Designs of World:  http://www.bwdow.com
>
>

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

iD8DBQFD/RZ3st+vzJSwZikRAs3uAJ9IBNun/R3rnUdTtYmkEJ0R4pp1igCgqFHg
Ntw0Z0dxMwv0M/Np9Lm05I8=
=scm3
-----END PGP SIGNATURE-----

