From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: System becomes unresponsive due to kernel oops (IP: dev_queue_xmit+0x256/0x3f4)
Date: Wed, 05 Nov 2014 21:18:38 -0200
Message-ID: <545AB04E.1020600@gmail.com>
References: <CADMv6S=oOo9cuGLpBy3Ap10SDa=MvcjaR+v=FCHEFj0ur_aZkw@mail.gmail.com> <5458F80F.7060405@gmail.com> <CADMv6SnvnVo6Fq-_LVQEAq70wChoVPJFvJLONjL_LKr9FqZT1w@mail.gmail.com> <CADMv6Sky5H=ep08UgUWDpgYjMeeJn_FHRK2R0Le0kCQNrXvA0w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=ioky+oIw20TF3yIL6dOHF17CTR/Yp7THKLVyCULszmk=;
        b=OsRAespfZVnXjAJOQ2AoHWpoeWQsCP46JyNyZbOzEDtLsgMNoXfXl/Q87TxKL0kYE8
         tAwG6VI6uggBNJetRCEKa0f78NTWKJae2q1ieDT00vQGKaC6ll049ENFKkUPvlInnTdw
         s4yBmu5A7QEv1nryKjZSMPE1+RyXZtx/BuQgB8cgUM9qGuwGD3GAuQeRQ/NBaIkTC3Si
         Z/MXM2wx36tLrjlMCwzmDCoWJKROwRqwYOH3/piuebsFO2tLNRSPohw8PLF7YVZVSqBF
         pYfrCNdMxDJvlmost/dz3Z2lp2ryGQuzP97myTBKLBjMTx+QTwU43jkUwoWv5rNTaED8
         k3jw==
In-Reply-To: <CADMv6Sky5H=ep08UgUWDpgYjMeeJn_FHRK2R0Le0kCQNrXvA0w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: prasad zambare <prasadzambare@gmail.com>
Cc: netfilter@vger.kernel.org

On 05-11-2014 14:33, prasad zambare wrote:
> Hi All,
>
> With 2.6.39 kernel and e1000e I had no luck and again the system gets
> unresponsive. This time the change is I got "Kernel: Disabling IRQ
> #57" message which is repeated for numbers 51, 48, 54. cat
> /proc/interrupts shows these numbers are associated with configured
> network interfaces. This time I did not get serial console logs as I
> made a mistake while connecting serial console. Tomorrow I will again
> try to reproduce this issue with proper serial console setup.
>
> Now I not sure if this is the same issue or I have hit a new one.
> Please share your views on this tryout.

If you're deploying a custom kernel, what stops you from trying a newer 
one, like 3.17? :)

Marcelo

