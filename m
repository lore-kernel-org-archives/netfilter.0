From: Vieri <rentorbuy@yahoo.com>
Subject: Re: conntrack not displaying bytes and packets
Date: Thu, 12 May 2011 05:48:31 -0700 (PDT)
Message-ID: <104658.65073.qm@web113315.mail.gq1.yahoo.com>
References: <4DCB9854.5080805@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1305204511; bh=BfyluoDlKEAJv9cvAieUOPSOxS/k2B4hN2/ETm6B69c=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=R9S6TBAEAcJKmGlz+G9HIVGHKyyxQov9Uocg5rT11wCkys43lzgzZjUq+qWn69XSefJCCT/tQXqHF9Bp1O53l4UscR4lK4B6uCU2aRNpYJKQoMLIlQBS0D91OoflriTMAUBquN+Pp+pO6+bgjVkZhI0Mc/WHOQttNy5DFprCRrM=
In-Reply-To: <4DCB9854.5080805@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, pablo@netfilter.org



--- On Thu, 5/12/11, Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> echo 1 > /proc/sys/net/netfilter/nf_conntrack_acct

Thank you!

