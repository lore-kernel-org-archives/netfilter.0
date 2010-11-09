From: Angel Inkov <bl8cki@gmail.com>
Subject: Re: Verdict with ebtables?
Date: Wed, 10 Nov 2010 00:41:54 +0200
Message-ID: <AANLkTimbn=c3yO0o9fPoV4rQz-K_PPSyjVRWui5f0msz@mail.gmail.com>
References: <AANLkTinCazaFKSXnfGe2e0nnfeRorV7AHcadQaxGvWg+@mail.gmail.com>
	<AANLkTikpfZCpcTqWAo5ONO6dJvFfruEJXCbam4EbPVdT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type;
        bh=N780JOxZ8tJqjy6eSlaPVW9pyFNjFMngmhlK4Hrc//Q=;
        b=ov92sWSQAfqnbr4mJQJMy6o99kcVOo0rTiGRqSFoux8qmL9cMrIg8m4M0YTqpxyI/T
         gTLnJDGf4mB4JHD7SG3LJeI4Nplr3rwwBZcFiWN/dnkBxRd6detAodrfMJYswTsvdvyA
         NcGcWeaw/PymjjLmM8f6FsjrWnB9Dd9iANXMo=
In-Reply-To: <AANLkTikpfZCpcTqWAo5ONO6dJvFfruEJXCbam4EbPVdT@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kfir Lavi <lavi.kfir@gmail.com>, netfilter@vger.kernel.org

maybe using nflog with drop target in the rule can help you
