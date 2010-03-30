From: Changli Gao <xiaosuo@gmail.com>
Subject: Re: NetFlow / sFlow / IPFIX network probe proposal
Date: Tue, 30 Mar 2010 22:29:56 +0800
Message-ID: <412e6f7f1003300729g1f30c8f5ibddd2d6e7b13ce00@mail.gmail.com>
References: <faefb3f11003300706x16b73a2coefe5079284583db2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-net-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:received:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=bWTI5CzIRvUEiny2AyvmlTdW6BKWstr61wqrIv0eh94=;
        b=ellb7zcZND29PZGpALkm0GUCMgoGbBFiJt9C3e4OdJmwPR0+3a5lV5eZsbmjnCzNvI
         2xO+D9vsNa5GQ/bMDkg8SvGFJXf8OpUFLvTB86FDicvGfHFW/fwUZbETT9W7JkP9wvHW
         6KLXN0OGfg/pliRw2Ul/POlpZKQMdfZwORJKw=
In-Reply-To: <faefb3f11003300706x16b73a2coefe5079284583db2@mail.gmail.com>
Sender: linux-net-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Roman Tsisyk <roman@tsisyk.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, linux-net@vger.kernel.org

On Tue, Mar 30, 2010 at 10:06 PM, Roman Tsisyk <roman@tsisyk.com> wrote=
:
> Hi All !
>
> I would like to discuss about a little module idea.
>

I am interested in this feature. FreeBSD supports netflow v5, and
netflow v5 is more common, we can support it first, then add others.


--=20
Regards=EF=BC=8C
Changli Gao(xiaosuo@gmail.com)
