From: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Subject: Re: Iptables and Kernel
Date: Sun, 18 Apr 2004 09:27:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4082AC74.2070601@rd.arkonnetworks.com>
References: <407A27B2.4000101@rd.arkonnetworks.com> <36070.9628942006$1081802745@news.gmane.org> <4082A465.9080700@rd.arkonnetworks.com> <200404181206.01131.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404181206.01131.Alistair@nerdnet.ca>
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
To: netfilter@lists.netfilter.org

>>I'm trying to compile p-o-m-ng with 2.6.5 now. It asks for iptables
>>sources. I thought p-o-m-ng patches applies to the kernel only. Do I
>>need to recompile iptables too? There are many patches in p-o-m-ng. I
>>only need the h323 patch for Netmeeting to work correctly? The README
>>from p-o-m-ng recommends the following command to patch the kernel,
>>
>># KERNEL_DIR=/usr/src/linux ./runme -pending
>>
>>Do I need to worry about rejects and offsets?
> 
>Yes you need to apply some of the patches in pom-ng against the
>iptables sources. Not only do we change the kernel code, but we have
>to make some changes to the iptables tools as well to get some of
>to work

Thank you so much for your quick response. I've iptables RPM already 
installed with Mandrake. I guess I will need to remove that first before 
compiling the new iptables. I plan to use Shorewall to configure my 
firewall. Will removing iptables RPM break anything? I see iptables is 
included as startup option during boot under Mandrake. After recompiling 
iptables, do I need to reconfigure all those options?

>For the record, with both 2.6.3. and 2.6.5 from gentoo with the gaming 
>options, iptables 1.2.9 and pom-ng play nice for most things.  
> 
>If something doesn't apply against plain jane kernel code, there is 
>likely a need to holler at the maintainer of the patch.

Regards,
Norman

