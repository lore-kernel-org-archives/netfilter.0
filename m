From: Victor Carceler <vcarceler@gmail.com>
Subject: Re: It's possible mark or classify packets per gateway in a multihop 
	route ?
Date: Fri, 4 Jun 2010 15:37:07 +0200
Message-ID: <AANLkTilzjjDjRiPij35lS48nuDO_Nd8mqwLyqFwvdhuF@mail.gmail.com>
References: <AANLkTinfTnSYngEUs3B7TTSTXt3cq9OHmIXEZEZNEDJB@mail.gmail.com>
	<alpine.LSU.2.01.1006041137160.29899@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=ejsGVp74g8hiZyv+CnFe+Dqae7J+gw8EbD1Hb/OcVC4=;
        b=KFBND7LkXBdG8qrZicRC6AT4vyyjuC6g4Gb4NALUx/qDuy7sUJbyVpVxWCBP4Fm4Dc
         yVHBU5s9gaZwioGZgTUX4FcLgDnlxTMLuldULrdNW7Q191m5megRx1moaMceDW5y2wTL
         0DQ62CdAxpxkz8bTsA2DOWEduQOdor7GlH7BM=
In-Reply-To: <alpine.LSU.2.01.1006041137160.29899@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hello Jan,

> make that
> =A0 =A0 =A0 =A0nexthop via 192.168.100.2 =A0dev eth0 weight 1 realm 1
> =A0 =A0 =A0 =A0nexthop via 192.168.100.3 =A0dev eth0 weight 1 realm 2
>
> so that you have realm values to match against.
>

it works !!!

Vielen Dank,
Victor
