From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: MASQUERADING problem under iptables 1.2.8 - kernel 2.4.20
Date: 27 May 2003 14:32:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054038773.750.61.camel@tux.rsn.bth.se>
References: <42690.192.168.1.50.1053901090.squirrel@tek.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <42690.192.168.1.50.1053901090.squirrel@tek.homelinux.net>
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
To: duvault@efrei.fr
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-05-26 at 00:18, Julien Duvault wrote:
> Hi,
> 
> I'm contacting you, as I've a problem with netfilter. Let's sum up the
> situation :
> The system I'am reunning is a linux/debian woody, this host is acting as a
> router, and gateway, for my home network over an ADSL link. I used to have
> the default stable iptables package 1.2.6 (if I am not wrong) with kernel
> 2.4.18. Every thing were find, I was happy. I decided to upgrade to kernel
> 2.4.20 and iptables 1.2.8 and all patches. Since that time, I can't use
> anymore the MASQUERADE target with kernel 2.4.20 (the modules are corectly
> loaded ...). The amazing thing is that it perfectly working on kernel
> 2.4.18 with the same version of iptables.
> So is there a bug somewhere in the combination of iptables
> 1.2.8/kernel-2.4.20 ? I don t think so because i didn t find any
> informations about such a problem ... Maybe something happen during my
> compilation of 2.4.20 which make MASQUERADE not working ?
> So if someone here have information, I would be very happy to solve this
> problem.

There are some changes in 2.4.20 that require you to recompile userspace
iptables against 2.4.20 in order to get it working.

Once you do that, NAT and the owner match will start working again.

-- 
/Martin

