From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: conntrackd crash after few seconds
Date: Thu, 5 Jun 2014 18:04:32 +0200
Message-ID: <CAOkSjBh2GUYpOzTRCVMfT+B9Kyr2JDExUsAZzTKXdRO6oyGiRQ@mail.gmail.com>
References: <53908A7E.4020802@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=/q2advF/VXGe8w6A/D7SyBU0tUBCJHFSnedYLxpbHpQ=;
        b=OzKBhXXY6pY+UDZfLsBoI38le6m4UUnkYfkgEbje2KJpgx8+XfTnWpoxEG8y9AcV/8
         6YvIrkmA84nZreChUkC6lWz93rXDJ56DyusknZxk/g2vi4XrUcVbjLa7wfGtONDSyRN6
         RBTG9t+/XH4s4l/n9ZEqkhMn5dCHVM6p/y2VQwAa++zepOU2PG9RZat4LtjwWhQPko7K
         fSb/yRD417kbaydaJdziBD5PUZ5vn/Pho4RNFhKoCBwCH1t+RwTwvX83pl94ePAzJYUU
         tp1Z87vEFMElkJhC7wpnIuo+YXzDRcxYQhGZCeWBDKjjl+d6/FNHDMqLGhC93PNyMD6X
         YM3g==
In-Reply-To: <53908A7E.4020802@yahoo.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Nicolas RENAULT <nicolas_renault@yahoo.fr>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 5 June 2014 17:19, Nicolas RENAULT <nicolas_renault@yahoo.fr> wrote:
>
> others informations , i use the same conf file without any problems o=
n
> squeeze (2.6.32-5) with .
> ii  conntrack                          1:0.9.14-2 Program to modify t=
he
> conntrack tables
> ii  conntrackd                         1:0.9.14-2 Connection tracking=
 daemon
> ii  libnetfilter-conntrack3            0.0.101-1
>
> only a every two hours avg load peak activity.
>

Is this the same as the Debian bug #746464 [0]?

regards.

[0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D746464

--=20
Arturo Borrero Gonz=C3=A1lez
