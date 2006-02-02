From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: --tcp-flags  option
Date: Thu, 2 Feb 2006 01:27:30 -0500 (EST)
Message-ID: <Pine.LNX.4.60.0602020125170.10561@darkstar.sysinfo.com>
References: <BAY102-F38DB36A9A03ECDC54AFBAAAE0A0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F38DB36A9A03ECDC54AFBAAAE0A0@phx.gbl>
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
To: P theodorou <props666999@hotmail.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 2 Feb 2006, P theodorou wrote:

> Could someone explain the tcp-flag options
>
>
> like the following line  what does it mean ?
> tcp-flags SYN,RST SYN,RST
>
> why between RST and SYN there is no comma?
>

The man page is fairly clear on this;

- --tcp-flags [!] mask comp
               Match when the TCP flags are as specified.  The  first 
argument is the  flags which we should examine, written as a comma-separated list, 
and the second argument is a comma-separated list of flags which must be set. 
Flags are:  SYN  ACK FIN RST URG PSH ALL NONE.  Hence the command
          iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST SYN
will  only  match  packets with the SYN flag set, and the ACK, FIN and RST 
flags unset.


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

iD8DBQFD4aZVst+vzJSwZikRAv4yAJ4gJBE5JhK7TLmBERIb6YYVYYHYKgCbBSHd
yHIzyHTMlLSCHFjNce2qMN0=
=z/zz
-----END PGP SIGNATURE-----

