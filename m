From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Iptables and Kernel
Date: Mon, 19 Apr 2004 08:48:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404190848.14662.Alistair@nerdnet.ca>
References: <407A27B2.4000101@rd.arkonnetworks.com> <36070.9628942006$1081802745@news.gmane.org> <408356CA.4030604@rd.arkonnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408356CA.4030604@rd.arkonnetworks.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On April 19, 2004 04:34 am, Norman Zhang wrote:
> >I'm running 2.6.3. with iptables 1.2.9 and p-o-m-ng h323 patch -- they
> > work for me -- but I'm referring to a home lan ond only one netmeeting
> > seesioon from the LAN  -- we haven't tried multiple sessions from inside
> > the lan ... either to the same netmeeting sessioon or to different ones.
>
> Sorry it is me again. I tried to compile pomng using
>
> # KERNEL_DIR=/usr/src/linux ./runme pending
> # KERNEL_DIR=/usr/src/linux ./runme base
> # KERNEL_DIR=/usr/src/linux ./runme extend
>
> but couldn't find h323-conntrack-nat patch being offered. I did see
> owner-socketlookup mention something about H.323. May I ask how do I
> applied h323-conntrack-nat patch to iptables and kernel-2.6.5 alone? I
> can see the subfolder h323-conntrack-nat under pomng.

	Okay -- I'm a twit --- I'd assumed since my loadup script was completed 
without errors that things had worked all the way through ... looking again 
it seems that the h323 stuff only applies against 2.4.x kernels -- Joseph K.
hasn't ported it -- likely because its slightly hackish .. And Lord KNOWS why
netmeeting is working through my firewall ... other than the fact of a good 
old ESTABLISHED RELATED rule ... I do know that it only works outbound, if 
someone wants to call into the LAN they have to call on a specific port and I 
have that port forwarded to the destination host.

	As such, this is Yet Another Thing I might look at.


	Alistair Tonner

>
> Regards,
> Norman

