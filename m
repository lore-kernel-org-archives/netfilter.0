From: Azerty Ytreza <007liamg007@gmail.com>
Subject: Re: Problem with log which are corrupted and need help with hitcount
 and FORWARD rules
Date: Sat, 22 Oct 2011 17:33:36 +0200
Message-ID: <CACMGiwb3tXniJNt5vn6nBVqZjy8VUYWQkwg0GV=gVta5qzoaQw@mail.gmail.com>
References: <CACMGiwZ_gWF0nKaY9yfybm5OQ3=WDD6rA2P-V8TgeOsLysCxLg@mail.gmail.com>
	<1319289600.26402.6260.camel@andybev-desktop>
	<CACMGiwZ-4Q-xvVQOx3MM79U7YrwafcW+cMxsU932dRKfkM46GQ@mail.gmail.com>
	<1319293517.26402.6312.camel@andybev-desktop>
	<CACMGiwaJ69TsOb6gVH_GXLk09yKhxqLExa_s-NXhG8d9M2z7hQ@mail.gmail.com>
	<1319297250.26402.6316.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=+9dvV35prOiNUvovpzSevvQU0Oeq/5Ue3PIxsfwbDrw=;
        b=oWDwe9iqX+q2LKMKz7Ndv6S/YYX8YcCzY+FpG7Mkmd/jH6aPLP9thVqysgpP/IrucU
         TdUAs48qGGYkOSum5vqgdsMF02ug8MhOf41Jh7hzkXlmVLv+0pX+qlwZ0SCiMyZJa5Gw
         4afb+aFErn0HdgevafvCrvT0JERQzNdhNfiso=
In-Reply-To: <1319297250.26402.6316.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

**********************************************************************************************
> Just mean gateway/firewall server that all the traffic passes through.
>
> No doesn't work ... The port is blocked when I try these rules (copy
> of the INPUT rules) :
>
> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> NEW -m recent --set
> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
> NEW -m recent --update --seconds 600 --hitcount 1 -j DROP

You've got a hitcount of 1. Don't you mean 10 as you had in your first
set of rules?

> And sorry but I have never user mailing list. I don't known how it's
> work exactly :(

No problem, but please don't put your reply at the top. Put it either
within or at the bottom of the quoted email, just like I have for this
email. It makes it easier for other people to follow the conversation if
they've joined late or are reading it in the archives :)
**********************************************************************************************

Yes it's for test. The first time should work, the second request
should be blocked for 600sec.
But never block the connection so doesn't work :(

I doesnt choose... I receive an email and reply ...


On 10/22/11, Andrew Beverley <andy@andybev.com> wrote:
> On Sat, 2011-10-22 at 17:11 +0200, Azerty Ytreza wrote:
>> Just mean gateway/firewall server that all the traffic passes through.
>>
>> No doesn't work ... The port is blocked when I try these rules (copy
>> of the INPUT rules) :
>>
>> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
>> NEW -m recent --set
>> iptables -A FORWARD -i eth1 -p tcp -m tcp --dport 443 -m state --state
>> NEW -m recent --update --seconds 600 --hitcount 1 -j DROP
>
> You've got a hitcount of 1. Don't you mean 10 as you had in your first
> set of rules?
>
>> And sorry but I have never user mailing list. I don't known how it's
>> work exactly :(
>
> No problem, but please don't put your reply at the top. Put it either
> within or at the bottom of the quoted email, just like I have for this
> email. It makes it easier for other people to follow the conversation if
> they've joined late or are reading it in the archives :)
>
> Andy
>
>
>
