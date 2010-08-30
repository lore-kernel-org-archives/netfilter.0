From: Tomasz Chmielewski <mangoo@wpkg.org>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Mon, 30 Aug 2010 20:38:33 +0200
Message-ID: <4C7BFAA9.7080701@wpkg.org>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org> <4C7BF4FD.6040601@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wpkg.org; h=message-id
	:date:from:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=default; bh=lmYe/K1BT
	sqLD+6Vp4fehwDK5/Y=; b=luQz39z349puWltnagoPVEAYwqpJqg7FOWl1cWhgK
	aqlZL5FYEiQdC/atCm2T/VjoVlUgwlXK3dMDwwRL/MJbISBPujMD7wSXtOoUxNMy
	1A2Qu4eOAXNHr7QbLpAfmgABZWtR19XU9vpg6EAkaP1BNql0tS/OR+ExIffaXs+R
	jw=
In-Reply-To: <4C7BF4FD.6040601@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 30.08.2010 20:14, Pascal Hambourg wrote:

>> With these rules, I'm not able to communicate (i.e. ping) with other
>> hosts in the same subnet, except the gateway (although this was the same
>> with my previous rules, I think).
>
> Of course these rules are just a part of the ruleset. Did you do the
> same for all other bridge ports and hosts in the subnet ?

No, I did not.

So even if it's blocked on one bridge, rogue MAC/IP can still "get 
outside" and interfere with other bridges/guests?



-- 
Tomasz Chmielewski
http://wpkg.org
