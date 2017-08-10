From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Error in IPSET : Unknown argument `skbinfo'
Date: Thu, 10 Aug 2017 10:44:39 -0500
Message-ID: <20170810154439.GP2027@harrier.slackbuilds.org>
References: <CAA5aLPj4ZA-wDtsW7C+rt7a9X9_T+jrzxWV1pdfCUWYu7jiLTg@mail.gmail.com>
 <alpine.DEB.2.11.1708092049090.31706@blackhole.kfki.hu>
 <CAA5aLPjcUqWruCHoHEdh+sn4ND+VYKeLx7ZCc371DunL9gPP-w@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA5aLPjcUqWruCHoHEdh+sn4ND+VYKeLx7ZCc371DunL9gPP-w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

[ top-posting fixed ]
> On Thu, Aug 10, 2017 at 12:22 AM, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
> > On Wed, 9 Aug 2017, Akshat Kakkar wrote:
> >
> >> my ipset version is 6.32. OS is CentOS 7.3. Kernel is 3.10
> >>
> >> when I execute following command,
> >>
> >>     ipset create foo hash:ip skbinfo
> >>
> >> I get error as
> >>
> >>    ipset v6.32: Unknown argument: `skbinfo'
> >
> > It means that the kernel module does not support the skbinfo 
> > extension.
> >
> > What is revision in description line in the output of
> > `modinfo ip_set_hash_ip`? It should be 0-4 for skbinfo support.
> > 0-3 or less means no skbinfo support in the kernel side.
> >
On Thu, Aug 10, 2017 at 12:16:15PM +0530, Akshat Kakkar wrote:
> Yes. You are right. Its 0-1 for me.
> 
> How can I upgrade?

That would be a CentOS question, mainly.

You could get recent kernel sources and compile your own kernel, and 
likewise compile a newer iptables to match.  Check the file 
Documentation/Changes in the kernel source and see what else you 
need.  Upgrade all that.

Then, cross your fingers and hope it will all work with Red Hat's 
patches and tweaks.

The bottom line is: CentOS is a terrible choice if you want recent
kernel (and other software) features.  The whole point of CentOS is 
to remain behind RHEL, and the whole point of RHEL is to stay years 
behind of software development in the name of "stability".
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
