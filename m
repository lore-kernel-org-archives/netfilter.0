From: "Karolis B." <kbart.misc@gmail.com>
Subject: Re: --arpop question
Date: Thu, 23 May 2013 13:18:41 +0300
Message-ID: <519DED01.9010601@gmail.com>
References: <519DD861.5090800@gmail.com> <CAOkSjBg1zQvYuckOKZ5iUYmkDc0YH4q6ELhAiFGN5R+B+uZJ9g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=MSJjC+qJQPeshZrPMIgQqj8XyMWY4xdyx96tuzv6HPA=;
        b=z5SV5YMrsVKWvYEiUVJFfFQ/RKmCAFYkoZZ9g8nb4SYnJ8jXcxsaes7/+GrJiURqq1
         Mml0gslRkDUuWs8fUY7wzJPLqEJm+49AZENpPlYCBObgpjb6k80j8ZTjhlC9WJyJk8IL
         qE9U3NjxH8AlGNM6+0soWLp0ZfoCTt6no/YzwvDBX2aXjyxW39eoGgUUlv/cEYwT3gJd
         Jmk+TTUW+q4ybXaIgq6gVZ5FF1WDWvPulafyuWpKU6WQChOYH0MDqaO+ZJn616aDkqBV
         PvWpvWJwhBwCrRCElV3qoxtqAXp7MqVU8pHAuWPqWm7SMNyViDwvH3Au/olLRuc2iYGl
         BUnw==
In-Reply-To: <CAOkSjBg1zQvYuckOKZ5iUYmkDc0YH4q6ELhAiFGN5R+B+uZJ9g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 05/23/2013 12:52 PM, Arturo Borrero Gonzalez wrote:
>
> Hi,
>
> in my system:
>
> # arptables -A OUTPUT -o usb0 --arpop Request -j DROP
> Bad argument `Request'
> [...]
> # arptables -A OUTPUT -o usb0 --opcode 1 -j DROP
>
> i'm using Debian Wheezy with arptables 0.0.3.4-1
>
> Best regards.
>
> --
> Arturo Borrero Gonz=E1lez

That did the trick, thank you! My bad, looks like I was reading outdate=
d=20
man page on Internet..

Regards,
Karolis B.
