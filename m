From: Mekabe Ramein <mrmrmrmr@gmail.com>
Subject: Re: LED trigger in iptables
Date: Fri, 25 Dec 2009 20:58:26 +0200
Message-ID: <5c0c5c050912251058i46003d19j6cdcb41e92500331@mail.gmail.com>
References: <5c0c5c050911241359m7c8aeccqad728fe3272cb3e3@mail.gmail.com>
	 <5c0c5c050911261315h2daea812rac027c51fd4df2bd@mail.gmail.com>
	 <4B0F94D4.7020002@trash.net>
	 <5c0c5c050911280039y623e8c40pbe69ce7fa57965fb@mail.gmail.com>
	 <5c0c5c050912031453y6bb1a1fbhf9dfd34cd7a7c465@mail.gmail.com>
	 <4B18A8F4.7040902@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=07RCwM6y/nKLLxa4pT6pCRY93z6ZEXNsbNIA8GM1QWA=;
        b=XoTRvCkgz+C62vU7BQSxHNnqbCzDIrgrlaodLt12E/+Lro1oF3Ak7cN3AjZ18GCY4L
         Hs6pWm/angw6SluEzyzouQgTkUlS5zwMQFlHxeuNAb0zOetzFc980nfK5zky1aizypoy
         ykj1KB+xkjTH/ia/ukiONbyOiegb0O0UUxXCU=
In-Reply-To: <4B18A8F4.7040902@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

On Fri, Dec 4, 2009 at 8:15 AM, Patrick McHardy <kaber@trash.net> wrote:
> Mekabe Ramein wrote:
>> On Sat, Nov 28, 2009 at 10:39 AM, Mekabe Ramein <mrmrmrmr@gmail.com> wrote:
>>> On Fri, Nov 27, 2009 at 10:59 AM, Patrick McHardy <kaber@trash.net> wrote:
>>>> The LED extension hasn't been merged yet because of some open problems.
>>> Thanks for that information.
>>> But isn't it interesting to see it added to stable kernel sources ?
>>> The module is there but iptables does not support it. How can I use it ?
>>>
>>
>> Any idea about this issue ?
>> How can I use the LED trigger feature which is available in kernel ?
>
> I suggested a fix to the author of the LED target, but still waiting
> to hear back about it.
>

Hi,

Is there any news about the LED trigger support ?

Thanks.
