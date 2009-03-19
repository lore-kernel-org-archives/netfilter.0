From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Outgoing redirection with iptables - TCP skips NAT?
Date: Thu, 19 Mar 2009 15:55:59 +0100
Message-ID: <17e3a8f80903190755m58be3d8ere3b3392c8e0c98d6@mail.gmail.com>
References: <17e3a8f80903190409w3b5d8822qef94af9106f08f21@mail.gmail.com>
	 <20090319144343.312510@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=gyoqEKUpZeLWxTYjBUwvBWar7OPO3Upeokw5nPJa8Xc=;
        b=pCQR6Uy31MuiUvosJoGBwvXm2e2iE1iBsLogzk6tPZgl6mbrxSEV8n9OyBXr2U+TXa
         9mTXqRH7s1DzcKsdfGkTTSkIxdtMwx2ZUpAYUth4Oe+IbtOqWr94hULB0Ai1oijVySRI
         8jAc8Ge55jvUO9sntFIh2pu9rC1aoVbNIJZA4=
In-Reply-To: <20090319144343.312510@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wlet@gmx.net
Cc: netfilter@vger.kernel.org

Hi,

> I guess this won't work because if you connection is established it will be stored in a TCP State table which is used for filtering and forwarding.
> If you connection already exists it makes no sense to check it against all rules from the ruleset.
>
> UDP doesn't have a statetable (cuz it's stateless) and that is the reason why this works.

Thank you very much, that explains a lot. Is there any way to force
TCP packets through the NAT-filter without writing a module? I have
found out that it sort of works using conntrack -F and rules, but that
is so ugly that I really wish I hadn't found the solution :) I know
this violates more or less every TCP principle, but the reason I want
to do this is because the receiver is multihomed as well. So my plan
is to intelligently stripe data over the links and do it transparent
to the application.

-Kristian
