From: Kyle Sanderson <kyle.leet@gmail.com>
Subject: Re: iptables doesn't function properly with x32.
Date: Mon, 1 Jul 2013 20:11:03 -0700
Message-ID: <CACsaVZKZU9YLkSJR0zKUYYJBVf_95HsPReR6sM9qy23P2SXBzg@mail.gmail.com>
References: <CACsaVZJWLLYtfcDnbAWj6N_8mi5EHPvf7zND5Csyi_UDMj0Q_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=6o6be5I7LYssa3ll1+BTI1Z2uDQhXPPv3Kx9VJMSUHw=;
        b=wSW9lLUn3W/OvROEZ+uF0PBq5LU+E1HLkQgATh/Nrs4Zdk26/MqMDM5q8YxtPa/0vg
         Utr8U9mF1QUpfWvsKXGpBm60aRZbUB+oO76+fBEKMZGpaP14+lnZfdB+GxwEwStTp+wZ
         Q4Z3qkFtwenK4f9zNsE8+HW4qFAyZnJ/fUTiofjuvYm3+mBhX1qmi3A5FOL7LCm+1A3y
         hQcVl5hfOS7r/M9s6ctIeRyOUsLPQeK7WfXwatVUUlcfEvbVFDgBIcAJPF1s4/2pUBl3
         EhIuElx5jf1hzitFz0BSvVMudwZbGbrB803OS2LkBe+6RVDAQSwZvViIw/ANrvZjqXJU
         FJrQ==
In-Reply-To: <CACsaVZJWLLYtfcDnbAWj6N_8mi5EHPvf7zND5Csyi_UDMj0Q_A@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netfilter <netfilter@vger.kernel.org>

Took me a while to figure out unfortunately, forcing m32 or m64
definitely works to restore functionality. My guess is the types don't
line up somewhere (expecting 8 byte pointers on x32), which will
result in a mismatched size, and then the error. Hopefully this helps
someone!

Kyle.

On Mon, Jul 1, 2013 at 12:44 PM, Kyle Sanderson <kyle.leet@gmail.com> wrote:
> Hello,
>
> I can't seem to get iptables functioning on my x32 system. I've tried
> versions (1.4.16.3 and 1.4.19.1), however both result in the same
> error message: can't initialize iptables table `filter': Invalid
> argument.
>
> Walking through the error with gdb shows the failure is in a call to
> struct xtc_handle * TC_INIT(const char *tablename). The function if
> (getsockopt(h->sockfd, TC_IPPROTO, SO_GET_ENTRIES, h->entries, &tmp) <
> 0) sets errno to EINVAL, which results in the failure. fw in #Netdev
> seemed to indicate the compat layer might not be being used due to the
> platform change.
>
> I've tried various recompiles of Kernel 3.8.13 and Kernel 3.9.8. I'm
> running iproute2 as well, this is all on Gentoo.
>
> Thanks for your time,
> Kyle.
