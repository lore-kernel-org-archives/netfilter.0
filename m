From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: randconfig build error with next-20140113, in net/netfilter/nft_reject.c
Date: Mon, 13 Jan 2014 13:12:49 -0500
Message-ID: <CAP=VYLqWGjOnH0uw_=JDYEy2p-V5a0y3DvfuNGi600ZVPgVjRA@mail.gmail.com>
References: <CA+r1Zhjqrmm8a9fVsjfXamCE1qQq=YBexpeU95ODi=BiSie7aA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-type;
        bh=jszXYyEFGD4jr+5lXJ1yGx1Yo1hIVTa0j5+9rgiUpBQ=;
        b=iJXz23/ePbRRNGx4v7QqIioE9tQ8MYc3LEYQOWSEgELRrYi/a7T+6pLQ5JFw11nGtK
         OGeK59maOk8shA6HOIW3X3HfRm5+1zQ36JMzBtXZuTZEKTl8FuJYhVoKoklboGJDMnoR
         6eHlF89OZLPR4w4RQeXAB0rdy/2e/b2sDoQS72gmzYf26/vzP0q1Q2ruLEeBkACzeo44
         Eb5kFb5XEKLXqoHIRUvLQb64ah3wx/B0EAGwGL1vVHk7Xza4xkfb79yVZ5YRN+4/5wsB
         XI65UzvSKsWG2IK/iDCuj+c1HbguOXFCLq/jKpQXDYbgySJrO1wuZEHHpQsS4DnEWI4B
         +Vgw==
In-Reply-To: <CA+r1Zhjqrmm8a9fVsjfXamCE1qQq=YBexpeU95ODi=BiSie7aA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, pablo@netfilter.org, Patrick McHardy <kaber@trash.net>, kadlec@blackhole.kfki.hu, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev <netdev@vger.kernel.org>

On Mon, Jan 13, 2014 at 8:51 AM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> warning: (NF_TABLES_INET) selects NF_TABLES_IPV6 which has unmet
> direct dependencies (NET && INET && IPV6 && NETFILTER && NF_TABLES)
> warning: (NF_TABLES_INET) selects NF_TABLES_IPV6 which has unmet
> direct dependencies (NET && INET && IPV6 && NETFILTER && NF_TABLES)
>
>   LD      init/built-in.o
> net/built-in.o: In function `nft_reject_eval':
> nft_reject.c:(.text+0x67bc1): undefined reference to `nf_ip6_checksum'
> nft_reject.c:(.text+0x67c28): undefined reference to `ip6_route_output'
> nft_reject.c:(.text+0x67d09): undefined reference to `ip6_dst_hoplimit'
> make: *** [vmlinux] Error 1

I came across the same thing independently while working on an
unrelated netfilter patch.  Bisected and fix sent.

http://patchwork.ozlabs.org/patch/310298/
