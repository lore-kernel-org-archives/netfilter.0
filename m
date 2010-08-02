From: Andrew Beverley <andy@andybev.com>
Subject: Re: libnfcontrack weirdness
Date: Mon, 02 Aug 2010 19:10:23 +0100
Message-ID: <1280772623.1349.3.camel@andybev>
References: <59381F8FA203F4555FD43BB0@Ximines.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1280772645; bh=hVW3QHTcRvSGYyNuctf7Yhr6BcKYLXGdfCMUM
	5H0/9M=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=wBEKen+F
	oZWIVce0hKrv1A0xeMjyMpMORUGK69/48H8yMUS5lQMjVMEw2lVguMtrwXxRDmxTKTv
	gpqEyF8kuwp0hzm0DEWfAMdDs79RU2zze8fvVreZauTEXk03+UQkklDMA1G57eLWmqd
	CCWjOOsYonaX0dLJkk0VxVGxCVSj8=
In-Reply-To: <59381F8FA203F4555FD43BB0@Ximines.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter@vger.kernel.org

On Mon, 2010-08-02 at 17:20 +0100, Alex Bligh wrote:
> I may be doing something stupid here, but I can't seem to get information
> on an existing connection through libnfconntrack.
> 
> Code extract below. When passed a 4-tuple describing an existing connection,
> it prints "Found connection", when passed other stuff, it does not. So
> that much is working.
> 
> However, no ATTR_ stuff relating to the connection is printed out
> except for ATTR_ORIG_PORT_* which are synonyms of what has been
> set with nfct_set_attr.

You have to use a callback function to read any information back. Before
your nfct_query you should use nfct_callback_register to register a
callback function, which should contain your get_attr calls.

> I am having difficulty finding documentation for this,
>

The documentation is sparse, but there are some good examples in the
utils folder of the source code. Also, api.c is well commented for each
of the functions.

Regards,

Andy


