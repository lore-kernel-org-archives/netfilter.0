From: Prashant Batra <prashant0100@gmail.com>
Subject: Re: ip6tables support for filtering sctp packets with specific ports
Date: Thu, 6 Oct 2011 22:56:49 +0530
Message-ID: <CAG+XuE7NH1cpxRWL8JsCZ8S_7LZZ09TtShVErLRTHb8wmzZVwQ@mail.gmail.com>
References: <CAG+XuE607ciut+hUOMUvE_5h98fE4xf7J48Oc9ecanGrFKhvoA@mail.gmail.com>
	<alpine.LNX.2.01.1110061741130.22969@frira.zrqbmnf.qr>
	<CAG+XuE5TXknTyie3qmAnV1msD-fe5-NqevYGOVKG6xqkFhBnGw@mail.gmail.com>
	<alpine.LNX.2.01.1110061906270.20232@frira.zrqbmnf.qr>
	<CAG+XuE7U6jzLOkT=5U2Y5ghofPthSifK-Rd4kQse9hbhmqrNpQ@mail.gmail.com>
	<alpine.LNX.2.01.1110061921030.12333@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=KXHuClKFRQ8D1pQcR0zayl0qj5/1A6iH3zpJQEwI6a8=;
        b=VNdNmAwG49WbqvgdWCp8sV+C/Q4tk1uDsECTuxCFBbHZiiCop9mcDJuTGyc0Bcrt4h
         Wu8yjouVj7ofjfbGFA3NC1EaybA/76QxhShUSObQnrgU0HeaiHHgMTJOZFs4EGJrIfr7
         LLjSOQjVxyq0nKxZMip0MF4hsXfpXtTAG3kwY=
In-Reply-To: <alpine.LNX.2.01.1110061921030.12333@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thanks

On Thu, Oct 6, 2011 at 10:51 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Thursday 2011-10-06 19:09, Prashant Batra wrote:
>
>>Ok,
>>Thanks Jan for pointers, so is this supported in the latest versions?
>
> Yes this is, and don't strip the Cc list, lest TOFU.
>
>>On Thu, Oct 6, 2011 at 10:37 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>>> On Thursday 2011-10-06 18:14, Prashant Batra wrote:
>>>
>>>>This is what I am getting-
>>>>
>>>>#ip6tables -I OUTPUT -p sctp --sport 3232:65535 -d 2001:db8:0:242::36
>>>>-s 2001:db8:0:242::37 -j QUEUE
>>>>ip6tables v1.3.6: Unknown arg `--sport'
>>>>Try `ip6tables -h' or 'ip6tables --help' for more information.
>>>
>>> Then your installation is broken, or, yes, now that I see it, your
>>> iptables is just way too old to support SCTP.
>>>
>>
>>
>>
>>--
>>Prashant Batra
>>Follow the dreams!!
>>
>
>



-- 
Prashant Batra
Follow the dreams!!
