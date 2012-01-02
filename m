From: Andrew Beverley <andy@andybev.com>
Subject: Re: help with bridged firewall with openvpn
Date: Mon, 02 Jan 2012 15:33:30 +0000
Message-ID: <1325518410.1621.4.camel@andy-laptop>
References: <250999BCC487ED429E1673DCFA26CDCC2A7BDA6E15@postman>
	 <250999BCC487ED429E1673DCFA26CDCC2A7BDA6E16@postman>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325523594;
	bh=jwClQbn7d0PS5qc9Co4HcEsdJyv6dxBcDNtOvQVg5nY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Mime-Version:Content-Transfer-Encoding;
	b=fu23wXBEzlXi5KfZibEZLWP1qMCV7ULVXaBwwu0NehCiD0K0ter4Yj/V9DE2ZX2UF
	 59pDjHAPWGvQ6faGASVKaucZS9o2Cwk0t0KHvTRrx6XPqdfylabTzPvOxjsEgkQ9WD
	 +UZ2802zgFfP/8YGE8taVx+POCnUum3mU9bU24EQ=
In-Reply-To: <250999BCC487ED429E1673DCFA26CDCC2A7BDA6E16@postman>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Barry Smoke <Barry.Smoke@arklegaudit.gov>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Wed, 2011-12-28 at 08:46 -0600, Barry Smoke wrote:
> Most of the online docs I've found deal with bridging, and
> virtualization.  I'm trying to use bridging to link openvpn clients
> with our internal network, without nat(for a voip implementation on
> yealink phones).

<snip>

> however my ping requests never make it to br0.  
> 

I realise that you've solved this now using another script, but just
thought that I'd point out that it's always worth getting your scripts
working with no DROPing of packets (initially).

I noticed that in your rules you had various rules for LOGing and
DROPing, but that the default policies were DROP, so there is always a
chance that some packets could have been silently dropped.

Andy


