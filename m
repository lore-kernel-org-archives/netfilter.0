From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Most stable firewall distro
Date: Wed, 3 Jul 2002 23:34:01 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703223403.RTWE295.mta03-svc.ntlworld.com@there>
References: <200207031723.AA92536958@mail.ev1.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207031723.AA92536958@mail.ev1.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 03 July 2002 11:23 pm, riffraff wrote:

> ---------- Original Message ----------------------------------
> From: "Miguel Laborde" <miguel.laborde@canada.com>
> Date: Wed, 3 Jul 2002 18:22:38 -0400
>
> >Hello all,
> >	I have a question here for those of you who use iptables heavily in a
> >production environment. Right now I am about to replace a older Mandrake
> >(release 7.2) with an updated linux firewall however before I go ahead and
> >do that, I'm interested in knowing what you people consider the most
> > stable distribution for a linux firewall.
> >	I realize that the underlying OS and iptables software is common across
> > all distributions however some distributions apply patches which others
> > don't, and as result might be better suitable as a firewall.
> >
> >
> >	Thanks for your time,
> >				Miguel
>
> I just used redhat 7.0 (I think, it's been a while), and removed everything
> that was completely unnecessary, then compiled a whole new kernel (I had
> to; I'm using the bridge-netfilter patch).  So, it isn't much of a redhat
> anymore, just uses redhat paths and rpm.

I agree with this approach.   A firewall shouldn't really be any recognisable 
distro, because distros basically differ in all the add-ons they include 
around the kernel, nearly all of which you should not have on a firewall.

And, as suggested above, you really ought to compile your own kernel for a 
firewall, too, so it contains what you want and doesn't contain what you 
don't want, therefore you start from ftp://ftp.kernel.org and 'make config' 
(or whichever variation of that you prefer).

The 'distro' I would really like to see people use for firewalls is Linux 
From Scratch, because this is expressly designed to contain only the tools 
you choose for a specific job, and not a whole bunch that someone else 
thought might come in handy one day.....

Not the easiest thing to play with though, admittedly.

http://www.linuxfromscratch.org

 

Antony.

