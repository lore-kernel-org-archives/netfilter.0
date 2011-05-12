From: Vieri <rentorbuy@yahoo.com>
Subject: Re: conntrack does not display bytes and packets
Date: Thu, 12 May 2011 00:24:18 -0700 (PDT)
Message-ID: <498331.51568.qm@web113311.mail.gq1.yahoo.com>
References: <508221305183189@web62.yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1305185058; bh=hpBI6ZCSZkLhxkpPuSAv+mnuwid+nRUmJrf8+ZSRo2s=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=Qv4LIksqn6d+M87tEnHWS3Wh8s3hXLpmXMG9tWuyLCyTqWmA9naTHiO0BLAdLV4w42D9gSRQUnyDx3FOMe+fv05n+o1bkP+j6648l1V8k+xTm0YFvWgfQEEqgLBaJXdHnfvfoJBdztP+DiZkiq3ZLeKHRTgtGTN++8HL9R0yPww=
In-Reply-To: <508221305183189@web62.yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org



--- On Thu, 5/12/11, "Oleg A. Arkhangelsky" <sysoleg@yandex.ru> wrote:

> I think you should set net.netfilter.nf_conntrack_acct=1 to
> enable conntrack accounting.

Thanks Oleg.
That did it.

Vieri

