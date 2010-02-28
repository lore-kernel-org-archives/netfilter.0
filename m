From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: linux-next netfilter: xt_recent: Add an entry reaper
Date: Sun, 28 Feb 2010 05:34:37 +0100
Message-ID: <1267331677.9082.46.camel@edumazet-laptop>
References: <20100228033841.265CFF8BB0@sepang.rtg.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=Hx2OTfOjsGPd+M7zsZUFRKsPuYYb7erDirkPUicpB+k=;
        b=gPfky5PaM/yDZcCRZZAqZe9hzgRMbti7jFgnVf6+LaAxbUleFxY5/akxO5UpN8gLm6
         7PvTcaHSPDL9FlyIIhIOGs7CrpEfDNk08xBQaRAe0MVCTbFm3yapu99K8DBr8nl557G4
         ofN7qQa7jpll5e40F0jSoRjmHBtKjMOfL+oQQ=
In-Reply-To: <20100228033841.265CFF8BB0@sepang.rtg.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tim Gardner <timg@tpi.com>
Cc: kaber@trash.net, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Le samedi 27 f=C3=A9vrier 2010 =C3=A0 20:38 -0700, Tim Gardner a =C3=A9=
crit :
> From 03b1a0171cd3b7eb680ec738ddcc21c59688f6fe Mon Sep 17 00:00:00 200=
1
> From: Tim Gardner <tim.gardner@canonical.com>
> Date: Sat, 27 Feb 2010 20:22:07 -0700
> Subject: [PATCH] netfilter: xt_recent: Add an entry reaper
>=20
> One of the problems with the way xt_recent is implemented is that
> there is no efficient way to remove expired entries. Of course,
> one can write a rule '-m recent --remove', but you have to know
> beforehand which entry to delete. This commit adds reaper
> logic which checks one entry on the LRU list each time a rule
> is invoked that has a '--seconds' value. If an entry ceases
> to accumulate time stamps, then eventually the reaper will
> encounter it in the LRU list and remove it.
>=20

Might I ask why do you want to remove expired entries like this, using
cpu cycles in the fast path ? I dont understand why you need this reape=
r
pointer given we already have lru_list to give us the oldest entry.

1) They are normally removed in recent_entry_init(), when a new entry i=
s
about to be added.

2) All entries are flushed when
	echo clear > /proc/net/xt_recent/<tablename>

3) You could eventually implement a purge operation to remove all
expired entries at will

      echo purge > /proc/net/xt_recent/<tablename>



