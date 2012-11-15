From: Vladimir Budnev <vladimir.budnev@gmail.com>
Subject: Re: Iptables rules with module string give strange counter results
Date: Thu, 15 Nov 2012 21:28:47 +0300
Message-ID: <CAAvRK96v8DLti4hJwYwpCQAe0OBHOgSJtRnps9Ltv6jW+8qqOw@mail.gmail.com>
References: <CAAvRK96MCUh4XmeDVd8VU+P5_QvxO6D1_RYHxWBO6MPcOWCRKw@mail.gmail.com>
	<50A50EA7.6090001@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=siC7+rc2wWPjDwy1P6Vxk8CD1Q1mRYY/zXj1qfnsyNo=;
        b=VDV5oe8uCmOCreNhWtKTBOgj/Kc3mLdW0tUSJRrNYppSQNcU162F0WM7H+4AhAIGIK
         uk87bMGf11miFcANTdnzmqID42m3sXvYUxkDlvamKP76vX4BUWp2QGGfsc/OBvp7k+a3
         o6izQHNFbMOhcd+IVDrfNgpliAG/ocJTa+2cMfkbim3FWkEp10NKvtexoZiirSrQeLjT
         J1/3vVuQfpW0x9pqoeYcd0C5nKvU6ix2HXcRYBuvJL4iEn1qq5LyShm+GzxFWlzzdHck
         NCTPzpfaMuDhVQ2HlsxWEGVtW2A1Uh+WAVcbY6kKR90ZXK/8CR/fpqYzJTlC/E3gRDaj
         Xkig==
In-Reply-To: <50A50EA7.6090001@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: netfilter@vger.kernel.org

2012/11/15 Eliezer Croitoru <eliezer@ngtech.co.il>:
> Is this a router?
> The src is the machine or other machine?
>
No, its casual server. Iron and ugly :)
src host is ther server ip and the destination comes from browser
loading gentoo.org
Iv posted as simple example as could imagine and which illustrates
situation. To avoid some misconfiguration with postrouting or
prerouting or smth. It is just simple OUTPUT chain of filter table
