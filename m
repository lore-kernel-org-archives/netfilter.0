From: netfilterdomo.20.miller_2555@spamgourmet.com
Subject: Re: Simple question about ip range
Date: Tue, 30 Jun 2009 10:46:45 -0400
Message-ID: <1dd941090906300746g30a79d63i8a78dc1d7082ad3a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type:content-transfer-encoding;
        bh=GYVbufFNW170oXsH0WEZcwms7oj+JKG2x1fjRsXuUWQ=;
        b=nUFXADbPnIVSqwz5NWcsJQCo0cYoHcqMomp5T7hY/IjAuwiVFURjTdRVuKjra8TQXN
         HJFKB1PqbkfScV8wVUyY7ppFoH8Kw7XW26W3BnWASqiUZUqX5A2kguQr1ertJ28Hb+MD
         H7Om0SwGRi0n8lJNw/KRbqcZB0EOHyfpTTnGg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, Jun 29, 2009 at 6:39 PM,
mysql.jorge@decimal.pt<+netfilterdomo+miller_2555+56b9305871.mysql.jorge#decimal.pt@spamgourmet.com>
wrote:
>> Sorry - finally read the man page.. try this matching string:
>>
>> -m iprange --src-range 192.168.1.211/32-192.168.1.219/32
>>
> Ah great!, yes it works, not your sample but in the format:
>
> -m iprange --src-range 192.168.1.211-219
>
> BTW, where did you saw it?
> I tried looking at "Networking Concepts HOWTO" and saw nothing.
>
>
>
>
>

Apologies for the bad syntax, but I'm glad it helped. I found the
option under MATCH EXTENSIONS (man page dated Mar 09, 2002 from a
Fedora 10 distro).

