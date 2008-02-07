From: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Subject: Re: Patch-o-matic+iptables+kernel, which versions fits together?
Date: Thu, 07 Feb 2008 18:21:27 -0200
Message-ID: <47AB6847.4000405@bspu.unibel.by>
References: <2301.5897-15286-1144045463-1202227021@seznam.cz>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2301.5897-15286-1144045463-1202227021@seznam.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

lokiji lokiji wrote:

> i would like to use connlimit module, but i don't know which version of patch-o-matic should i use on which version of kernel and iptables. Could someone help me?
> Thanks a lot
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

Latest kernel & iptables. Connlimit now inside of kernel.

PS But I lazy think about patch of connlimit to bound timeout. While users 
using keep-alive connections - there are too abstract classification (I use 
slowdown "abusers"). IMHO it is easy (in entry listing add one "if" with 
existing "timeout" field, but I use proxy too and first timout need for proxy, 
then I do not do nothing while - I do not know how to do it in squid).

-- 
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
