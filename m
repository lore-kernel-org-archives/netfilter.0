From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: NAT Helpers?
Date: Mon, 12 Sep 2005 15:21:58 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0509121520360.1296@darkstar.sysinfo.com>
References: <E656E2CC1C5AEB42ACB00EB83122C7742E2A9A@farmer.vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7742E2A9A@farmer.vikus.com>
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




isn't the key to this "solution" a bridge?  I mean afterall you are trying 
to join two seperate braodcast domains and the best way to do that is with 
a bridge, or am I missing something here?




Thanks,

Ron DuFresne

On Mon, 12 Sep 2005, Derick Anderson wrote:

>
>
>> -----Original Message-----
>> From: netfilter-bounces@lists.netfilter.org
>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
>> Sent: Sunday, September 11, 2005 8:09 AM
>> To: netfilter@lists.netfilter.org
>> Subject: Re: NAT Helpers?
>>
>> On Saturday 2005-September-10 00:05, James Stickland wrote:
>>> My problem with this network setup is that when the terminal server
>>
>> With WHAT network setup? I saw no information about a network.
>>
>>> attempts to join the domain, or do such things as browse all the
>>> network shares (as opposed to typing in their ip address),
>> it attempts
>>> connections to the 10.10.10.7 broadcast address.  The problem lies
>>> within the router  - it does not forward broadcasts.
>>
>> Why not? A broadcast is just another IP. This is sometimes
>> true but not always true. It might depend on your rules. A
>> clear explanation of the issue helps in finding a resolution.
>
> I actually tried once to get DHCP to broadcast across two subnets with
> no success (I allowed the ports to be forwarded, didn't block 0.0.0.0 or
> 255.255.255.255, etc.). Of course DHCP uses 0.0.0.0 and 255.255.255.255
> so that may be a special case. But usually broadcast addresses are
> defined within a subnet (like 10.0.0.255) and so I would think they
> wouldn't be routed outside the subnet by design.
>
> Just my thoughts - or maybe I misunderstood this part of the issue.
>
> Derick Anderson
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

iD8DBQFDJdVZst+vzJSwZikRAm4zAJwOTuX1VS9sHnhFCcqRI1zAhihAiQCgx26d
mY5ZZ/8SmdnXRUJ+awLcPW4=
=FBgM
-----END PGP SIGNATURE-----

