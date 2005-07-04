From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: /etc/sysconfig/iptables does not load on reboot
Date: Mon, 4 Jul 2005 09:37:25 -0500
Message-ID: <200507040937.25404.rob0@gmx.co.uk>
References: <NEBBKBPLMLNABNADCIPAAEGKBDAB.dleangen@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAAEGKBDAB.dleangen@canada.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: NetFilter <netfilter@lists.netfilter.org>

On Monday 04 July 2005 09:17, David Leangen wrote:
> Thanks for all the helpful hints!
>
> > Same kernel?
>
> goodhost=2.6.9-1.667smp
> badhost=2.6.9-1.667
>
> Not sure what the "smp" is.

Probably "symmetric multi-processor", a kernel enabled for multiple 
CPU's. It could be that you have found a Fedora bug.

> I will try loading on badhost the version with the same kernel on
> goodhost and see if that fixes the problem.

If badhost only has one CPU it's wasteful to have SMP support, but as 
implied above, it could be a kernel configuration bug relating to the 
non-SMP kernel.

> Now that you've helped me to realise that I'm not using the same
> kernel, I'll try that first, and if the problem persits go on to all
> your other helpful suggestions. My only problem is that I won't have

I'm sticking to my guess. The rules which did not load (if I read it 
correctly from the diff) all used --protocol extensions.

I know little of netfilter / iptables internals. I don't know where 
those extensions load from ... [WHAM] ouch, I was just hit by an 
inspiration.

Firewall loads before mount -a; probably at that point only the root 
filesystem is mounted. If the match extensions are on /usr, we can't 
get to them. I bet badhost has a separate /usr partition and goodhost 
has /usr on the rootfs.

If so, yes, this is an OS bug. And don't just write set to a file, do 
"mount > /root/firewall-mounted-fs" too. (I hope /root isn't a symlink 
or otherwise on a different FS.)

> Mother's maiden name: Ima Galible

:)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

