From: Born Without <blackhole@airpost.net>
Subject: Re: Wrapper script for ipset listing
Date: Sun, 06 Jan 2013 04:50:45 +0100
Message-ID: <50E8F495.40307@airpost.net>
References: <50E84F5E.8060704@airpost.net> <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=b/TqTjEkLtkbuW4CMrW2/VQx/Uc=; b=o2iZOdU35cv5TreYIy
	ouz/yrW3zvx4u/GhVaNHUQDjsVh9WzDm5V6oVGeQfog6CHYZVa/KKw8ehcNF3lLi
	MDRC6C8txP/g1hfK+824gRoNtX3KserQyKqYOjDtPwdf1li7Jw3QP7NrDb+ZCBfj
	nLj99/FjdZ52/yItADgVr3kec=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=b/TqTjEkLtkbuW4CMrW2/V
	Qx/Uc=; b=YGgWDVcgse6EhTUdYCLJTy+4uLcLA3HTXnS16E0RwUZ1Zt8IknKyDe
	Qf4+m3Bs3x7yOHInaSXW1F/5buXng0+VkwCkCs7zYt6x00yFPCi2mRY9f7C/j87c
	ksQmNrRtAiT46o+HZrY9gVEJNb3cZIYsg5LKO0Ur146YJtOPwDsGs=
In-Reply-To: <alpine.LNX.2.01.1301051809460.23031@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05.01.2013 18:10, netfilter-owner@vger.kernel.org wrote:
> On Saturday 2013-01-05 17:05, Born Without wrote:


>> As I was missing those features in the ipset set listing capabilities:
>>
>> - show sum of set members
>> - suppress listing of headers
>> - choose a delimiter character for separating member entries
>>
>> I wrote a little wrapper script (for the bash shell) to support them.
>> For those who like, you'll find it attached.
>
> There's libipset, with which this task should be achievable to the
> maximum customizable degree without involving ugly text parsing with sh.

Hello Jan,

good you mention libipset, because not even the man page does, nor does 
any documentation or similar exist.
Interesting, that you belittle text parsing, it's such a common task in 
linux. And thank you for telling us, that C has more power that sh. 
Really great insight!

