From: Andrew Beverley <andy@andybev.com>
Subject: Re: libnfcontrack weirdness
Date: Mon, 02 Aug 2010 20:14:45 +0100
Message-ID: <1280776485.1349.5.camel@andybev>
References: <59381F8FA203F4555FD43BB0@Ximines.local>
	 <1280772623.1349.3.camel@andybev>  <4C57122E.8010108@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1280776506; bh=su1wS5J3gLD8Bv1oKQtmrqU5r+f3MIOc/mSw3
	dmGjxY=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=IcUwC2DX
	nECP/bgphXFyM3SiUkdAn99ziz7tI2uxa8NoR3vlFy0O4qGGp0xJRnCnJtGUjsnnA7v
	7XkLS92Bl4/Kv7+0/TmA+TUdPJRW93TiVTmHSQXvrIoiqd9rJTixSa68K9Ye4L0bQxe
	6zhsOhA6ZenACN/VwEmngMAmcUuXs=
In-Reply-To: <4C57122E.8010108@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org

On Mon, 2010-08-02 at 20:45 +0200, Pablo Neira Ayuso wrote:
> On 02/08/10 20:10, Andrew Beverley wrote:
> > The documentation is sparse, but there are some good examples in the
> > utils folder of the source code. Also, api.c is well commented for each
> > of the functions.
> 
> We should convert that documentation in the source code of api.c to
> doxygen format. It shouldn't take more than one hour to get it done.
> Then, we can put it on the website as we did for libnetfilter_log and
> libnetfilter_queue.
> 
> If someone feels in the mood to do it, you can have a look at the other
> libraries to see how we've done it.

I'd like to give it a go, but it probably wouldn't be for the next
couple of weeks. I'm keen to get into the documentation side of life,
once I've got a couple of other projects out of the way.

Andy


