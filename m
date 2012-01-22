From: =?ISO-8859-2?Q?Marcin_Miros=B3aw?= <marcin@mejor.pl>
Subject: Re: [xtables-addons] memory usage in module geoip (probably)
Date: Sun, 22 Jan 2012 21:53:08 +0100
Message-ID: <4F1C7734.1080506@mejor.pl>
References: <4F19928A.7050005@mejor.pl> <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr> <8b53c851c9391f9bc9ce3427acdbab4c@mejor.pl> <alpine.LNX.2.01.1201202156410.13241@frira.zrqbmnf.qr> <4F1C73DB.5060503@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mejor.pl; s=cokolwiek;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=9xMRBVgtZZrya9xP2IK0Uwc1fyQetDbxSyl2aWpyktc=;
	b=DeCfwLeqjKExE6ZSNVyMR26b+xhZ8cae7mIkmfzRwPrPfSygdqDmEU46CcpxbGJ2VnOnDUDQvxwN3yiP24KxEOXAtcSArcyZFpawFP47lpE6MB41KyeLTbpfpoBDUyJ2;
In-Reply-To: <4F1C73DB.5060503@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

W dniu 2012-01-22 21:38, Marcin Miros=B3aw pisze:
> Other host doesn't suffer such problem:
> bare metal, 3.1.5-hardened, i686, xtables-addons-1.37

I forgot mention, those kernel has patch taken from=20
http://www.ssi.bg/~ja/#routes
