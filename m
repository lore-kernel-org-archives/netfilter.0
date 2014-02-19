From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Nftables HOWTO documentation updates
Date: Wed, 19 Feb 2014 16:48:26 +0100
Message-ID: <CAOkSjBgUNcY=vNTdDMi3FWTjRFk6xYaWRt5QaL2d3_nLL_F-Eg@mail.gmail.com>
References: <20140218112543.GA4799@localhost> <5304CA21.9040309@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=p2kAw7YhlUEMk686Add+R/WN94GxFXXMty6Gb8M2Lj4=;
        b=LBaljYysv5CCsQOPsH5dmt9G6GXJOK41wc0pr8RkNiBRVmkH0CwixrqKJoA6Y3koNJ
         ogcEktRyJ2fxf/ZdtZTjGF0EkzuC1d60pyH1kWTCrwGsmk0FToeUA/HLfbMwaL5/Lmwu
         ATSjpMLzzZg3R37bDTpjpyM1AsdjBCnrdZ6M95MJRim4RbcVjCtXkLJg2wkMcVEkXL3A
         fz7vTR8i8XGc8KqBoryhxAV26zCToGtKF83R291CT3/AqJpBGkFLTRUk5ATrseLKqo3m
         LdEYDyquKNIDl5i9Ak5n49Gw5zUkw0r8oE2lB85r1t+ch95fmVvNtQYiM/KJTdsK7xyv
         s9cg==
In-Reply-To: <5304CA21.9040309@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

On 19 February 2014 16:13, Dennis Jacobfeuerborn <dennisml@conversis.de=
> wrote:
> Is it possible to comment rules like in iptables? Comments in iptable=
s made
> it really easy to manage rules on a logical level i.e. I could define=
 rule
> "types" by adding a special comment like "TYPE:X" and then use that t=
o grep
> for these rules to batch-remove them or retrieve the counter values. =
It
> would be nice to be able to tag rules like this.
>

Not possible yet.
There are some details about the implementation that have to be
discussed. For example: how/where to store the comment.

As user, I'm also interested in this feature. Maybe we can add to the T=
ODO list.

regards
--=20
Arturo Borrero Gonz=E1lez
