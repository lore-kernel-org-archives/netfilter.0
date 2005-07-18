From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: RST packets
Date: Mon, 18 Jul 2005 12:39:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0507181237570.27221@darkstar.sysinfo.com>
References: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Mon, 18 Jul 2005, Jan Engelhardt wrote:

> Hi,
>
>
> a simple question, though I could not clearly read it from the TCP RFC...
> do RST packets always have ACK set?
>
>


Past discussions on this, if I recall have stated, that the RFC is unclear 
if they should or should not, and thus it is implimentation specific.  In 
other words prepare for both.

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

iD8DBQFC29s0st+vzJSwZikRAhFhAJ9VrBg8udgLE/rjWj69PZI+xj/J1QCg21bk
Nv2IJV8hI5/AhxnInjSMq5Y=
=OiGE
-----END PGP SIGNATURE-----

