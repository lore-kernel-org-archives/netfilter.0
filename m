From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: syn DDoS attack solution
Date: Thu, 21 Jun 2007 14:26:52 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706211424400.5714@darkstar.sysinfo.com>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
	<465FEA82.709@bgs.hu> <007101c7a45d$bc50e380$34f2aa80$@COM>
	<466090CA.2050806@rtij.nl>
	<Pine.LNX.4.64.0706191422070.29334@darkstar.sysinfo.com>
	<f59kpi$1vs$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f59kpi$1vs$1@sea.gmane.org>
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
To: Robert Nichols <rnicholsNOSPAM@comcast.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 19 Jun 2007, Robert Nichols wrote:

> R. DuFresne wrote:
>> 
>> On Fri, 1 Jun 2007, Martijn Lievaart wrote:
>>> 
>>> An connection is in the ESTABLISHED state once a packet has been seen. So 
>>> once the SYN is seen, the state is ESTABLISHED.
>>> 
>> 
>> 
>> No, it is in state "new" with a mere syn sent.
>
> You have to specify whether you are talking about the TCP connection
> status or the conntrack status.  A mere SYN is sufficient to make an
> ESTABLISHED status in conntrack.  If that were not true, then when
> I send a TCP SYN packet the SYN/ACK would never make it back through
> my firewall.
>
>

remember, you fiter upon the state, new established and related <ignoring 
invalid here>.  I was correct, you need to review the filtering contexts <smile>.


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

iD8DBQFGesLxst+vzJSwZikRAtJXAJ4xGDmYV/xjS1rRQ1RwLUqNY5ulnQCbBkrL
oOttmX+tQwr8Ot1SSesPRBg=
=KF5d
-----END PGP SIGNATURE-----

