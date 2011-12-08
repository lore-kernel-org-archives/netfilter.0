From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: Regarding updating netfilter rules from kernel space
Date: Thu, 08 Dec 2011 14:56:57 +0530
Message-ID: <4EE082E1.9000600@atc.tcs.com>
References: <CADAe=+KR0vsg8kULz3EuDWQVwZ+ojhAhOyaMV8bARBSMQ-Jhug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADAe=+KR0vsg8kULz3EuDWQVwZ+ojhAhOyaMV8bARBSMQ-Jhug@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ajith Adapa <adapa.ajith@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 02 December 2011 09:45 AM, Ajith Adapa wrote:
> Hi,
>
> I want to update "RULES" in netfilter from a kernel module similar to
> iptables doing the same update from user space.

I don't know whether netfilter exhibits any APIs for the other modules 
to do that.

However, I could think of a work around using "call_usermodehelper()". 
You can execute a userspace program (say, iptables) using this function 
from kernel space.

Regards,
Vignesh

>
> Is there any references or docs to above scenario which can help me out ?
>
> Regards,
> Ajith
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

