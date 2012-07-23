From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] iptables-restore: move code to add_param_to_argv,
 cleanup (fix gcc-4.7)
Date: Mon, 23 Jul 2012 13:29:06 +0200
Message-ID: <1343042946.2626.10727.camel@edumazet-glaptop>
References: <1343039903-7230-1-git-send-email-pablo@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:from:to:cc:in-reply-to:references:content-type:date
         :message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=XHvD9x3h79PHbx4gWt714Dxfy5JViatjWmTpXIyR5HE=;
        b=T4Gs01o1IF0mZ53cNYlMlY9f/BSK/xOFfAhzF3fFfRKEsX03z4A/AVAyITV8/HR8vO
         QEJX9O55yEjRM8yMQxwRWTbgyYPfB5VoMEUTt0YzP1RPGKhhjO4dTrpQkIiu0G2GKRYb
         bG0Sx9bT+4Jq9DpyMQ4nc4zfF27ROCPBheYVLGcp9jnVAUo95Gu8V7wrWoh3BRUWOnMz
         og3Wf8T+0xcA5xkrI2DuX++xo2TyJtn4gmHVg8vN/HZMTqaMTPmXwWIlLKZzoReN1DEs
         ExTn8yWqC9KoZbsKZ5iIodfQRDRlkLmq1V7VFJXkufnPNSGUFa442dJLyWa0erAtzPtC
         K/2Q==
In-Reply-To: <1343039903-7230-1-git-send-email-pablo@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pablo@netfilter.org
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Mon, 2012-07-23 at 12:38 +0200, pablo@netfilter.org wrote:
> From: Pablo Neira Ayuso <pablo@netfilter.org>
> 
> This patch seems to be a mere cleanup that moves the parameter parsing
> code to add_param_to_argv.
> 
> But, in reality, it also fixes iptables whe compiled with gcc-4.7.
> 
> Moving param_buffer declaration out of the loop seems to resolve the
> issue. gcc-4.7 seems to be generating bad code regarding param_buffer.
> 
> @@ -380,9 +380,9 @@
>                         quote_open = 0;
>                         escaped = 0;
>                         param_len = 0;
> +                       char param_buffer[1024];
> 
>                         for (curchar = parsestart; *curchar; curchar++) {
> -                               char param_buffer[1024];
> 
>                                 if (quote_open) {
>                                         if (escaped) {
> 
> But I have hard time to apply this patch in such a way. Instead, I came
> up with the idea of this cleanup, which does not harm after all (and fixes
> the issue for us).
> 
> Sorry, I didn't have the time to further debug this issue, but it would be
> worth to investigate what's going wrong and ping gcc people.

Bug seems that iptables forgot that "char param_buffer[1024];" can
disappear at the end of the block :

for (curchar = parsestart; *curchar; curchar++) {
	char param_buffer[1024];
	...
}

// here param_buffer[1024] is lost, so any var pointing 
// to it can mess stack

previous gcc were probably not so aggressive.



