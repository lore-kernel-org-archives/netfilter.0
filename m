From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Wrapper script for ipset listing
Date: Wed, 9 Jan 2013 12:52:32 +0100
Message-ID: <20130109115232.GA19321@1984>
References: <50E84F5E.8060704@airpost.net>
 <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr>
 <50E8F495.40307@airpost.net>
 <alpine.LNX.2.01.1301062030320.14070@nerf07.vanv.qr>
 <alpine.DEB.2.00.1301070852290.591@blackhole.kfki.hu>
 <50ED13BC.6010005@airpost.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <50ED13BC.6010005@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Born Without <blackhole@airpost.net>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Jan Engelhardt <jengelh@inai.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Jan 09, 2013 at 07:52:44AM +0100, Born Without wrote:
> On 07.01.2013 08:59, Jozsef Kadlecsik wrote:
> >On Sun, 6 Jan 2013, Jan Engelhardt wrote:
> >
> >>On Sunday 2013-01-06 04:50, Born Without wrote:
> >>>>>As I was missing those features in the ipset set listing capabilities:
> >>>>>
> >>>>>- show sum of set members
> >>>>>- suppress listing of headers
> >>>>>- choose a delimiter character for separating member entries
> >>>>>
> >>>>>I wrote a little wrapper script (for the bash shell) to support them.
> >>>>>For those who like, you'll find it attached.
> >>>>
> >>>>There's libipset, with which this task should be achievable to the
> >>>>maximum customizable degree without involving ugly text parsing with sh.
> >>>
> >>>good you mention libipset, because not even the man page does, nor does any
> >>>documentation or similar exist.
> >>
> >>I have taken Joszef into Cc..
> 
> [...]
> 
> >
> >In order to parse the output produced by ipset, one should take into
> >account the followings:
> >
> >- New header elements may appear but the header part is always
> >   started by "Name:" and ended by "Members:".
> >- New value parameters may appear but those are appended to the existing
> >   ones.
> >
> >If those "rules" are taken into account, then shell/perl/etc scripts can
> >safely parse the output.
> >
> 
> Thank you Joszef for that information.
> I've taken it into account and adapted the script.
> Also added:
> -a parameter to act just like 'ipset list', but with whitespace as
> default delim.
> comments and examples.
> 
> Best regards

> #!/bin/bash

Suggestion: Some explicit header with licensing terms of your script
is a good idea if you want to share things, otherwise the law in most
countries defaults to "all right reserved".

And if you use the same license than ipset, it may help Jozsef to
consider adding that to some contrib directory. Or you can just
publish it in your personal website.
