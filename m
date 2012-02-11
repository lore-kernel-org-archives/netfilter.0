From: SamLT <sam@sltosis.org>
Subject: Re: how to drop a TCP segment with specific sequence
Date: Sat, 11 Feb 2012 10:24:22 +0100
Message-ID: <20120211092421.GC6946@tosh.sltosis.org>
References: <1328760028.2710.5.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sltosis.org; s=mx;
	t=1328952265; bh=GoqPvTY0Kzj60vlvZIoepa7POhg4t+sAshP2L5NWSsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=yBWrsLooFxK1q8cFMgZEgws5n0hBIv0pWruMStIciaYakijCH7UjEiWlEM+frPsi/
	 sWohhIWxn6ogJ9YWTfb8aZ//UXY/Mh0eUD1rUgVCPl9esrtMgBiULbIGb/V+qGRuSE
	 zfgfCvXYzG9yBvuT79JymTm/7moh9VIvdXC7NsmI=
Content-Disposition: inline
In-Reply-To: <1328760028.2710.5.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuwen Dai <yuwen.dai@windriver.com>
Cc: netfilter@vger.kernel.org

On Thu, Feb 09, 2012 at 12:00:28PM +0800, Yuwen Dai wrote:
> Dear all,
> 
> I'm simulating an network environment that some TCP segments are
> missing. So I want to use iptables to drop these segments. How to write
> a rule to drop a segment with a specific sequence number from a host?

I suppose you can start playing around with --u32 ?


> Thanks in advance.
> 
> Best regards,
> Yuwen Dai
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
