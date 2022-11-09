From: Ian Pilcher <arequipeno@gmail.com>
Subject: Re: nftables and IPv6 prefix delegation (regression vs ip6tables)
Date: Wed, 9 Nov 2022 08:19:14 -0600
Message-ID: <93c41631-7581-3a75-f59f-1eb3951e79c0@gmail.com>
References: <tk16fd$hd2$1@ciao.gmane.io>
 <20221103231245.GD29268@breakpoint.cc> <636AA7E7.6090404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsLmbxeDpls3IZLGSNd7oyELi0H0PWVZNKNu+nZoAoM=;
        b=e2mqAuzUVsleGPzF0GAFpDR9sYIqceSKqbCUU5RPkHIld4703ODAaq97r6Shg6YhGL
         qG8HfMG7spovhJ1b2uZCFJxcj+uyzbqODWZHbya++OOgJGpnfosvzZyk6/f+sPJKnUU7
         z2Fj2NVtC464zPzBeLFU+1bGVZHLrt8J+zJfENmx0XFQBqJ6F6y0NauKynMWPmelIxhQ
         4sRZd88E6lnI/XybwUj3I3fjbt5KTAHP7vTx4jP27ae14bxgeUDkdUTPfqqfmW0f8oV3
         uOLSQzJVKVsD7m71y42yooQAph942VDpKZgrQ/J0ox6z5R/vc879mpV0NI7OOGfNeEOo
         httw==
Content-Language: en-US
In-Reply-To: <636AA7E7.6090404@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordon Fisher <gordfisherman@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 11/8/22 13:03, Gordon Fisher wrote:
> Out of curiosity, why does ``0:0:0:c8::1`` get translated into 
> ``::c8:0:0:0:1`` ?

At a guess, inet_ntop() is simply choosing the longest string of zeroes
in the address to replace with '::'.

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================

