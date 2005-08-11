From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: IPTables for Sun Solaris
Date: Thu, 11 Aug 2005 17:07:22 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0508111706130.4580@darkstar.sysinfo.com>
References: <5AD6E09C3CB0BE4E83BDABFBF560EA0002C2B1B9@usanbrmbx01.ds.liz.com>
	<876ef97a05081105228ecd1d8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <876ef97a05081105228ecd1d8@mail.gmail.com>
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
To: Toby DiPasquale <codeslinger@gmail.com>
Cc: netfilter@lists.netfilter.org, Ruiyuan Jiang <Ruiyuan_Jiang@liz.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Can we say sunscreen?  Of course IPF and IPFW seem to port well to the 
SUN/Solaris envs...


Thanks,

Ron DuFresne

On Thu, 11 Aug 2005, Toby DiPasquale wrote:

> On 8/9/05, Ruiyuan Jiang <Ruiyuan_Jiang@liz.com> wrote:
>> I am new to the list. I just downloaded iptables-1.3.3. From INSTALL
>> file, it seems IPTables only supports Linux. I have Solaris 10 for
>> SPARC. Does IPTables support Solaris and HP-UX, etc.? Thanks.
>
> No, iptables can only be used with Linux because it relies on the
> netfilter framework in the Linux kernel. Solaris' kernel lacks
> netfilter, therefore it cannot make use of iptables. You might be able
> to get a command-line tool with the same interface as iptables for
> Solaris, however; look around.
>
> --
> Toby DiPasquale
> 0x636f6465736c696e67657240676d61696c2e636f6d
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

iD8DBQFC+74Nst+vzJSwZikRAqCMAKDPv24C0PQPXMnSr+GADF5dXbfr6QCfVXnP
/Dfepb21HrjU7TuXsDoYiog=
=rrcI
-----END PGP SIGNATURE-----

