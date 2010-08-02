From: Alex Bligh <alex@alex.org.uk>
Subject: Re: libnfcontrack weirdness
Date: Mon, 02 Aug 2010 23:29:42 +0100
Message-ID: <BE4D961E8D8AD306DA51826B@nimrod.local>
References: <59381F8FA203F4555FD43BB0@Ximines.local>
 <1280772623.1349.3.camel@andybev>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1280772623.1349.3.camel@andybev>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org, Alex Bligh <alex@alex.org.uk>



--On 2 August 2010 19:10:23 +0100 Andrew Beverley <andy@andybev.com> wrote:

> You have to use a callback function to read any information back. Before
> your nfct_query you should use nfct_callback_register to register a
> callback function, which should contain your get_attr calls.

Thanks. I got this working in the end. However, somewhat bizarrely
the relevant information (the internal port number) in the callback is
returned in ATTR_ORIG_SRC_PORT (etc.), despite this being what is
searched on (the external port number). I am a bit confused by this,
but it seems to work.

>> I am having difficulty finding documentation for this,
>
> The documentation is sparse, but there are some good examples in the
> utils folder of the source code. Also, api.c is well commented for each
> of the functions.

Thanks. Just to give you a clueless newbie's point of view, I was trying
to find either a web page, or a manpage. Doxygen would clearly help
with the latter. Even a README file that explicitly pointed at api.c
if that's where to look (the current reference is somewhat cryptic -
I thought it was to the .h files) would be a lot better than a poke in
the eye.

-- 
Alex Bligh
