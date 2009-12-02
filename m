From: Ashwani Wason <ashwas@gmail.com>
Subject: Re: [PATCH] tcp: Fix a connect() race with timewait sockets
Date: Wed, 2 Dec 2009 08:05:51 -0800
Message-ID: <fd1a5ee40912020805r7a490ea2mdf7dc8597b9973b8@mail.gmail.com>
References: <99d458640911301802i4bde20f4wa314668d543e3170@mail.gmail.com> 
	<4B152F97.1090409@gmail.com> <20091202.005937.177088443.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=W4bAG5maPv/Eyql6pPVKLJrf8YzfrxRWRKrBWtPPKko=;
        b=RcDMdQGQQpFOSvNwIE95xdQnDvmoJehVLnGcy6N8PuI2055/GwcL2OaWtGNj9bnq4Y
         QRDaF9oE5doFCgqHnfS2xJZ/Nm1HQBUeezQmgISyydQGKxzH1elsHJfjZPiEKH9n0IaB
         41PNzDODVNsNo+Tkat7WdettkCP+QNPB2Gl70=
In-Reply-To: <20091202.005937.177088443.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Miller <davem@davemloft.net>
Cc: eric.dumazet@gmail.com, kdakhane@gmail.com, netdev@vger.kernel.org, netfilter@vger.kernel.org, zbr@ioremap.net

Both reuse and recycle were enabled for this test. (I know because we,
Kapil and I are working together on different aspects of this.)

- Ashwani



On Wed, Dec 2, 2009 at 12:59 AM, David Miller <davem@davemloft.net> wro=
te:
> From: Eric Dumazet <eric.dumazet@gmail.com>
> Date: Tue, 01 Dec 2009 16:00:39 +0100
>
>> [PATCH] tcp: Fix a connect() race with timewait sockets
>
> This condition would only trigger if the timewait recycling sysctl is
> enabled.
>
> It is off by default, and I can't find any mention in this bug report
> that it has been turned on.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
