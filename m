From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: [nftables][ipv6] Header examination
Date: Fri, 6 Oct 2017 09:02:57 +1100
Message-ID: <20171005220257.GA9192@dimstar.local.net>
References: <5709c6d1-1f6f-ac3a-2b10-05b3261b496d@wagsky.com>
 <F66AB049-624D-4227-8351-8599F517FC8C@nativemethods.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <F66AB049-624D-4227-8351-8599F517FC8C@nativemethods.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Oct 02, 2017 at 12:20:44PM -0400, J Doe wrote:
>
> > On Oct 1, 2017, at 11:40 AM, Jeff Kletsky <netfilter@allycomm.com> wrote:
> >
> > On a side note -- If anyone else is wondering why the locally generated
> > man page isn't being installed, apparently the docbook2x package is
> > required or the generation of the man page is silently skipped.
>
> Hi Jeff,
>
> I experienced the same thing when building nftables 0.7, which is the tar.gz
> version on the website.  Does this also happen on checkout from git ?
>
> Thanks,
>
> - J

Builds fine for me, but I have linuxdoc-tools installed (provides
/usr/bin/docbook2x-{man,texi})

Cheers ... Duncan.
