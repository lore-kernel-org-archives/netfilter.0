From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: state match is obsolete 1.4.17
Date: Wed, 16 Jan 2013 09:27:28 +1000
Message-ID: <CAMD-=V+p0gv+amQearBpGPD0q3zALUEfQj6xCoTTg197jN3_5A@mail.gmail.com>
References: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com>
	<alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=NZ1zx0FVUyfQqfXTutNkyHRGR7j31CdfWXTZMLGm3ag=;
        b=mfv4WaTcsSODCwQdowef9maoKqbieTbeiXKm2APcO+j/FFuioy9orH6OE/RMsaAsa3
         HC9/LX6v4Qp7S1eSxIB0AqhkhZl5QMsUKf6gcQHmV+w6QfADTfJuEpgOeKaVb8Sxdz4A
         7D9+1opGnUHhwOTjyCdY9bkCbbb3uwchfHklJWKQwxOMC4P9luRxMz2x744lOxXGr2Wx
         lq3iAKOxjckTOvS/X9QrL4OsXbXbDFU7OCaK/0BW3m7fvz8lWnz7QcMUHHM3G0k1GQvY
         JYXojGf+L8M2MMVJ5EL2T+h1s2VaWv2VLpzCRZU16brfZvDNWolLOriNZ3UmeIHhGKot
         rigA==
In-Reply-To: <alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On 1/15/13, Jan Engelhardt <jengelh@inai.de> wrote:
>
> On Tuesday 2013-01-15 06:09, Nick Edwards wrote:
>
>>WARNING: The state match is obsolete. Use conntrack instead.
>>
>>Getting these errors since upgrading to 1.4.17
>
> It is a warning, not an error. (An error would not let use you
> the command at all.)
>
>>Am I right in assuming that :
>>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>must now become :
>>iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
>>or does that not do the same thing?
>
> state is a redundant subset of conntrack (the latter was introduced around
> Linux 2.5.32) and shall go away.
>

I can understand that if there is a lot of pre warning, as others have
mentioned, most guides show the former..

And can you confirm my change is the correct method to obtain the same
net result please?


Maybe the warning could be changed to

WARNING: The state match is deprecated and will eventually go away.
Use conntrack instead.

That wont panic people into thinking the rule is not working.
