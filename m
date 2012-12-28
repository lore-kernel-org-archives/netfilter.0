From: Born Without <blackhole@airpost.net>
Subject: Re: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Fri, 28 Dec 2012 03:38:09 +0100
Message-ID: <50DD0611.1050301@airpost.net>
References: <50DBE9C9.8090500@airpost.net> <50DC913A.1080409@airpost.net> <201212271819.08494.neal.p.murphy@alum.wpi.edu>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=Odpg3bTgTSymqsrZewE6w1QWKCY=; b=s+TEYYc+8JWtBSsxpt
	u8HeqoPGKF7LzW2QcBGjTKf5zNI8HUFohnL3V08uNhoX3o1b58/Y27qizsIyQsCg
	q/x+FFOxeUEBQ4crvQfLQSxlitKnimVF3uF2L/RcQvcS97KopvUxEznLsDhBvmLA
	C0DUXfCun8r72dg52ywkqBA7w=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=Odpg3bTgTSymqsrZewE6w1
	QWKCY=; b=WwPuMsum5CvmMvBF/vdcsiv+xMlBn3TxXjFudQmU7HVufmO/0/qMEq
	K2hAV8NnDdzj0o1BuQCwidWsbo+LBEB6hQisClSTjscY8VYCM2ZJZjImeOu0MDTK
	EmJO2yiaBr9HJV3bmICbFunU5HMn+6jPQMtGP7ILpatSKJAzCiMeU=
In-Reply-To: <201212271819.08494.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

On 28.12.2012 00:19, Neal Murphy wrote:
> On Thursday, December 27, 2012 01:19:38 PM you wrote:
>
>> Another thing I noticed is, that if negation (!) is used on the --genre
>> option, iptables -S or iptables-save position the negation wrong i.e:
>>
>> -A PROBERS -p tcp -m osf --genre ! Windows -j SET \
>     > --add-set other_probers src
>
> Is this 'infix' notation (--genre ! Windows) invalid already? Or is it just
> deprecated?

Produces an error applying it. So in the version I use, seems like.

