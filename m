From: Flavio Poletti <polettix@gmail.com>
Subject: Re: nf-queue.c as an example of libnetfilter_queue
Date: Tue, 23 Apr 2013 02:13:22 +0200
Message-ID: <CAM-TR1qMrqOvWk_Y5fVeY2BzgkQPG6QJR1x-4_pUsu2SRqRQdQ@mail.gmail.com>
References: <CAM-TR1qfrCA-SvkfpNbdFr9dYTpc53FmL4WOvzxJs9_M3f6H7w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:content-type;
        bh=SZoli/XafRq07BQ+WaFWbAqqhuXHQ/Dhf7KHUhVRqAk=;
        b=LlOjfI5kFAxJrzl78gRihDWKRaqPpJVhvkDDj/PKHqV09DqGcSHH5/6v1Y3HGyhwu5
         dXLuYz0ZXp56y4aK+9VaHX3qRF5mKY/VtbtptqSwy/kBMK46IUEuOEcPhABUjIfppuGN
         7rrSBV9HpVMvM8gLGE8CAYvxMRIevi+Lc0eO1950MkKjam0uqduox33lbd+k/DqE7bGc
         omZoUP9RtAmgGBpD5cj0UAopJu9fJZb3I1vC+wn9dl7j1etQRNW+tTVJNd7ski/D2BOl
         FzIs19cI7/L2xj9XPUqmSo0H9Mz2pw0FqcsQ92b+nHs+Oh89K2CjlYwAFHJIrGRKtYUd
         BEBg==
In-Reply-To: <CAM-TR1qfrCA-SvkfpNbdFr9dYTpc53FmL4WOvzxJs9_M3f6H7w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

The example file nf-queue.c program in the examples
directory does not seem to use the functions in the library at all.

Are they deprecated in favor of something else?

This is a repetition of a question I sent some 10 days ago, sorry for
bothering again
but I'm interested into this. Anyway I won't post it again if I get no
answers, please
accept apologies in advance if inconvenient.

Thanks,

    Flavio.
