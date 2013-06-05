From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: Locally transmitted Multicast packets are being looped back,
 even if IP_MULTICAST_LOOP option is set to zero
Date: Wed, 05 Jun 2013 06:46:43 -0700
Message-ID: <1370440003.24311.249.camel@edumazet-glaptop>
References: <51AF172C.9090803@india.tejasnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:mime-version;
        bh=FyL0cjnz3RACOC2wLj5cLpISf5HEQeD8yupVQOC0AFw=;
        b=lCe/hq5tffluPlcH00b4CSppGW8+CDx42Jau1fj8bRudTlwC4H5p11z6yD4Hzqflvw
         bki1HQS2QKK0qULmUb0j/xAI+4PS6/O/HizLySw/0UZw0KtUbWgNV45ZYjhl6T8GCl1o
         BXFnOZXsnplswGRTZO/bHOjqozWfZrNh+YPsINHzPKamaHtPXpHkuXD7PgdRIPO8w4WV
         OVcjWgcFzgHxagnhyJnycxHfbQlRpvhqep9WFCCytMLkntWvcVSEkWsE8pHWeq3Y25J/
         cqkxDuQe/r+1qNfX8yMenHsDSQPNYeKHlgkWgJiXbZorbtop0N2ph4vhbf3QubdifDRz
         J+0w==
In-Reply-To: <51AF172C.9090803@india.tejasnetworks.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vijay Tandeker <vijayt@india.tejasnetworks.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Wed, 2013-06-05 at 16:17 +0530, Vijay Tandeker wrote:

> My questions:-
>   - Is this done intentionally ?
>   - If No, please suggest the solution to restore skb->sk pointer.
>   - If Yes, please suggest the solution to restore skb->sk pointer.
> 
> Kindly let me know in case if the problem is not clear or you need any 
> more data.
> 

Have you tried 

int one = 1;
setsockopt(fd, SOL_IP, IP_NODEFRAG, &one, sizeof(one));


