From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: linux-next netfilter: xt_recent: Add an entry reaper
Date: Mon, 01 Mar 2010 21:40:20 +0100
Message-ID: <1267476020.2843.0.camel@edumazet-laptop>
References: <20100228033841.265CFF8BB0@sepang.rtg.net>
	 <1267331677.9082.46.camel@edumazet-laptop>  <4B8AB4BE.7080206@tpi.com>
	 <1267388436.9082.84.camel@edumazet-laptop>  <4B8AF877.4080001@tpi.com>
	 <1267409855.9082.103.camel@edumazet-laptop>  <4B8C2264.2040808@tpi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=Ml6ObW7V4CSyIwA5ZKtBvpVxgAEry3c7hJWzIoeKhGg=;
        b=CRJ+ixB4EydqD4p4XE05WH6AwL7nVHJlnNS6YkZ3G8R6QwNLb9JicFkeSQBpzk7QS7
         58ZXxRlPRsER/HcjmrZSmNwArmgLbOk7uyQeeqNBEf3ZLjOBQ4CqTmZbyYUv9MEMz/qJ
         Q0D2HZPl6gMHNqr61n6cYGdXV78SGtchaCrnA=
In-Reply-To: <4B8C2264.2040808@tpi.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: timg@tpi.com
Cc: kaber@trash.net, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Le lundi 01 mars 2010 =C3=A0 13:24 -0700, Tim Gardner a =C3=A9crit :

> Agreed, see attached.
>=20

This seems fine, thanks

Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>



--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
