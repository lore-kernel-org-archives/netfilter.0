From: gapsf@yandex.ru
Subject: Re[2]: nftables: introspection capabilities?
Date: Tue, 24 May 2011 16:14:58 +0700
Message-ID: <1510322597.20110524161458@yandex.ru>
References: <3210442595.20110524152136@yandex.ru>
 <alpine.LNX.2.01.1105241030410.13058@frira.zrqbmnf.qr>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1306228499; bh=s2HAmM7Ja1OycofYd0kifqT6yQVzK3IJOVigiWzXf0w=;
	h=Date:From:Reply-To:Message-ID:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=WlnrFlnm2ULEf/CDzLZkh3yBj0OBTSn1bOyfh4HkuOEQq30sdZuILC0GPDp5a26G1
	 PmMFheSLNhW8F7MfmX+i2PkOOSQIpoe5rwrKaQZpCfSli5VVDTPNpDpXxAuupfLT+w
	 aa+0+lCj28P9QBfSkERQzpzliy+7ovMw/ijKJnWM=
In-Reply-To: <alpine.LNX.2.01.1105241030410.13058@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

>>There is no doubt that for nftables frontends will be written too, so the question is:
>>"Will nfatbles be able to find out various information
>>about their own current state: tables, chains, rules, etc?"

JE> You can already obtain this information by using libiptc, iterating over 
JE> all rules and testing for a particular src/dst address (very much like 
JE> poor man's `grep -s 1.2.3.4\b` on the text output).
According to Wikipedia "libiptc ... shouldn't be used as a public API,
and is known to change, which breaks programs that use it"
and libiptc is a 3d party project - not netfilter.org's and outdated, isn't it?

As for nftables: means native capabilities of it's kernelspace code (aka virtual machine).

