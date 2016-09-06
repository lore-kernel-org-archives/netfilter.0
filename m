From: "Walter H." <walter.h@mathemainzel.info>
Subject: RE: Rule for PROTO=139?
Date: Tue, 6 Sep 2016 14:03:27 +0200
Message-ID: <36ec0fca76fb7517d5d82dc5f09fb3ae.1473163407@squirrel.mail>
References: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
    <3e24e1f4a88741f0979847f78ef0ecc1@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:Message-ID; bh=9l8Jh24q9TUI66lFcOI1nTdBipg5FUe8DE612g1ymfY=;
        b=z7VDVTAR48u4CMm9oMctWgz3nh+T2wGMMuInRoyY05ZNcSv4Bes52sWRnV0Id4TSbh2UxyhcSH+XIPXtIUoReF2MivZYpuZda0OhBF9iZ4pI6i+2lOoYdjopb+eB1pWWV6mHHm1Vu9mPDVvnZqDV0hlXx6biypJW/wO7Mv4hIqU=;
In-Reply-To: <3e24e1f4a88741f0979847f78ef0ecc1@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?utf-8?B?IkFuZHLDqSBQYXVsc2JlcmctQ3NpYmkgKElCTSBDb25zdWx0YW50KSI=?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

On Tue, September 6, 2016 13:51, Andr=C3=A9 Paulsberg-Csibi (IBM Consultant)
wrote:
> I will only add to the answers that this is not so widely used ,
> that fact that you see this these packets would suggest that
> one unit in your network with MAC 4c:72:b9:56:16:3e is using the HIP
> protocol
> to try to identify hosts within your LAYER 2 BROADCAST domain .

I see;

> You could block it and ignore it , but maybe you would like to find that
> MAC owner and check why it is using HIP .

yes this is my computer and the line came from my router;

> If it is some unit you manage , maybe you can "remove" it at the source
> and save your L2-BC from this traffic all together :-)

yes, of course, but where can I find the piece of software that is doing
this on my computer running WinXP Prof. x64 Ed.;

Thanks,
Walter

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Walter H.
> Sent: 6. september 2016 12:59
> To: netfilter@vger.kernel.org
> Subject: Rule for PROTO=3D139?
>
> Hello,
>
> does anybody know with which rule I can catch these entries:
>
> [317607.438061] IN=3Dbr0 OUT=3D MAC=3Dff:ff:ff:ff:ff:ff:4c:72:b9:56:16:3e=
:08:00
> SRC=3D0.0.0.0 DST=3D255.255.255.255 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=
=3D255 ID=3D1624
> PROTO=3D139
>
> Thanks,
> Walter


