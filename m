From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: mms and rtsp patches = make modules fail
Date: Fri, 30 Jan 2004 12:44:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <401A51B9.6090800@dsl.pipex.com>
References: <4017BB98.7090203@dsl.pipex.com>	<1075368500.18100.7.camel@exile>  <40190E1F.6090700@dsl.pipex.com> <1075422674.17013.8.camel@exile>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075422674.17013.8.camel@exile>
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
> Hi,
> 
> On Thu, 2004-01-29 at 14:43, Andy Furniss wrote:
> 
>>I just tested on a different machine, same old distro, though.
>>
>>vanilla 2.4.24(I didn't patch this time) same POM (3 days old now) did 
>>./runme extra (last time I did make dep first)
>>
>>and said y to connlimit nth quota u32 connbytes mms-conntrack-nat
>>rtsp-conntrack string and it said this -
> 
> 
> With these patches, my 2.4.24 compiles fine when doing a 
> "make SUBDIRS=net/ipv4/netfilter modules"
>  
> 
>>Already applied: connlimit nth quota u32 connbytes conntrack-seqfile 
>>conntrack_arefcount conntrack_locking conntrack_nonat mms-conntrack-nat 
>>netfilter-docbook owner-socketlookup owner-supgids ownercmd 
>>rtsp-conntrack string
> 
> 
> Where do conntrack-seqfile, conntrack_arefcount, and these other
> patches come from ? You must have selected them at one point in
> time during a POM run, as they don't get applied automatically.

I've just retested with a new cvs pulled iptables and patch-o-matic-ng.

They appear up to conntrack_nonat when I ./runme extra and select just 
connbytes, netfilter-docbook appears after mms-conntrack-nat and the 
others appear after saying n to the next option.
In fact if I do it again with a fresh kernel tree they appear even if I 
get no for everything.

I still get the error from fresh cvs and kernel tree, I do -

make mrproper
make dep
./runme extra in patch-o-matic-ng enter kernel dir (also tried export first)
just say y to connbytes mms rtsp.
make mrproper
make menuconfig y to network packet filtering
say m/y to everything except last two in netfilter options.
make dep
make SUBDIRS=net/ipv4/netfilter modules
error

Andy.



