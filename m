From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 20:51:55 +0530
Message-ID: <AANLkTilBAxOHBF_pZbaDDFnnUXaVVqm-45csjEI3ze1U@mail.gmail.com>
References: <hsgu5c$d8c$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ZkR1meBUp3k5oz2XPDLftaD4i9OyuHgWqEzY5HU5y5s=;
        b=oSkfAXzTQM7u/Yb+zsKbtBwJoibAhXf1isP5lvXWQdxfpjNH2QPEPXl9VKJDKokRbg
         afIQN1XWnKM/UTV4nUS+G3/BZ2XcA7pOGTEdnjw1NGzP1RSnZHLmsYYU/31pfULTb0Qq
         ecahR6OwNQJyz7ypwtivuLolsLREsFUGJgBAg=
In-Reply-To: <hsgu5c$d8c$1@dough.gmane.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netdev@vger.kernel.org, Netfilter mailing list <netfilter@vger.kernel.org>

On Thu, May 13, 2010 at 6:47 PM, Markus Feldmann <feldmann_markus@gmx.d=
e> wrote:
> Hi All,
>
> i am still experiment with iptables and the state extension. Some of =
my
> rules shall catch packets with the state NEW, but it doesn't catch al=
l
> packets. Sometimes there are packets that have the SYN Flag set which=
 go
> through my rules with the state NEW.
>
> Any idea why?
> I thought SYN is included in the state NEW, is that wrong?
>
> What is the difference between SYN and NEW?
>
> regards Markus
>
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Please use  netfilter-users list advise of  experts in netfilter  .
-Ratheesh .
