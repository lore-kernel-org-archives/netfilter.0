From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nf_nat_sip with CT target
Date: Fri, 15 Feb 2013 00:57:06 +0100
Message-ID: <20130214235706.GA20199@localhost>
References: <511C16B6.3000607@centurion.net.nz>
 <20130214130556.GA3788@localhost>
 <511D3634.2060809@centurion.net.nz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <511D3634.2060809@centurion.net.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Reurich <daniel@centurion.net.nz>
Cc: netfilter@vger.kernel.org

On Fri, Feb 15, 2013 at 08:08:36AM +1300, Daniel Reurich wrote:
> On 15/02/13 02:05, Pablo Neira Ayuso wrote:
> >On Thu, Feb 14, 2013 at 11:41:58AM +1300, Daniel Reurich wrote:
> >>Hi,
> >>
> >>I'm having trouble figuring out how to set up nf_nat_sip when using
> >>the CT target for loading nf_conntrack_sip.
> >>
> >>The CT target for sip works fine.
> >>
> >>What I'm struggling with is finding any documentation that indicates
> >>how to add the fucntion of nf_nat_sip as well.
> >>
> >>Do I still need to manually load the nf_nat_sip module or can it be
> >>loaded by the conntrack helper or some similar method?
> >
> >modprobe nf_nat_sip should be enough.
>
> I was under the impression that manually loading the modules was
> deprecated and they should autoload either via using a helper or the
> CT target.

The sip modules need to be loaded, no changes in that regard. If you
disable automatic helper assignment, you have to use the CT target.
