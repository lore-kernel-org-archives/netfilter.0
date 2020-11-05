From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 13:41:53 -0500
Message-ID: <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc> <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m1tWCngaCArG0zSc6LK6GotEueWumY66qe9FqVZRaUM=;
        b=BG74NqDYyddzsDDGbZWJJRpujGUq724zpNFtpjACNUZ3Jo34h88n0y5RYheqK4vrv1
         Li+rcDs6pksgQmEjC77NziE/yeY4pmAf9O0w6NOpsrcgr+tRudq6VHXk573TOd7XjSYo
         xg1cwEg8BJ7r7I7CzksdAk6qll6/dsCZUJTl1H4PrZFXd5oGWZsGG4eUeX20Jj5uteoh
         SufDKUakGKFPxFsgxUd6kNzbSO/2E0AkRG+EhQKXAjioVBxqHQtllOSbq07UecrBTjON
         7O1rPgX6RTDVkIvkPKm++I10xmYY4qHaVNFHR5EaCnozmQ8mVQUXPFt6f8PY56IgwXyK
         60nQ==
In-Reply-To: <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

> However, this would only insert the flow table statements on server
> bootup. Since '/etc/nftables/firewall.nft' ttself *wouldn't* contain
> the flow tables statements, any 'systemctl reload nftables' or 'nft -f
> /etc/nftables/firewall.nft' action (to apply a rule change, for
> example) would essentially get rid of the flow tables mechanism from
> the running system, wouldn't it?

I guess there's no "equivalent" of iifname/oifname for flow table
devices where you could refer to a device that does not (yet) exist?

-Martin
