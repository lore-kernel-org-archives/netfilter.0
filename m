From: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Subject: Re: Iptables and Kernel
Date: Wed, 21 Apr 2004 08:56:02 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40869992.10709@rd.arkonnetworks.com>
References: <407A27B2.4000101@rd.arkonnetworks.com> <36070.9628942006$1081802745@news.gmane.org> <408356CA.4030604@rd.arkonnetworks.com> <200404190848.14662.Alistair@nerdnet.ca> <4083E8FC.8070008@rd.arkonnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4083E8FC.8070008@rd.arkonnetworks.com>
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

>>> Sorry it is me again. I tried to compile pomng using
>>>
>>> # KERNEL_DIR=/usr/src/linux ./runme pending
>>> # KERNEL_DIR=/usr/src/linux ./runme base
>>> # KERNEL_DIR=/usr/src/linux ./runme extend
>>>
>>> but couldn't find h323-conntrack-nat patch being offered. I did see
>>> owner-socketlookup mention something about H.323. May I ask how do I
>>> applied h323-conntrack-nat patch to iptables and kernel-2.6.5 alone? I
>>> can see the subfolder h323-conntrack-nat under pomng.
>>
>>     Okay -- I'm a twit --- I'd assumed since my loadup script was 
>> completed without errors that things had worked all the way through 
>> ... looking again it seems that the h323 stuff only applies against 
>> 2.4.x kernels -- Joseph K. hasn't ported it -- likely because its
>> slightly hackish .. And Lord KNOWS why netmeeting is working through
>> my firewall ... other than the fact of a good old ESTABLISHED RELATED
>> rule ... I do know that it only works outbound, if someone wants to
>> call into the LAN they have to call on a specific port and I have that
>> port forwarded to the destination host.
> 
> I'm now using kernel 2.4.26. Now when I run
> 
> # KERNEL_DIR=/usr/src/linux ./runme extra
> 
> I do see h323-conntrack-nat patch. When I do a 'make xconfig' for the 
> kernel source, under Networking/Netfilter... I can't find the H.323 
> option. But other options like ECN, ..., etc. are available. Is this 
> correct?

I found the cause, for some apparent reason, the option is added to the 
configurable option under Networking/Netfilter. But the patch is applied 
to net/ipv4/netfilter/. So when in and added the entry myself to make it 
configurable under Config.in. I hope I did it right, now I'm just trying 
to figure why kernel stalls when it boots.

Regards,
Norman


