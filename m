From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] netfilter: xtables: stackptr should be percpu
Date: Mon, 31 May 2010 16:16:12 +0200
Message-ID: <1275315372.3291.51.camel@edumazet-laptop>
References: <1275303998-2435-1-git-send-email-dfeng@redhat.com>
	 <alpine.LSU.2.01.1005311350580.31799@obet.zrqbmnf.qr>
	 <1275311580.3291.44.camel@edumazet-laptop>
	 <alpine.LSU.2.01.1005311519340.25402@obet.zrqbmnf.qr>
	 <1275313448.3291.49.camel@edumazet-laptop>
	 <alpine.LSU.2.01.1005311608570.20623@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=FoEpAsO/lQpEKSoEdkw0jRklku8ktFXEo5S0yDBFCXI=;
        b=BKmrZHLJi1at5v0YKeXMJH6DQsdHd9XV0AVpQKC2tbKZlqSXjEeddij3Ytn4UnGnt/
         WxjJp070avZpTN7RxnVUCMrvtvi1kYZtd1gZGRh4wxTwqqGs1Lj9t3ge24hjdFVCx8nq
         A7NphFS/OEf56pevqSkxC5iHzKIUrMpltoX48=
In-Reply-To: <alpine.LSU.2.01.1005311608570.20623@obet.zrqbmnf.qr>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Xiaotian Feng <dfeng@redhat.com>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Patrick McHardy <kaber@trash.net>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Alexey Dobriyan <adobriyan@gmail.com>

Le lundi 31 mai 2010 =C3=A0 16:09 +0200, Jan Engelhardt a =C3=A9crit :

> Keep your friends close, and your enemies closer ;-)
>=20
> 	git describe --contains f3c5c1bfd


Yes, --contains should be the default, and --predates the option :)

This is a bit OT anyway :)


--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
