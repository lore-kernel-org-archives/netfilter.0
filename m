From: Born Without <blackhole@airpost.net>
Subject: Re: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Mon, 31 Dec 2012 08:06:40 +0100
Message-ID: <50E13980.8000008@airpost.net>
References: <50DBE9C9.8090500@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
	 bh=+nDJthsM0iUJyUynJ+jp0ruIkW0=; b=FQVBshgrXkcJPhyyCEhmSIudeANG
	WliJKE8b9GM5uhEztp7MoLnLiyBB02yVi2ZsRPCeMRuS+Pf5b6bE/7OCtejBC75p
	40KZIV+PtkgICRvFXkzH3rlLz5Q5O8ONuV5ZFU+cuoJV9ieuykMU2eT7hvXqvK27
	eAD5R1gxtu72Su4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=+nDJthsM0iUJyUynJ+jp0r
	uIkW0=; b=BcntAPJJshVw3wg/1rjrRdLV1xwdhVFMln79TpmM/W87f2AVH7jXLM
	OefSjBe4foXoCMLO5Pyb+xaygOeS0sVFeAvBG7XVyjvlZz1J1X0W6ZZMw8sj+YkD
	roJRfnnCOYHMTDIe4cCeNHoCC3sNHYcT39og5oACuvM5imttLbswk=
In-Reply-To: <50DBE9C9.8090500@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 27.12.2012 07:25, Born Without wrote:
[...]

another oddity with osf:

if you try to restore a rulset using osf with iptables-restore, it will 
fail on the very last COMMIT without giving any clue what the error is, 
if the signatures were not loaded before with nfnl_osf.
