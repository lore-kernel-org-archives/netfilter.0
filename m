From: kapil dakhane <kdakhane@gmail.com>
Subject: Re: [PATCH] tcp: Fix a connect() race with timewait sockets
Date: Wed, 2 Dec 2009 11:18:24 -0800
Message-ID: <99d458640912021118y42a6fe4bm7b742a2046ad7a3b@mail.gmail.com>
References: <99d458640911301802i4bde20f4wa314668d543e3170@mail.gmail.com>
	 <4B152F97.1090409@gmail.com>
	 <20091202.005937.177088443.davem@davemloft.net>
	 <4B163226.50801@gmail.com> <4B164293.7070804@gmail.com>
	 <20091202113213.GA18453@ioremap.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=LyUzh+SjkKbFetqf7o3lXYuYaqpMnlI5j3jxsheOCtc=;
        b=vwjy4b9rY+fSS3xoDYSrIOts+X0ki4DuzW06mFF0DC8soXhu4h8SztS46w1bg5E9sI
         dK8gXB6hI4noxwHtNVQV7zL/mHPmMg6YGdPZpuaGxI+xEE664vq2pP+U0YqjGphbYNhL
         ksa/2S9nIQ0Ljgvp2IF/pupefd0msuzBzfHD4=
In-Reply-To: <20091202113213.GA18453@ioremap.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, netfilter@vger.kernel.org

Here's the list of tuning parameters used:
net.ipv4.tcp_keepalive_intvl =3D 5
net.ipv4.tcp_keepalive_probes =3D 3
net.ipv4.tcp_keepalive_time =3D 180
net.ipv4.tcp_fin_timeout =3D 10
net.ipv4.tcp_max_syn_backlog =3D 8192
net.ipv4.tcp_max_tw_buckets =3D 360000
net.ipv4.tcp_tw_reuse =3D 1
net.ipv4.tcp_tw_recycle =3D 1
net.ipv4.tcp_syncookies =3D 0
net.core.netdev_max_backlog =3D 5000

Kapil

On Wed, Dec 2, 2009 at 3:32 AM, Evgeniy Polyakov <zbr@ioremap.net> wrot=
e:
> On Wed, Dec 02, 2009 at 11:33:55AM +0100, Eric Dumazet (eric.dumazet@=
gmail.com) wrote:
>> You need several threads, using sockets with REUSEADDR set,
>> and bind() to same address/port before connect() to same target.
>>
>> We need another patch to correct this.
>>
>> I wonder if always hold lock before calling check_established()
>> would be cleaner.
>
> Isnt this a too big overhead?
>
> --
> =A0 =A0 =A0 =A0Evgeniy Polyakov
>
