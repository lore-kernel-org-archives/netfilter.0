From: <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: RedHat 9: Bridging Firewall
Date: Fri, 7 Nov 2003 10:07:48 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071007.hA7A7mo309471@alf1.lmb.internal>
References: <20031107054614.66971.qmail@web21509.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031107054614.66971.qmail@web21509.mail.yahoo.com> from Sparc
 Urani at "Nov 6, 2003 09:46:14 pm"
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
To: Sparc Urani <dllcu@yahoo.com>
Cc: netfilter@lists.netfilter.org

Do you want the full bridging functions (spanning tree etc)?
We set up a 'bridging' firewall a couple of years ago using
proxy-arp. This was so that we could just transparently insert
the firewall  between our LAN and the local University
router. So far, its worked faultlessly - we get full filtering
and NAT functionality with standard iptables kernel.

But of course we dont get the full bridging capabilities
(whatever they may be).

Cheers,
Terry


>everything about redhat look up here:
> 
>https://www.redhat.com/docs/manuals/linux/
>
>marcus earle <mowtnman@yahoo.com> wrote:
>I am trying to build a Firewall using RedHat 9 (Kernel 2.4.20-8) with both of my interfaces in a bridging mode - neither interface being assigned an IP address.
>This is exactly how on a honeypot would function. But there is definately a difference between the theory of a Honeypot and actually implementing one and getting it to function properly...
> 
>Since I am fairly new to the Linux OS, it is a  little bit harder to know where to look to get the info I need and where to make the proper changes in the OS...
>My understanding is that RH9 has the firewalling functions built in, but I am not sure what I need to do in order to make it bridge , or how/where to apply the ruleset.
> 
>Does anyone know how to do this?
> 
>Thanks, is advance for any input
>
>
>---------------------------------
>Do you Yahoo!?
>Exclusive Video Premiere - Britney Spears
>
>sparc
>
>---------------------------------
>Do you Yahoo!?
>Protect your identity with Yahoo! Mail AddressGuard


