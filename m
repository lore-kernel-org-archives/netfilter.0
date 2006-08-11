From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: netfilter in linux 2.6 & 2.4
Date: Thu, 10 Aug 2006 22:56:36 -0400 (EDT)
Message-ID: <Pine.LNX.4.64.0608102254580.7252@darkstar.sysinfo.com>
References: <44DB484D.5080705@microembed.cn> <44DB507F.2040401@eccotours.co.za>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44DB507F.2040401@eccotours.co.za>
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Thu, 10 Aug 2006, Brent Clark wrote:

> Richard Cai wrote:
>> Hi,
>> 
>> Recently I'm developing a firewall router with linux 2.4(and I can only
>> use 2.4 for some reasons). But there are more resources about the linux 2.6
>> netfilter. Do you think I should port the netfilter frameworke from linux
>> 2.6 to linux 2.4 to have more support? :) (I think it's a bad idea).
>> 
>> richard
>
> Hi
>
> Im probally gonna get flamed for this, but I dont think this would be correct 
> or good idea.
>
> Heres an example, if you want to use squid on the machine on say like as a 
> transparent proxy, you cant achieve this with the 2,4 kernel.
>
> I queried the squid guys and the and they said squid 2.6.STABLE is compiled 
> with epoll() support turned on by default.
> The epoll() functions are supported only in kernels 2.6.x.


complied binaries?  why not work from source and compile yourself?


>
> Also you said it yourself "But there are more resources about the linux 2.6 
> netfilter".


Let's see, you want to make the 2.4 kernel into a 2.6 kernel, was that not 
already done for you?



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

iD8DBQFE2/Hnst+vzJSwZikRAkT1AJoCf/qlvZv5RaPeGj2sxWYo0b1ekACcDUOr
Eu3rYnCLlgxeI8sqhkDOVtE=
=zocg
-----END PGP SIGNATURE-----

