From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [PATCH] netfilter: NF_HOOK_COND has wrong conditional
Date: Thu, 11 Nov 2010 21:49:26 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011112148100.30863@obet.zrqbmnf.qr>
References: <20101111190954.29005.61686.stgit@paris.rdu.redhat.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20101111190954.29005.61686.stgit@paris.rdu.redhat.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Paris <eparis@redhat.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, kaber@trash.net, linux-kernel@vger.kernel.org

On Thursday 2010-11-11 20:09, Eric Paris wrote:

>The NF_HOOK_COND returns 0 when it shouldn't due to what I believe to be an
>error in the code as the order of operations is not what was intended.  C will
>evalutate == before =.  Which means ret is getting set to the bool result,
>rather than the return value of the function call.  The code says
>
>if (ret = function() == 1)
>when it meant to say:
>if ((ret = function()) == 1)

Thanks for catching. Indeed (ret = f) == 1 is desired, as can be seen in 
patch 2249065f4b22b493bae2caf549b86f175f33188e.
