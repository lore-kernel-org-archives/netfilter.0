From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 02:20:39 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com> <alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr> <AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben K <benkloester@gmail.com>
Cc: netfilter@vger.kernel.org, Pablo Neira Aysuo <pablo@netfilter.org>

Don't strip Cc, and don't top post.

On Monday 2011-01-17 00:58, Ben K wrote:
>
>>Does anyone know if the --string-replace functionality ever made it
>>into iptables? If not, what are my chances of the patch from 2004
>>playing nice with the current Git head revision?

>Thank you for the speedy reply.
>
>So I'm guessing the answer to the main question below, about whether
>that patch ever made it into iptables, is "no".
>Is this because of the limitations of string matching with regards to
>packet fragmentation, as per your response, or for some other reason
>(eg unwanted complexity)?

Matching across packets would incur unwanted complexity.

>If the former, then why does iptables include the string match (but
>not replace) extension, which surely suffers from the same
>limitations?

You'd have to ask Pablo (cc'd) who added ipt_string.c 5 years ago to
the kernel, or even Emmanuel Roger who had it added 10 years ago to
the iptables userspace part.
