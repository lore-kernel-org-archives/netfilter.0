From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: physdev match
Date: Wed, 22 Sep 2004 14:44:42 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a04092204446c0f798d@mail.gmail.com>
References: <1403218a04092203537a1bbd0c@mail.gmail.com>
	<200409221158.19795.gdh@acentral.co.uk>
	<1403218a0409220401158fd1ed@mail.gmail.com>
	<200409221217.11787.gdh@acentral.co.uk>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409221217.11787.gdh@acentral.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Well, the patch had some failures.
I saw it has the physdev in the patch !!


patching file include/linux/netfilter_ipv4/ipt_physdev.h

Will this patch add the physdev match ??
I am thinking about going with a stock kernel !!


On Wed, 22 Sep 2004 12:17:11 +0100, Gavin Hamill <gdh@acentral.co.uk> wrote:
> On Wednesday 22 September 2004 12:01, Mohamed Eldesoky wrote:
> > ummm
> > I was looking at the possibilities.
> > Also, what if I don't want to use ebtables !!
> 
> 'ebtables' is just a round-all term for what became of the 'bridge
> firewalling' code. You don't need to use the 'ebtables' binary at all if all
> you want to do is apply firewall rules on a bridged system.
> 
> However, it remains to be seen whether the ebtables code would even patch
> successfully on an RHEL kernel source, plus if using a 'Real' Red Hat kernel
> is important to you, then you'll obviously not want to recompile at all.
> 
> Unless RHEL already contains the support (look for 'Bridge firewalling
> registered' in the 'dmesg' output from boot time) then you're a bit stuck.
> 
> Of course, all this talk of ebtables is now off topic =)
> 
> Cheers,
> Gavin.
> 
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

