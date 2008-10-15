From: Eric Leblond <eric@inl.fr>
Subject: Re: CONNMARK target
Date: Wed, 15 Oct 2008 09:51:40 +0200
Message-ID: <20081015075139.GA14020@khasse.inl.fr>
References: <ab52e4180810121012he399cf3pb7c1a4b9474f872f@mail.gmail.com> <20081013151007.GE4148@khasse.inl.fr> <ab52e4180810150049x39258263k89cf61758ef1133e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ab52e4180810150049x39258263k89cf61758ef1133e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: okahei@gmail.com
Cc: netfilter@vger.kernel.org

On Wednesday, 2008 October 15 at  9:49:01 +0200, okahei@gmail.com wrote:
> On Mon, Oct 13, 2008 at 5:10 PM, Eric Leblond <eric@inl.fr> wrote:
> > Hi,
> >
> > On Sunday, 2008 October 12 at 19:12:58 +0200, okahei@gmail.com wrote:
> >> Hello list.
> >>
> >> I've got a question with CONNMARK target.
> >>
> >> It's possible to mark whole connection playing with this parameter ?
> >>
> >> What i want is when a packet arrives to port 6900 UDP of firewall,
> >> mark it with 0x99, and when the response packet arrives again from DMZ
> >> interface of the firewall, are marked again with 0x99.
> >
> > You can get some information a connmark on the following page :
> >        http://home.regit.org/?page_id=7
> >
> > Basically, what you want to add to your ruleset is :
> > iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
> > iptables -A POSTROUTING -t mangle -j CONNMARK --save-mark
> >
> > First one restore mark when packet arrive (It put connection mark to the
> > pt mark.. Second one save packet mark to connection mark to be able
> > to restore it later (with --restore-mark).
> >
> > BR,
> > --
> > Eric Leblond
> > INL: http://www.inl.fr/
> > NuFW: http://www.nufw.org/
> >
> 
> Hello List.
> 
> I'm in doubt with the /proc/net/ip_conntrack file, becouse i am
> marking packets with 0x87

0x87 is in hexadecimal, this is equal to 135 in decimal ;)

Don't use '0x' prefix if you want to use decimal integer.

BR,
-- 
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/
