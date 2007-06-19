From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: syn DDoS attack solution
Date: Tue, 19 Jun 2007 14:22:51 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0706191422070.29334@darkstar.sysinfo.com>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
	<465FEA82.709@bgs.hu> <007101c7a45d$bc50e380$34f2aa80$@COM>
	<466090CA.2050806@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <466090CA.2050806@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: Ric Messier <kilroy@WasHere.COM>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 1 Jun 2007, Martijn Lievaart wrote:

> Ric Messier wrote:
>> Bgs writes:
>> 
>>> Some more info about the attack: All IPs were real IPs otherway the tcp
>>> handshake wouldn't have made it. The attacker IPs were also consistent.
>>> They also new about the blocked IPs as after a new bunch of blocked IPs
>>> we fared OK then they added another bunch new IPs... we played this for
>>> quite some time...
>>> 
>>> All connections were in the ESTABLISHED state.
>>>
>>> 
>> 
>> Then your original description was incorrect or at least inadequate. It has
>> nothing to do with SYN as originally suggested since an ESTABLISHED
>> connection has blown past SYN, through SYN/ACK and by ACK. It has completed
>> the TCP handshake, as you note above. A SYN attack/flood would stop after
>> sending the initial SYN and leave the connection half-open to exhaust the
>> half-open buffers.
>> 
>
> An connection is in the ESTABLISHED state once a packet has been seen. So 
> once the SYN is seen, the state is ESTABLISHED.
>


No, it is in state "new" with a mere syn sent.


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

iD8DBQFGeB7/st+vzJSwZikRAmbnAKDPbPVQcBsCzAkmoETaYT61EHVOAgCgwl0P
gTWFY+m1/+x1np1D7Rr1ulA=
=Eq4t
-----END PGP SIGNATURE-----

