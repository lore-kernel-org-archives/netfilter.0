From: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Subject: Re: Iptables and Kernel
Date: Sun, 18 Apr 2004 08:53:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4082A465.9080700@rd.arkonnetworks.com>
References: <407A27B2.4000101@rd.arkonnetworks.com> <200404121822.03874.Antony@Soft-Solutions.co.uk> <407AE8E8.7000102@rd.arkonnetworks.com> <36070.9628942006$1081802745@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <36070.9628942006$1081802745@news.gmane.org>
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

>>>>I just downloaded 2.6.5, may I ask where should I check to see if h323
>>>>modules are included? On www.netfilter.org, I see pom-20031219 and
>>>>pomng-20040302. Is it safe to assume, that pomng includes pom?
>>>
>>>You might find the following postings from the archives relevant here:
>>>
>>>http://lists.netfilter.org/pipermail/netfilter/2003-December/049362.html
>>>
>>>http://lists.netfilter.org/pipermail/netfilter/2003-December/049310.html
>>
>>Thank you so much. From the postings, it looks like 2.6.x is still
>>lacking some features that are available in 2.4.x. I'm setting up a
>>firewall with NAT and hoping to able to do Netmeeting and MSN Instant
>>Messenger. Would 2.4.x's netfilter patches sufficient to protect my LAN?
> 	
>I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- they work
>for me -- but I'm referring to a home lan ond only one netmeeting seesioon 
>from the LAN  -- we haven't tried multiple sessions from inside the lan ... 
>either to the same netmeeting sessioon or to different ones.

I'm trying to compile p-o-m-ng with 2.6.5 now. It asks for iptables 
sources. I thought p-o-m-ng patches applies to the kernel only. Do I 
need to recompile iptables too? There are many patches in p-o-m-ng. I 
only need the h323 patch for Netmeeting to work correctly? The README 
from p-o-m-ng recommends the following command to patch the kernel,

# KERNEL_DIR=/usr/src/linux ./runme -pending

Do I need to worry about rejects and offsets?

Regards,
Norman

