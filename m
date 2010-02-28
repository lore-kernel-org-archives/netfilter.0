From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Is there some reason why IPSET kernel modules are not in
 kernel source?
Date: Sun, 28 Feb 2010 00:37:56 -0600
Message-ID: <20100228063756.GC10293@minipax>
References: <4B857D3F.6070901@gatworks.com>
 <alpine.DEB.2.00.1002242237090.7439@blackhole.kfki.hu>
 <4B86B562.5050605@gatworks.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B86B562.5050605@gatworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> On 02/24/2010 04:40 PM, Jozsef Kadlecsik wrote:
> >>Seems like iptable modules are included in kernel source.
> >>>  Not so with the IPSET modules. Is this something political?
> >Nothing political. ipset needs to be rewritten before
> >submitting, in order to avoid backward-forward compatibility
> >issues in the future. That makes me say "no submitting yet".

On Thu, Feb 25, 2010 at 12:37:38PM -0500, U. George wrote:
> Is that the ipset kernel modules? Its been at least 4 years. Fedora
> et al just wont accept the program ipset until the iptable / ipset
> kernel mods are in the 'upstream' kernel source.

Then your solution is to package and compile it yourself. FWIW I do
think that there are numerous distributions which package ipset.

> Some reason as to why u cannot repair the ip_set kernel-modules
> as new kernels are released?

I would not ask such a thing. While I am sure you did not intend
this, it comes across as being ungrateful and demanding. Free
software contributors often are doing it on their own time. Be
thankful for what we have, and try to show it. :)

That said, I too will be grateful when ipset is ready for the
mainstream kernel. ;)
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
