From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: mms and rtsp patches = make modules fail
Date: Thu, 29 Jan 2004 13:43:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40190E1F.6090700@dsl.pipex.com>
References: <4017BB98.7090203@dsl.pipex.com> <1075368500.18100.7.camel@exile>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075368500.18100.7.camel@exile>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Filip Sneppe <filip.sneppe@uptime.be>
Cc: netfilter@lists.netfilter.org

Filip Sneppe wrote:
> On Wed, 2004-01-28 at 14:39, Andy Furniss wrote:
> 
>>I don't really need them but I pressed Y :-) looks like some headers are 
>>missing from POM cvs of a couple of days old. mms and rtsp, unless my 
>>gcc 2.95.3 is being over pedantic. Vanilla 2.4.24 apart from 2IMQ IMQ 
>>nat and ESFQ patches.
>>
>>In file included from ip_conntrack_standalone.c:28:
>>/home/andy/Sources/kernels/2.4.24/linux-2.4.24/include/linux/netfilter_ipv4/ip_conntrack.h:74: 
>>field `ct_rtsp_info' has incomplete type
>>/home/andy/Sources/kernels/2.4.24/linux-2.4.24/include/linux/netfilter_ipv4/ip_conntrack.h:89: 
>>field `ct_mms_info' has incomplete type
>>make[2]: *** [ip_conntrack_standalone.o] Error 1
>>make[2]: Leaving directory 
>>`/home/andy/Sources/kernels/2.4.24/linux-2.4.24/net/ipv4/netfilter'
>>make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
>>make[1]: Leaving directory 
>>`/home/andy/Sources/kernels/2.4.24/linux-2.4.24/net
>>
> 
> 
> Hi Andy,
> 
> I can't reproduce this with 2.4.24, some pending netfilter patches and
> those two conntrackers. Where can I find those other two patches ?
> 
> Do other connection tracking/nat helpers from patch-o-matic compile
> correctly, or did you just apply those two ?
> 
> If you want, you can send me a diff of your modified 2.4.24 against a
> clean 2.4.24 and a description of what you've done/patched. I'll try
> to see what goes wrong.
> 
> Regards,
> Filip
> 
> 
I just tested on a different machine, same old distro, though.

vanilla 2.4.24(I didn't patch this time) same POM (3 days old now) did 
./runme extra (last time I did make dep first)

and said y to connlimit nth quota u32 connbytes mms-conntrack-nat
rtsp-conntrack string and it said this -

Already applied: connlimit nth quota u32 connbytes conntrack-seqfile 
conntrack_arefcount conntrack_locking conntrack_nonat mms-conntrack-nat 
netfilter-docbook owner-socketlookup owner-supgids ownercmd 
rtsp-conntrack string

make mrproper (should I do this here?)
make menuconfig - said Y to filtering and m to everything in netfilter 
options
make dep
make bzImage
make modules

get the same error.

On the real compile I just backed out of the mms and rtsp did make 
modules again and it's running OK (though I haven't tested the new 
features yet).

Andy.


