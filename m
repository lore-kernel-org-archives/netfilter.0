From: Norman Zhang <norman.zhang@rd.arkonnetworks.com>
Subject: Re: Iptables and Kernel
Date: Sun, 18 Apr 2004 21:34:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408356CA.4030604@rd.arkonnetworks.com>
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

>I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- they work
>for me -- but I'm referring to a home lan ond only one netmeeting seesioon 
>from the LAN  -- we haven't tried multiple sessions from inside the lan ... 
>either to the same netmeeting sessioon or to different ones.

Sorry it is me again. I tried to compile pomng using

# KERNEL_DIR=/usr/src/linux ./runme pending
# KERNEL_DIR=/usr/src/linux ./runme base
# KERNEL_DIR=/usr/src/linux ./runme extend

but couldn't find h323-conntrack-nat patch being offered. I did see 
owner-socketlookup mention something about H.323. May I ask how do I 
applied h323-conntrack-nat patch to iptables and kernel-2.6.5 alone? I 
can see the subfolder h323-conntrack-nat under pomng.

Regards,
Norman

