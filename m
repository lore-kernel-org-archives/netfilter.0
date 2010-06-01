From: Ashok Rao <greatarbor@gmail.com>
Subject: Re: openwrt Atheros ar71xxx based router reboots with RAWDNAT, 
	RAWSNAT
Date: Tue, 1 Jun 2010 10:34:53 -0400
Message-ID: <AANLkTikLx4s6RFiY0SjD-bUgnOfrJu0fuvG-EJckzv0H@mail.gmail.com>
References: <AANLkTimCBl0ADwbcVsW1wVSeDuXMF0Rd2lNLeTks-DxC@mail.gmail.com> 
	<AANLkTil5j_AA2gGBkhnolVwpXbnzkQ4xzxX0GzTERNin@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=2a7c1qYXQsAEtTqjXbcitoTwFke4Ct2kIOt6wwY9YWQ=;
        b=kTfJoX0o6q14KiQ+crFuvQqM0OmkNhJe+3uOXhHSGdRHyCeMMEftGNG953JNB1fjKs
         DP+Z8MiLjBo0pouuYXeRfp+MT4/RN8dCH4ObpK1UYDWSguulYzo2zOrUa2gg+RHbYzvf
         7KdxZj8G/KxJ5ZLhCg/16O1/pdPQ1Jp1SCEkY=
In-Reply-To: <AANLkTil5j_AA2gGBkhnolVwpXbnzkQ4xzxX0GzTERNin@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, May 28, 2010 at 11:19 AM, Ashok Rao <greatarbor@gmail.com> wrot=
e:
> On Mon, May 24, 2010 at 9:09 PM, Ashok Rao <greatarbor@gmail.com> wro=
te:
>>
>> I have to open up the router and break the warranty =A0to install a
>> serial console cable and haven't done that yet. In the meantime, if
>> anyone has a clue please =A0post
>>
>> Ashok
>>
> Installed a serial cable however the kernel OOPs message was not
> particularly informative (something relating to an invalid memory
> access - =A0which I should have captured but did not ). I then
> recompiled the kernel with a number of debug options. With the new
> kernel, however, the router does not reboot. I'm going to go back and
> keep only the minimal number of debug options. Can any of netfilter
> gurus give me some pointers on what KERNEL debug options might be
> sufficient. ?
> Here's what I've enabled so far
>

With a new compiled kernel (with or without debug options) there are
no  reboots. So most likely the earlier problem was because of
inconsistencies with my own build of xtables-addons  and the snapshot
on openwrt.org.
