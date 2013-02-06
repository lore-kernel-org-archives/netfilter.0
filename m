From: Lazuardi Nasution <mrxlazuardin@gmail.com>
Subject: Re: SNAT using the same internal address multiple times
Date: Wed, 6 Feb 2013 18:47:22 +0700
Message-ID: <CA+u3GuLhW4g2AgJDECbgJ3RJ=qnEckEC_iYiOFPU4deO0s9ChA@mail.gmail.com>
References: <738ED808-0B35-4645-9D73-3CB3B5CBC4D7@alex.org.uk>
	<1360147947.2455.0.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=4+6VU0x/OTW1qO+jzNPfzQjRBv2ydJYWKbm+ZeKv0Ow=;
        b=IRw43rNRjBZL5y4f0GB8ftpZgtxYcC2KGDsp8/yK0O57JL0pYNs6rlhMG2ZG4lxCmi
         mvCscSLM8O3f8DA0DZBWhV/dtZWlKixi3DEECIPvVKdkBuOcfBp+qrGZbc7GVH0MygQl
         sLznkqm5L0vhwaD8KE1OrqXdIu3tBK+7g5MLz74VcQdBwQe5cTqgquC+KPG2PEJfgROy
         sLSc9yZXvxwuSX7F6JqTmWfNNbHe0hWM9IZBMO5HUE4XzSmpjcHX99YMg9IJVaudCfVH
         gViuJ6N3FUg4vhAOB4L8fWjgGSmXSzJRO/OILoSWuf/m0o7NIx5GrrV2f6L24P1n0nNa
         I7dg==
In-Reply-To: <1360147947.2455.0.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: Alex Bligh <alex@alex.org.uk>, netfilter@vger.kernel.org

Hi Jimmy,

Why don't you use interface bonding/teaming for having multiple
interfaces with single IP address?

Best regards,

On Wed, Feb 6, 2013 at 5:52 PM, Jimmy Thrasibule
<thrasibule.jimmy@gmail.com> wrote:
>> Is it possible to use SNAT like this? (what I'm really asking is whether one can use the ingress interface as part of the NAT tuple):
>>
>>                   LINUX
>>    eth0 <-------- ROUTER ----------- 10.0.1.0/24
>>                   \\\\\\\------------ 10.0.1.0/24
>>                    \\\\\\------------ 10.0.1.0/24
>>                     \\\\\------------ 10.0.1.0/24
>>                      \\\\------------ 10.0.1.0/24
>>                       \\\------------ 10.0.1.0/24
>>                        \\------------ 10.0.1.0/24
>>                         \------------ 10.0.1.0/24
>>
>> Each private / internal address is the same on every interface. I plan to use
>> unnumbered interfaces and proxy ARP at the linux level.
>>
>
> Hi Alex,
>
> I don't really get what you are trying to achieve. Can you detail a
> little bit more?
>
>
> Jimmy
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
