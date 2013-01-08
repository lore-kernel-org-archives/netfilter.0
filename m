From: Darius Jahandarie <djahandarie@gmail.com>
Subject: Re: Limits higher than 10000/sec
Date: Mon, 7 Jan 2013 21:13:13 -0500
Message-ID: <CAFANWtUCkZWEAeqkLDbdZdWs6dhxzTPzkr4j0rG05fVsS6616A@mail.gmail.com>
References: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com>
	<alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=D3DCBjQqSim1KvX7KL3BffqHJRwGA+sRbC6coPdHvU4=;
        b=rjawwh2O5yt60pxDn5wcatwezjB0HXc48PzP3JjKJE0AF/3C4+tFjemWDPYBbisSRK
         9bVjJ+MY+jCO3IuK/wDGN415YqvTRlbiUh5ETUZbnp8jh1q3Yjr0Y6CDjxS43hDE6Bjj
         pGLVfwg0eESnrNb+cGxN3+FGDJMRh3Y15Nj5U7Sn4jOL9yBxp9IAtkO0zBjez7tMd1TB
         gdw+9RigoHezIW906HEzrzbKVIzsvsBFceT6pcvNA144bNtjFFKf1bYnXd1QuSXcWCFr
         3E7YMJr42KExaqgYiPJpFdEhRlcZk402frA7HmZORMrZALoXK+3XSXtyouUQ9f3bybhx
         uInA==
In-Reply-To: <alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On Sun, Dec 9, 2012 at 5:41 PM, Jan Engelhardt <jengelh@inai.de> wrote:
> On Sunday 2012-12-09 21:05, Darius Jahandarie wrote:
>
>>Hi all. I currently have an iptables rule like follows in the raw table:
>>
>>-A PREROUTING -p tcp --dport 1234 --syn -m limit --limit 10000/sec
>>--limit-burst 10000 -j ACCEPT
>>-A PREROUTING -p tcp --syn -j DROP
>>
>>Does anyone have thoughts on a way to get some sort of rate-limiting
>>(TBF or otherwise) that can handle more PPS than the limit module
>>while still being as efficient as possible?
>
>  -j RATEEST, -m rateest

Thanks for the tip Jan -- but I've failed in my attempts to use this
target/module combo. I'm not entirely sure what my rules should be to
do something similar to the limit rule I posted.

I have indeed tried to figure it out from the docs, but the examples
there are hard for me to understand, and it doesn't provide any
English for exactly how the target and the module interact with one
another.

-- 
Darius Jahandarie
