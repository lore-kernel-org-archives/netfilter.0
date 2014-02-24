From: test account <850.test.email@gmail.com>
Subject: Re: Unable to Block Individual Ports from the LAN to the Internet
Date: Sun, 23 Feb 2014 19:30:35 -0500
Message-ID: <CAPNjXEkKKJKdhnfs7hBR3U8dyO9sQbnyz4ttBE=Gjsv_QJk3zQ@mail.gmail.com>
References: <CAPNjXEmGdBJaFFRs0xsLHQxBui6SFZ9ku=sr816Pd+xcw_nU8A@mail.gmail.com>
	<530A475A.8040207@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=Ui/9Uy6y0vdUrnTdfcAW+ccHshzTcRVHqvUVRDn5VTU=;
        b=EJa8G3CBeUO0fxrR5ujWNFiKjlZTUYu6xb2HBxqYDYEc4vdMzR0wtmLwHKv8QQMkmI
         Ada9WLq7K/VRvBYAtmpumeHD5CqXVqM9ZgTt3AUFps0zZVDL8hSXxBHlIIndUViqGcRV
         CmrvBeh5JuU4IA4zyR8wcU34FSzhmxEZ5r98CWY2kjIMZpCzjapjNDCHuu5doNT0/s1S
         ofULP/+HCsZuS/36pg9MD9XIBjkdrSJd9HWzZgJ1oxSahRpcVFUIesN0uPYQLYU3tJVt
         EGZJdRZmVQBBrQWYROMhL8PAy6dWTT2mcMlS2HHpbFtE2oCbWwL25ateEvGXVhVUhe0n
         laqA==
In-Reply-To: <530A475A.8040207@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Sun, Feb 23, 2014 at 2:09 PM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
<SNIP>
>
>> If I then add this rule.
>>
>>           IPTABLES -A INPUT -i eth1 -p tcp --dport 1:1054 -j DROP
> [...]
>>  I would think that would block just about everything again
>
> Not quite. It is the INPUT chain, so it just blocks packets destined to
> the ports 1-1054 of the router itself. It does not block packets
> destined to the outside, nor packets destined to a port above 1054 (why
> this value by the way ?).
>
> If you want to filter packets between the LAN and the public internet,
> use the FORWARD chain instead.

Thanks for taking the time to reply.  Your responses got me on the right track.

As for the 1054, it was just a number pulled out of the air for
testing purposes.

Thanks again.
