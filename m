From: Andrew Beverley <andy@andybev.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Sun, 28 Oct 2012 08:20:18 +0000
Message-ID: <1351412418.2740.5.camel@andylaptop>
References: <5088717B.6080300@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5088717B.6080300@wildgooses.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1351412427;
	bh=RHdALlwHO+xkTnI4X6nxK/BVMCaes12G20hIbQPHDVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=IxxQxF4U498J8eP0APPxndBgLADMmuzf7MuK335A0812/EmnbzzELCRfBFSqrvl52
	 M1QXH8pYHULZ+wNgO6/Uhbx766d+vaHFfQPhi1cSGb/fk9kXTNQcqm7YCczybmzM/W
	 liY5sA1OiK4D3cIulTLQV74iJH/GngrTGwSCNDE8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org, ntop-dev@unipi.it, "G. Elian Gidoni" <geg@gnu.org>

On Wed, 2012-10-24 at 23:53 +0100, Ed W wrote:
> Hi all.  There is an interesting project that was called opendpi 
> (originally by ipoque GmbH) and recently been forked and maintained by 
> the ntop guys under the nDPI label.  It offers a new and currently 
> maintained layer 7 (L7) packet identification library.

That's great news.

I had a play with l7-filter some time ago, which I assume is similar to
nDPI. How do the 2 projects compare?

I have to admit that I only had limited success with l7-filter, although
it no longer appears to be maintained anyway.

Andy



