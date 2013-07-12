From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: iptables Qu: how to specify !dst:port
Date: Fri, 12 Jul 2013 14:10:41 +0200
Message-ID: <CAOkSjBibSebbEvOfnZRQgLO4_tKHPTcyCJ-YpKaU60J_9sWWBA@mail.gmail.com>
References: <51DFEFC1.6070708@die-optimisten.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=kmQ1x+bEC0jGKKf7EHpkwna2yZEbEJvmAhpkDcWzRTM=;
        b=RPmrTEjQghugnjza30NASmpuCFAyzST9tNLnR5vg7OgzsmOxhl/umHCQzsuW007XNK
         W8aEHSHazCihOmkGFR/bnuJQZ0ug3DafaLokCYinOGQR8oYhyrapO+kg/niV15WbGkhU
         rXkwWnjNcgf1Geh4FauFOsJlxYSKMuULGJySr3dqORCBaDb4ThcG7F9Ud1Uy6uYddJ3j
         KbuK557593dQVBBsIHZwHNrjJLRCX1NIT6A/oVGIRJU38PFN7rvvQfiNSuDu0D7Bx6Ix
         kHN+QFHOCoPY4FcGs63RJ07ue8btgW5pqy79+8+xfxg93kycWDMXc9z7VP+9YP4F2+Ks
         0iqg==
In-Reply-To: <51DFEFC1.6070708@die-optimisten.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Die Optimisten <inform@die-optimisten.net>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

2013/7/12 Die Optimisten <inform@die-optimisten.net>:
> Hallo!
>
> I want to DNAT all incoming 0/0:443, except those to localhost:443
>         to my proxy localhost:8000
> What is the best line to achive that?
>
> -d 0/0:443  -and ! -d 127.0.0.0
> # seems -and does not exist...
>
> THANKS,
> Andrew
>
> Please be so kind, and also answer to me per email, I#m not in the
> mailinglist
>

I would try this:

iptables -t nat -A PREROUTING ! -d 127.0.0.1 -p tcp --dport 443 -j
DNAT --to-destination 127.0.0.1:8000

Regards.
--
Arturo Borrero Gonz=E1lez
