From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 19:36:52 +0200
Message-ID: <d39744a20902190936u48f082d9p7c0da22a6948e6d8@mail.gmail.com>
References: <499D9292.902@colsmemory.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=lOjalJq6apbKUPNBPW8ot1BwGkb25Bntx2lB/CtlJCg=;
        b=GEmPzIVPpH90gviTOFqhDDDb44MZx1Q93+zdp81Cejn9BDjhRoKdg0TohI3h2PooAY
         BrMgtz+wIhgIcUPjHUwqBGKXTLrL8HogHehzzEAk67LLp8fTWxhRvSBdJOs7E3xNlaBi
         6uamrUxFysi5ftUMkwyZEZtYdLtRiTYKeh0SI=
In-Reply-To: <499D9292.902@colsmemory.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Colin Davis <col@colsmemory.co.uk>
Cc: netfilter@vger.kernel.org

I'm not sure if that can be done with the netfilter itself.
You could always get a script into crontab to check if the rule is
matched (iptables ... -L -n -v will show you number of packets matched
by the rule) and set up some sort of a timer.

Ivan

On Thu, Feb 19, 2009 at 7:10 PM, Colin Davis <col@colsmemory.co.uk> wrote:
>
> Hi,
>
> Not sure if this is possible. I wish to create a rule that once created will
> automatically expire (and be removed) after say 10 minutes.
>
> Please
>
> Many thanks,
> Colin.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
