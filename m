From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ICMP types
Date: Sat, 30 Apr 2005 19:53:04 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0504301949110.3546@darkstar.sysinfo.com>
References: <8a79f08aaeef.8aaeef8a79f0@vsnl.net>
	<42740CF5.9070705@riverviewtech.net>
	<Pine.LNX.4.60.0504301921220.3546@darkstar.sysinfo.com>
	<42741668.7060001@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42741668.7060001@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sat, 30 Apr 2005, Taylor, Grant wrote:

>> just deny pings to the broadcast address and this can be eliminated, and 
>> this can be done in sysctl, does not require iptables rules and overhead.
>
> This will take care of traffic that was destined to a broadcast address, but 
> not traffic that was destined to your IP directly.  I have known many a 
> person say that it is better to DROP the ICMP traffic coming in on your WAN / 
> INet interface so that you don't become part of a DDoS.  Usually the idea 
> behind this is for multiple owned boxen to ping some other box at random with 
> a spoofed source address in the ICMP packet.  This effectively will cause the 
> recipient of the ICMP packets to reply to the system that is to be DDoSed.

I have never seen a DDOS like this function without reflecting off the 
broadcast address space.  In fact, there;'s perhaps still a list of the 
borked networks that have not blocked access to their broadcast space, 
maybe more then one.  But, I'd be interested in any such attack that works 
without ampliphying off the broadcast address.


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

iD8DBQFCdBpjst+vzJSwZikRAsXkAJ4oaXh+eIT0tnHXAlLpczKSDDB9eACgz5xr
3oL0troG5bU0C2evvTcYgyI=
=tGjd
-----END PGP SIGNATURE-----

