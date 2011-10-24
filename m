From: Sergey Naumov <sknaumov@gmail.com>
Subject: Re: match a few ecn-ip-ect in one rule
Date: Mon, 24 Oct 2011 15:59:34 +0400
Message-ID: <CAH3pVZPTgqtPeHRvjQdaq+2Ekm-ZKBaX1TCz7fVX+uAEHoFXAA@mail.gmail.com>
References: <CAH3pVZOW=dQ+BrHJOsvQY5DXL-BhnV0uWiTG44JXKdQ_EeXwXA@mail.gmail.com>
	<alpine.LNX.2.01.1110241344010.21849@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=emcx9ROLZLYA2Y7jGEEXUXJ80m6S3jkl1zt94jOpCaU=;
        b=a5tQ5sAv8Yb06SRI7xqZdYHPYCNx1XemNrwEG7K3NFmDx/Mc2eI4njOlQla0raPpiG
         BQzhbQWl04x8qzHUCS/5tlq5L80xwiQ9cLq7DLQt575Wrxo6MHJT9NbwSDG7Ya76EDRS
         3AgZnKSF7b27TitCcTcNaRhjdr9fgGH0/fT9c=
In-Reply-To: <alpine.LNX.2.01.1110241344010.21849@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

> Since rules are generally combined in ORed, it only makes sense for
> matches to be ANDed (and submatch parts to be ORed at times).

Yes, I understand, but because of logic of project that I develop it
is better to use 1 rule than to search places where I have to add
workarounds to generate 2 iptables rules from 1 user specified rule.
When I use multiple -m molude inclusions, are specified parameters
combined as OR, as AND or overrided?
