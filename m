From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: Time Patch on 1.2.6a
Date: Sat, 14 Dec 2002 12:39:38 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212141239.38986.fabrice@netfilter.org>
References: <F81QkQiHR9dIzQZt9KA0000ca21@hotmail.com>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F81QkQiHR9dIzQZt9KA0000ca21@hotmail.com>
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
To: Huw Dixon <huwdixon@hotmail.com>, netfilter@lists.netfilter.org


Hello,

On Saturday 14 December 2002 12:09, Huw Dixon wrote:
> Hi - I'm trying to get the TIME extension patched in to my iptables. I"m
> running 1.2.6a. on RH 7.3. I've went thru the patch-o-matic via the 1.2.6a
> download and via the POM extensions howto documentation but I cant quite
> seem to get things going. At one point I did get to the TIME patch in one
> of my POM attempts. The option shows when I run make menuconfig. I've
> recompiled but when I use the time match in my rules i get the message
> regarding /usr/local/lib/iptables/libipt_time.so file not found. Can
> someone provide me with some ideas on what I may be missing in getting this
> patch applied?

You need to recompile & install iptables after that your kernel has been patched.
Since you run RH, make sure also that iptables RPM package is not installed.

# rpm -q iptables
package iptables is not installed

If it is, just remove it, and re-compile & reinstall iptables.

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

