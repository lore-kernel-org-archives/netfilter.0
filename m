From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: RE: Patch-o-matic+iptables+kernel, which versions fits together?
Date: Thu, 7 Feb 2008 14:02:58 -0500
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7E58D@ASM220.aspen.com>
References: <47AB6847.4000405@bspu.unibel.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <47AB6847.4000405@bspu.unibel.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Dzianis Kahanovich
> Sent: Thursday, February 07, 2008 3:21 PM
> To: netfilter@vger.kernel.org
> Subject: Re: Patch-o-matic+iptables+kernel, which versions fits
together?
> 
> lokiji lokiji wrote:
> 
> > i would like to use connlimit module, but i don't know which version
of
> patch-o-matic should i use on which version of kernel and iptables.
Could
> someone help me?
> > Thanks a lot
> > -
> > To unsubscribe from this list: send the line "unsubscribe netfilter"
in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >
> 
> Latest kernel & iptables. Connlimit now inside of kernel.
> 
> PS But I lazy think about patch of connlimit to bound timeout. While
users
> using keep-alive connections - there are too abstract classification
(I
> use
> slowdown "abusers"). IMHO it is easy (in entry listing add one "if"
with
> existing "timeout" field, but I use proxy too and first timout need
for
> proxy,
> then I do not do nothing while - I do not know how to do it in squid).
> 
> --
> WBR,
> Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter"
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


So are you saying I don't have to recompile either of them or just
recompile iptables after patching it?
