From: vikrant <vikrant@saysnetsoft.com>
Subject: Re: No chain target match by that name
Date: Thu, 05 Jan 2006 12:10:20 +0530
Message-ID: <43BCBF54.4020707@saysnetsoft.com>
References: <d23987670601042039r6bab4299i3fae872424e77dd1@mail.gmail.com>
	<43BCBBD4.9090006@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43BCBBD4.9090006@saysnetsoft.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vikrant <vikrant@saysnetsoft.com>
Cc: netfilter@lists.netfilter.org, Tharindu Rukshan Bamunuarachchi <bsd.tharindu@gmail.com>

vikrant wrote:

> Tharindu Rukshan Bamunuarachchi wrote:
>
>> netfilter@lists.netfilter.org
>>
>> hi all,
>> when i tried to add following rule,
>>
>> $IPTABLES -t nat -N Proxy
>>
>> $IPTABLES -t nat -A Proxy -m iprange --dst-range
>> 100.298.10.9-100.298.10.40 -j RETURN
>>
>> i got following error,
>>
>> iptables: No chain/target/match by that name
>>
>> Please comment,
>>
>> iptable version is 1.2.11
>> kernel version is 2.4.29-lug
>>
>> Regards
>> -- 
>> Tharindu Rukshan Bamunuarachchi
>> all fabrications are subject to decay
>>
>>
>>
>>  
>>
> U need to apply patch for iprange module .Check the following link:-
> _http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-iprange_ 
>
>
>
>
>
>
Download the latest patch-o-matic from ftp://ftp.netfilter.org/pub/ or 
find more updated at svc (http://netfilter.org/downloads.html#svn).

<snip>
Patching Your Kernel with Patch-O-Matic (POM)

Patch-o-matic can be downloaded from the netfilter homepage, 
http://www.netfilter.org/. You will also need the source code for your 
kernel (if you are using a kernel supplied with your distribution, 
install the |kernel-source| package or install a new kernel by 
downloading the latest kernel source code from http://www.kernel.org/) 
and the source code for iptables which you can also download from the 
netfilter homepage. Once you have these, unpack them and execute the 
|runme| script from patch-o-matic as follows:
|$ KERNEL_DIR=<path to the kernel source code> IPTABLES_DIR=<path to the 
iptables source code> ./runme base
|

The script describes each new extension and asks whether or not to patch 
the kernel for it. Once that is finished you will need to recompile the 
kernel, the netfilter kernel modules and the iptables binaries. This is 
outside the scope of this article but you will find useful information 
on the following sites:

<snip>

Thanks
Vikrant

