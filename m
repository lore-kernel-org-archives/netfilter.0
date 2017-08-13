From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nft and sip with debian 9 stretch
Date: Sun, 13 Aug 2017 20:55:21 +1000
Message-ID: <20170813105521.GA18114@dimstar.local.net>
References: <b4d31d0b-9f15-9b2a-0804-6ad6fd827cb9@herzog-systems.de>
 <1502276814.18029.1.camel@regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1502276814.18029.1.camel@regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Wed, Aug 09, 2017 at 01:06:54PM +0200, Eric Leblond wrote:
> Hello,
>
> On Wed, 2017-08-09 at 12:36 +0200, Marc Neudorfer wrote:
> > Hello,
> >
> > i am currently using Debian 9 (nft 0.7, kernel 4.9).
> > I tried to use nft as primary firewall for my network, but there are
> > a=A0
> > lot of problems with our sip/voip phones (phones are ringing, no
> > voice=A0
> > -> ct-problem)
> > The wiki says, the ct-helpers are only available with nft 0.8 and
> > kernel=A0
> > 4.12.
> > Is there any known method to get sip-phones to work with nft 0.7? Or=A0
> > some kind of workaround?
>
> Indeed, connection tracking helpers assignation can only be used with
> nft 0.8 and Linux 4.12.
>
> You can set automatic assignement with:
> echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper
>
> BR
> --
> Eric Leblond <eric@regit.org>
> Blog: https://home.regit.org/

Hi Eric,

Where is nft 0.8?

I just built the latest git pulls og nfatbles and libnftnl but nft still
identifies as 0.7.

Cheers ... Duncan.
