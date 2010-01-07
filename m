From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: what should I use for "unassigned" ports?
Date: Thu, 7 Jan 2010 11:56:17 +0000
Message-ID: <56378e321001070356w255ec0bcm90e637403f2ff7fd@mail.gmail.com>
References: <4B44D277.3000801@verizon.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type;
        bh=8++y3XTrR5c9faejiMGnnCBpi5HDEiIqW2C+BPigGQo=;
        b=fOgSWLcnjwMZ+KeipiXC2a2W/8nM0F/7yUMcJbyqBNTdEmgAAjZ/vhe9Nk9n0aA5Vk
         3GN7wD1t1W472CzWPzFGT+dyGRBsK+jh5WoZqjAl8Wl7D+QTh+II6mY9ofFrGInMunaJ
         pzSJZ9x2LgZh6ePtbFFvYXO6hqlxqKvNX2dcA=
In-Reply-To: <4B44D277.3000801@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anthony Ewell <amewell@verizon.net>
Cc: netfilter@vger.kernel.org

2010/1/6 Anthony Ewell <amewell@verizon.net>:
> Hi All,
>
>
> Having taken a more recent look at "/etc/services", I
> am finding zillions of service ports above 1024.
>
> With that in mind, is there a better starting port
> for my "unassigned" ports?

If you are purely trying to block traffic which is to services not
running then you could just change the default policies to drop and
then only explicitly allow what you want which is alot safer.

If you need this for logging then place a log rule as the last rule in
the table.


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
