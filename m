From: Pete Kay <petedao@gmail.com>
Subject: Re: newbie question on netfilter-conntrack
Date: Mon, 21 Jun 2010 10:53:03 +0800
Message-ID: <AANLkTil8IKlJrWMwW12VlNPyFHWge1zXr5UUFWnsO_0g@mail.gmail.com>
References: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
	<alpine.LSU.2.01.1006201415260.26430@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=BGeIvVekHVn7gan9gaZl3pbnj/PujYsNuRZylat+Tm8=;
        b=caugK2mCXDvaorY3yAuNOTDaTjNPYZOWcL+wp4VXDypIiOn4UWwN2xAndfPPQRvHMK
         aXmYSvsuVVRbd7nWgTq6saaRTs2wr9ONkn64xm45eAUYBKi1ByOq99gOpinctFlExSSV
         L8mhd7KvfNaHeb7mutw9d6+gKsVTi0ShW5U9M=
In-Reply-To: <alpine.LSU.2.01.1006201415260.26430@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi,

I need to do a fast UDP proxy, so i am looking for ways that I can
insert/remove 1000 entries/s.   I tried iptable but it is too slow.
Therefore, I am looking to use conntrack-tool to insert the entry to
see if it can be faster.  Does anyone know if that is possible?  I
have trouble figure out how to use the conntrack-tool's conntrack
command ( -I option).  Can someone please give me an example?

Thanks,
P

On Sun, Jun 20, 2010 at 8:15 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Sunday 2010-06-20 13:41, Pete Kay wrote:
>
>>Hi,
>>
>>I am new to netfilter-conntrack so please excuse me for my simple que=
stion.
>>
>>I am trying to set up a rule such that any UDP packet coming from a
>>specific IP:port will be redirected to another IP:port. =A0Could some=
one
>>please give me an example how this can be done?
>
> Why not just directly connect to the right tuple?
>
