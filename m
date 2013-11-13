From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Multiple mangling
Date: Wed, 13 Nov 2013 13:07:57 -0300
Message-ID: <CACuyg25QY2xKLkd6vj6-jF6jFLJTxfAJF3XeLkeFLYgJwuyxkQ@mail.gmail.com>
References: <1384202754.19072.44.camel@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=o8v24fduBa2eRwApH+pwV716uXM+2cf4Fu4MCzU0r80=;
        b=jpB/a5aMNDqKp6nx/MDA5ji4ou3oOwjX3wKAV52TsBM7J0uOnjLHOUYnU/UM3G7Til
         czh8pV4kCBVV5w7ufHdjob3IZM11OJOdEgQhVNpuLcmBg/nvPlOfnc7BEJPR98dPvHgh
         cR2eA2mc+6vPh6qdUxa7vncqKHQBryO/DDz75wqWuwA1cfPZWWyBeEzQl7WMAj3LgvsK
         oV7BPWMUXcQXX+yltaCKF+UKln7mwxOd3xgvF6igVdHVa2nvudF8hfSZlMMaZ/ftoJse
         kmUf6wWIc79VtFyz4rDa+CvEPHpUWFpuzFNw+a8l9slDRM7isOf5fXMhX5sQ8+C9AKSR
         v0Og==
In-Reply-To: <1384202754.19072.44.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikolai Lusan <nikolai@lusan.id.au>, netfilter@vger.kernel.org

Hi,

The DSCP and CONNMARK/MARK targets are not decisive.
The last rule processing determines what will be done with the packet.

Both controls can coexist.
The markings (MARK) are made internally (by conntrack) - its a local
control (only your kernel works with this).
And the DSCP is set in the IP header (in the address space of the TOS).

Thus, other routers on the network can open the ip packet and identify
the DSCP value that you set.



2013/11/11 Nikolai Lusan <nikolai@lusan.id.au>:
> Greetings all,
>
> I am at the point in writing my "new and improved"(tm) firewall where I
> am adding QoS. I am marking the packets in the MANGLE table with DSCP
> values, but I also want to mark packets again so that my iproute2 qdiscs
> can have an easier time handling them. This requires that I mark the
> packets twice (i.e. once with "-j DSCP --set-dscp-class AF32", and again
> with "-j MARK --set-mark 6").
>
> The question is: can I do this with consecutive rules in the MANGLE
> table? What is the behaviour once a packet has matched a rule in one of
> the MANGLE table chains? Does it continue to drop through? Does it
> effect a RETURN?
>
>
> Thanks in advance.
> --
> Nikolai Lusan <nikolai@lusan.id.au>
