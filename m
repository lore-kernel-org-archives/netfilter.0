From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Shortcuts to counting rules?
Date: Thu, 30 Oct 2008 09:40:38 -0700
Message-ID: <4909E386.1000405@hp.com>
References: <4908FDE9.7040006@hp.com> <49090A3D.40102@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49090A3D.40102@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@vger.kernel.org

Philip Craig wrote:
> Rick Jones wrote:
> 
>>Are there any reasonable ways I might relax that requirement that 
>>iptables-dev be present?  Are some of the datastructures used in the 
>>getsockopt() calls "stable enough" to do that that netperf could make 
>>the getsockopt() calls directly without having to pull-in libiptc? 
>>Netperf does not particularly care about the rules themselves, just 
>>their number.
> 
> 
> libiptc is only intended for use by iptables itself.  The fact that
> iptables-dev includes libiptc is a bug IMO.  There's probably some
> applications out that that wrongly depend on it already though.

I can see the appeal to an application since it does provide a nice 
abstraction.

> The getsockopt() calls are part of the linux ABI.  Using them is safe.
> You just need to make sure you handle the case that they aren't
> implemented.

Time to go find their documentation then I suppose.

thanks,

rick jones
